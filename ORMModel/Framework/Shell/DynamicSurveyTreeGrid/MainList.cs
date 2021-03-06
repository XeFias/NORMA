#region Common Public License Copyright Notice
/**************************************************************************\
* Natural Object-Role Modeling Architect for Visual Studio                 *
*                                                                          *
* Copyright � Neumont University. All rights reserved.                     *
* Copyright � ORM Solutions, LLC. All rights reserved.                     *
*                                                                          *
* The use and distribution terms for this software are covered by the      *
* Common Public License 1.0 (http://opensource.org/licenses/cpl) which     *
* can be found in the file CPL.txt at the root of this distribution.       *
* By using this software in any fashion, you are agreeing to be bound by   *
* the terms of this license.                                               *
*                                                                          *
* You must not remove this notice, or any other, from this software.       *
\**************************************************************************/
#endregion

using System;
using System.Collections;
using System.Collections.Generic;
using System.Diagnostics;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using Microsoft.VisualStudio.VirtualTreeGrid;

namespace ORMSolutions.ORMArchitect.Framework.Shell.DynamicSurveyTreeGrid
{
	partial class SurveyTree<SurveyContextType>
	{
		/// <summary>
		/// main branch provider for a SurveyTree, implements IBranch, main branch can be retrieved from RootBranch
		/// </summary>
		private partial class MainList : IBranch, ITrackSurveyElementLocation
		{
			#region survey question display struct
			//TODO: ask Matt, probably want to move this inside of the survey along with myCurrentDisplays, and have the survey manage it all
			private struct SurveyQuestionDisplay
			{
				public readonly SurveyQuestion Question;
				/// <summary>
				/// Limited to Sorting | Grouping
				/// </summary>
				public readonly SurveyQuestionUISupport CurrentGrouping;
				// UNDONE: AnswerOrder
				///// <summary>
				///// Allows reordering of answers in the display
				///// </summary>
				//public readonly int[] AnswerOrder;
				public readonly bool NeutralOnTop;
				public SurveyQuestionDisplay(SurveyQuestion question)
				{
					Question = question;
					CurrentGrouping = new SurveyQuestionUISupport(); // Choose Sorting or Grouping

					// UNDONE: AnswerOrder
					//AnswerOrder = new int[Question.CategoryCount];
					NeutralOnTop = (question.UISupport & SurveyQuestionUISupport.SortNotApplicableElementsFirst) != 0;
				}
			}
			#endregion //survey question display struct
			#region Constructor and instance fields
			private readonly List<SampleDataElementNode> myNodes;
			private readonly Survey mySurvey;
			private readonly List<SurveyQuestionDisplay> myCurrentDisplays;
			private BranchModificationEventHandler myModificationEvents;
			private int myAttachedEventCount;
			private ListGrouper myRootGrouper;
			private SurveyTree<SurveyContextType> mySurveyTree;
			private readonly object myContextElement;
			private int[] myOverlayIndices;
			/// <summary>
			/// Public constructor
			/// </summary>
			public MainList(SurveyTree<SurveyContextType> surveyTree, object contextElement, object expansionKey)
			{
				Debug.Assert(surveyTree != null, "SurveyTree required");
				Survey survey = surveyTree.GetSurvey(expansionKey);

				myNodeComparer = new NodeComparerImpl(this);
				mySurveyTree = surveyTree;
				List<SampleDataElementNode> nodes = new List<SampleDataElementNode>();
				myNodes = nodes;
				foreach (ISurveyNodeProvider nodeProvider in surveyTree.myNodeProviders)
				{
					if (contextElement == null || nodeProvider.IsSurveyNodeExpandable(contextElement, expansionKey))
					{
						foreach (object elementNode in nodeProvider.GetSurveyNodes(contextElement, expansionKey))
						{
							nodes.Add(SampleDataElementNode.Create(surveyTree, survey, contextElement, elementNode));
						}
					}
				}
				mySurvey = survey;
				myContextElement = contextElement;
				List<SurveyQuestionDisplay> currentDisplays = new List<SurveyQuestionDisplay>();
				myCurrentDisplays = currentDisplays;
				int surveyCount = survey.Count;
				for (int i = 0; i < surveyCount; ++i)
				{
					currentDisplays.Add(new SurveyQuestionDisplay(survey[i]));
				}
				nodes.Sort(myNodeComparer);
				foreach (SampleDataElementNode node in nodes)
				{
					// Use the indexer instead of add in case there is a referenced element that is
					// current being deleted.
					object element = node.Element;
					ISurveyNodeReference reference;
					if (null == (reference = element as ISurveyNodeReference) ||
						0 != (reference.SurveyNodeReferenceOptions & SurveyNodeReferenceOptions.TrackReferenceInstance))
					{
						mySurveyTree.myNodeDictionary[element] = new NodeLocation(this, node);
					}
				}
			}
			#endregion // Constructor and instance fields
			#region root branch and survey properties
			/// <summary>
			/// Get the root branch for this list. The root branch may be
			/// this branch, or a grouping branch if the list is currently grouped.
			/// </summary>
			/// <param name="recreate">Always recreate the grouping branch. Otherwise, create if necessary.</param>
			public IBranch GetRootBranch(bool recreate)
			{
				SurveyQuestion question;
				// UNDONE: This is placeholder slop, it needs to depend on the display settings to pick the top-most SurveyQuestion
				if (mySurvey.Count != 0 &&
					(0 != ((question = mySurvey[0]).UISupport & SurveyQuestionUISupport.Grouping)))
				{
					ListGrouper grouper = myRootGrouper;
					if (grouper == null || recreate)
					{
						myRootGrouper = grouper = new ListGrouper(this, mySurvey[0], 0, myNodes.Count - 1, true);
					}
					return grouper;
				}
				myRootGrouper = null;
				return this;
			}
			/// <summary>
			/// Raise the specified event for the given branch
			/// </summary>
			/// <param name="e"></param>
			private void RaiseBranchEvent(BranchModificationEventArgs e)
			{
				BranchModificationEventHandler handler = myModificationEvents;
				if (handler != null)
				{
					handler(this, e);
				}
			}
			/// <summary>
			/// provides the survey that this class contains, current applied questions can be accessed through the survey
			/// </summary>
			public Survey QuestionList
			{
				get
				{
					return mySurvey;
				}
			}
			/// <summary>
			/// Retrieve the context element passed to the constructor
			/// </summary>
			public object ContextElement
			{
				get
				{
					return myContextElement;
				}
			}
			/// <summary>
			/// Get the node at this index.
			/// </summary>
			public SampleDataElementNode this[int index]
			{
				get
				{
					return myNodes[index];
				}
			}
			#endregion //root branch and survey properties
			#region sort list methods
			#region IComparer<SampleDataElementNode> Members
			private readonly IComparer<SampleDataElementNode> myNodeComparer;
			private sealed class NodeComparerImpl : IComparer<SampleDataElementNode>
			{
				private MainList myParent;
				public NodeComparerImpl(MainList parent)
				{
					myParent = parent;
				}
				int IComparer<SampleDataElementNode>.Compare(SampleDataElementNode node1, SampleDataElementNode node2)
				{
					if (node1 == node2)
					{
						return 0;
					}
					object element1 = node1.Element;
					object element2 = node2.Element;
					List<SurveyQuestionDisplay> displays = myParent.myCurrentDisplays;
					int displayCount = displays.Count;
					int retVal = 0;
					int answers1 = node1.NodeData;
					int answers2 = node2.NodeData;
					for (int i = 0; i < displayCount && retVal == 0; ++i)
					{
						SurveyQuestionDisplay display = displays[i];
						if (0 != (display.Question.UISupport & (SurveyQuestionUISupport.Sorting)))
						{
							// UNDONE: AnswerOrder
							// int[] order = display.AnswerOrder;
							SurveyQuestion question = display.Question;
							int answer1 = question.ExtractAnswer(answers1);
							int answer2 = question.ExtractAnswer(answers2);
							if (answer1 != answer2)
							{
								if (answer1 == SurveyQuestion.NeutralAnswer)
								{
									retVal = display.NeutralOnTop ? -1 : 1;
								}
								else if (answer2 == SurveyQuestion.NeutralAnswer)
								{
									retVal = display.NeutralOnTop ? 1 : -1;
								}
								else if (answer1 < answer2)
								{
									retVal = -1;
								}
								else
								{
									retVal = 1;
								}
							}
						}
					}
					if (retVal == 0)
					{
						// Categorization left us hanging, fall back on the custom sort
						// followed by the survey name.
						ICustomComparableSurveyNode customCompare = element1 as ICustomComparableSurveyNode;
						object contextElement = myParent.myContextElement;
						if (customCompare != null)
						{
							retVal = customCompare.CompareToSurveyNode(contextElement, element2, node1.CustomSortData, node2.CustomSortData);
						}
						if (retVal == 0 && null != (customCompare = element2 as ICustomComparableSurveyNode))
						{
							retVal = -customCompare.CompareToSurveyNode(contextElement, element1, node2.CustomSortData, node1.CustomSortData);
						}
						if (retVal == 0)
						{
							retVal = String.Compare(node1.SurveyName, node2.SurveyName, StringComparison.CurrentCultureIgnoreCase);
						}
						if (retVal == 0)
						{
							// If this is a node reference, then use the combined hashcode of the target and the target element
							// instead of the hash from the element itself. This allows the reference elements to be recreated as needed.
							ISurveyNodeReference reference;
							int hash1 = (null != (reference = element1 as ISurveyNodeReference)) ?
								Utility.GetCombinedHashCode(reference.ReferencedElement.GetHashCode(), reference.SurveyNodeReferenceReason.GetHashCode()) :
								element1.GetHashCode();
							int hash2 = (null != (reference = element2 as ISurveyNodeReference)) ?
								Utility.GetCombinedHashCode(reference.ReferencedElement.GetHashCode(), reference.SurveyNodeReferenceReason.GetHashCode()) :
								element2.GetHashCode();
							retVal = unchecked(hash1 - hash2);
							if (retVal == 0)
							{
								// A little overkill, but the whole system breaks down if we
								// can't get a unique sort
								Microsoft.VisualStudio.Modeling.ModelElement modelElement1;
								Microsoft.VisualStudio.Modeling.ModelElement modelElement2;
								if (null != (modelElement1 = element1 as Microsoft.VisualStudio.Modeling.ModelElement) &&
									null != (modelElement2 = element2 as Microsoft.VisualStudio.Modeling.ModelElement))
								{
									retVal = modelElement1.Id.CompareTo(modelElement2.Id);
								}
								else
								{
									retVal = -1;
								}
							}
						}
					}
					return retVal;
				}
			}
			#endregion
			#endregion //end sort list methods
			#region IBranch Members
			/// <summary>
			/// MSBUG: If a branch is displayed multiple times, then an
			/// attempt may be made to redraw one of the branches with old
			/// information during insert and delete notifications. This affects
			/// GetText, GetDisplayData, and IsExpandable only. We either have
			/// to catch the situation and return empty data, or block tree redraw.
			/// </summary>
			private bool OutOfRange(int row)
			{
				return row < 0 || row >= myNodes.Count;
			}
			/// <summary>
			/// Implements <see cref="IBranch.BeginLabelEdit"/>
			/// </summary>
			protected VirtualTreeLabelEditData BeginLabelEdit(int row, int column, VirtualTreeLabelEditActivationStyles activationStyle)
			{
				SampleDataElementNode editNode = myNodes[row];
				ISurveyNodeCustomEditor customEditor = editNode.Element as ISurveyNodeCustomEditor;
				if (customEditor != null)
				{
					if (0 != (customEditor.SupportedEditActivationStyles & activationStyle))
					{
						VirtualTreeLabelEditData customResult = customEditor.BeginLabelEdit(activationStyle);
						if (customResult.IsValid)
						{
							return customResult;
						}
					}
				}
				switch (activationStyle)
				{
					case VirtualTreeLabelEditActivationStyles.Explicit:
						if (editNode.IsSurveyNameEditable)
						{
							return new VirtualTreeLabelEditData(editNode.EditableSurveyName);
						}
						break;
					case VirtualTreeLabelEditActivationStyles.Delayed:
						if (mySurveyTree.DelayActivateTextEditors && editNode.IsSurveyNameEditable)
						{
							return new VirtualTreeLabelEditData(editNode.EditableSurveyName);
						}
						break;
					case VirtualTreeLabelEditActivationStyles.ImmediateMouse:
					case VirtualTreeLabelEditActivationStyles.ImmediateSelection:
						return (mySurveyTree.DelayActivateTextEditors && editNode.IsSurveyNameEditable) ? VirtualTreeLabelEditData.DeferActivation : VirtualTreeLabelEditData.Invalid;
				}
				return VirtualTreeLabelEditData.Invalid;
			}
			VirtualTreeLabelEditData IBranch.BeginLabelEdit(int row, int column, VirtualTreeLabelEditActivationStyles activationStyle)
			{
				return BeginLabelEdit(row, column, activationStyle);
			}

			/// <summary>
			/// Implements <see cref="IBranch.CommitLabelEdit"/>
			/// </summary>
			protected LabelEditResult CommitLabelEdit(int row, int column, string newText)
			{
				SampleDataElementNode editNode = myNodes[row];
				editNode.EditableSurveyName = newText;
				return LabelEditResult.AcceptEdit;
			}
			LabelEditResult IBranch.CommitLabelEdit(int row, int column, string newText)
			{
				return CommitLabelEdit(row, column, newText);
			}
			/// <summary>
			/// Implements <see cref="IBranch.Features"/>
			/// </summary>
			protected static BranchFeatures Features
			{
				get
				{
					return BranchFeatures.PositionTracking | BranchFeatures.InsertsAndDeletes | BranchFeatures.Expansions | BranchFeatures.ExplicitLabelEdits | BranchFeatures.DelayedLabelEdits | BranchFeatures.ImmediateMouseLabelEdits | BranchFeatures.ImmediateSelectionLabelEdits;
				}
			}
			BranchFeatures IBranch.Features
			{
				get
				{
					return Features;
				}
			}
			/// <summary>
			/// Implements <see cref="IBranch.GetAccessibilityData"/>
			/// </summary>
			protected static VirtualTreeAccessibilityData GetAccessibilityData(int row, int column)
			{
				return VirtualTreeAccessibilityData.Empty;
			}
			VirtualTreeAccessibilityData IBranch.GetAccessibilityData(int row, int column)
			{
				return GetAccessibilityData(row, column);
			}
			/// <summary>
			/// Implements <see cref="IBranch.GetDisplayData"/>
			/// </summary>
			protected VirtualTreeDisplayData GetDisplayData(int row, int column, VirtualTreeDisplayDataMasks requiredData)
			{
				VirtualTreeDisplayData retVal = VirtualTreeDisplayData.Empty;
				if (OutOfRange(row))
				{
					return retVal;
				}
				SampleDataElementNode node = myNodes[row];
				SurveyTree<SurveyContextType> surveyTree = mySurveyTree;
				int image = -1;
				ISurveyNodeReference reference = null;
				object referencedElement = null;
				SurveyNodeReferenceOptions referenceOptions = SurveyNodeReferenceOptions.None;
				bool filterTargetQuestions = false;
				bool firstReference = true;
				int overlayImage = -1;
				int overlayBitField = -1;
				SurveyQuestionUISupport supportMask = SurveyQuestionUISupport.Glyph | SurveyQuestionUISupport.Overlay | SurveyQuestionUISupport.DisplayData;
				Survey survey = mySurvey;
				int nodeData = node.NodeData;
				while (true)
				{
					int questionCount = survey.Count;
					for (int i = 0; i < questionCount; i++)
					{
						SurveyQuestion question = survey[i];
						ISurveyQuestionTypeInfo<SurveyContextType> questionInfo = question.Question;
						SurveyQuestionUISupport support = questionInfo.UISupport & supportMask;
						if (0 != support)
						{
							int answer = question.ExtractAnswer(nodeData);
							if (answer != SurveyQuestion.NeutralAnswer &&
								(referencedElement == null || !filterTargetQuestions || reference.UseSurveyNodeReferenceAnswer(questionInfo.QuestionType, questionInfo.DynamicQuestionValues, answer)))
							{
								// Extract image and overlay support
								if (0 != (support & SurveyQuestionUISupport.Glyph))
								{
									if (0 <= (image = questionInfo.MapAnswerToImageIndex(answer)))
									{
										supportMask &= ~SurveyQuestionUISupport.Glyph;
										image += question.ProviderImageListOffset;
									}
								}
								else if (0 != (support & SurveyQuestionUISupport.Overlay))
								{
									int answerImage = questionInfo.MapAnswerToImageIndex(answer);
									if (0 <= answerImage)
									{
										if (overlayImage == -1)
										{
											overlayImage = answerImage + question.ProviderImageListOffset;
										}
										else
										{
											if (overlayBitField == -1)
											{
												overlayBitField = 0;
												AddToOverlayList(overlayImage, ref overlayBitField);
											}
											AddToOverlayList(answerImage + question.ProviderImageListOffset, ref overlayBitField);
										}
									}
								}

								// Extract other display settings
								if (0 != (support & SurveyQuestionUISupport.DisplayData))
								{
									supportMask &= ~SurveyQuestionUISupport.DisplayData;
									SurveyQuestionDisplayData displayData = questionInfo.GetDisplayData(answer);
									retVal.Bold = displayData.Bold;
									retVal.GrayText = displayData.GrayText;
									Color alternateColor;
									if (!(alternateColor = displayData.ForeColor).IsEmpty)
									{
										retVal.ForeColor = alternateColor;
									}
									if (!(alternateColor = displayData.BackColor).IsEmpty)
									{
										retVal.BackColor = alternateColor;
									}
								}
							}
						}
					}

					reference = node.Element as ISurveyNodeReference;
					referencedElement = null;
					if (null == (reference = node.Element as ISurveyNodeReference) ||
						null == (referencedElement = reference.ReferencedElement))
					{
						break;
					}
					NodeLocation targetLocation;
					if (!surveyTree.myNodeDictionary.TryGetValue(referencedElement, out targetLocation))
					{
						// Defensive code to handle callbacks on partially removed references
						// resulting from event side effects.
						break;
					}
					if (null == (survey = targetLocation.Survey))
					{
						break;
					}
					referenceOptions = reference.SurveyNodeReferenceOptions;
					filterTargetQuestions = 0 != (referenceOptions & SurveyNodeReferenceOptions.FilterReferencedAnswers);
					node = targetLocation.ElementNode;
					nodeData = node.NodeData;
					if (firstReference)
					{
						firstReference = false;
						if (0 == (referenceOptions & SurveyNodeReferenceOptions.BlockLinkDisplay) && !(referencedElement is ISurveyFloatingNode))
						{
							if (overlayImage == -1)
							{
								overlayImage = LinkOverlayImageIndex;
							}
							else
							{
								if (overlayBitField == -1)
								{
									overlayBitField = 0;
									AddToOverlayList(overlayImage, ref overlayBitField);
								}
								AddToOverlayList(LinkOverlayImageIndex, ref overlayBitField);
							}
						}
					}
				}

				if (0 <= image)
				{
					retVal.ImageList = surveyTree.myImageList;
					retVal.SelectedImage = retVal.Image = (short)image;
				}

				if (overlayBitField == -1)
				{
					retVal.OverlayIndex = (short)overlayImage;
				}
				else
				{
					retVal.OverlayIndices = myOverlayIndices;
					retVal.OverlayIndex = (short)overlayBitField;
				}

				if (surveyTree.DynamicColorsEnabled)
				{
					Color alternateColor;
					if (!(alternateColor = surveyTree.GetDynamicColor(node.Element, SurveyDynamicColor.ForeColor)).IsEmpty)
					{
						retVal.ForeColor = alternateColor;
					}
					if (!(alternateColor = surveyTree.GetDynamicColor(node.Element, SurveyDynamicColor.BackColor)).IsEmpty)
					{
						retVal.BackColor = alternateColor;
					}
				}

				return retVal;
			}
			private void AddToOverlayList(int answer, ref int overlayBitField)
			{
				int[] overlayIndices = myOverlayIndices;
				if (overlayIndices == null)
				{
					myOverlayIndices = overlayIndices = new int[8];
				}

				int curBit = 1;
				for (int i = 0; i < 8; ++i)
				{
					if ((overlayBitField & curBit) == 0)
					{
						overlayIndices[i] = answer;
						break;
					}

					curBit <<= 1;
				}

				overlayBitField |= curBit;
			}
			VirtualTreeDisplayData IBranch.GetDisplayData(int row, int column, VirtualTreeDisplayDataMasks requiredData)
			{
				return GetDisplayData(row, column, requiredData);
			}
			/// <summary>
			/// Implements <see cref="IBranch.GetObject"/>
			/// </summary>
			protected object GetObject(int row, int column, ObjectStyle style, ref int options)
			{
				switch (style)
				{
					case ObjectStyle.ExpandedBranch:
						{
							SampleDataElementNode node = myNodes[row];
							object expansionKey;
							ISurveyNodeReference reference;
							ISurveyNode referencedNode;
							object expandElement = null;
							if (null != (expansionKey = node.SurveyNodeExpansionKey))
							{
								expandElement = node.Element;
							}
							else if (null != (reference = node.Element as ISurveyNodeReference) &&
								0 != (reference.SurveyNodeReferenceOptions & SurveyNodeReferenceOptions.InlineExpansion) &&
								null != (referencedNode = reference.ReferencedElement as ISurveyNode) &&
								null != (expansionKey = referencedNode.SurveyNodeExpansionKey))
							{
								expandElement = referencedNode;
							}
							if (expandElement != null)
							{
								SurveyTree<SurveyContextType> parent = mySurveyTree;
								foreach (ISurveyNodeProvider nodeProvider in parent.myNodeProviders)
								{
									if (nodeProvider.IsSurveyNodeExpandable(expandElement, expansionKey))
									{
										Dictionary<object, MainList> expansions = parent.myMainListDictionary;
										MainList expansion;
										if (!expansions.TryGetValue(expandElement, out expansion))
										{
											expansion = new MainList(parent, expandElement, expansionKey);
											expansions[expandElement] = expansion;
										}
										return expansion.GetRootBranch(false);
									}
								}
							}
							break;
						}
					case ObjectStyle.TrackingObject:
						return myNodes[row].Element;
				}
				return null;
			}
			object IBranch.GetObject(int row, int column, ObjectStyle style, ref int options)
			{
				return GetObject(row, column, style, ref options);
			}
			/// <summary>
			/// Implements <see cref="IBranch.GetText"/>
			/// </summary>
			/// <returns>The Display Name Of The Node</returns>
			protected string GetText(int row, int column)
			{
				if (OutOfRange(row))
				{
					return null;
				}
				return myNodes[row].SurveyName;
			}
			string IBranch.GetText(int row, int column)
			{
				return GetText(row, column);
			}
			/// <summary>
			/// Implements <see cref="IBranch.GetTipText"/>
			/// </summary>
			/// <returns>Returns The Display Text Of The Node</returns>
			protected static string GetTipText(int row, int column, ToolTipType tipType)
			{
				return (tipType == ToolTipType.Default) ? null : string.Empty;
			}
			string IBranch.GetTipText(int row, int column, ToolTipType tipType)
			{
				return GetTipText(row, column, tipType);
			}
			/// <summary>
			/// Implements <see cref="IBranch.IsExpandable"/>
			/// </summary>
			protected bool IsExpandable(int row, int column)
			{
				if (OutOfRange(row))
				{
					return false;
				}
				SampleDataElementNode node = myNodes[row];
				ISurveyNodeReference reference;
				ISurveyNode referencedNode;
				object expansionKey;
				object element = null;
				if (null != (expansionKey = node.SurveyNodeExpansionKey) ||
					(null != (reference = node.Element as ISurveyNodeReference) &&
					0 != (reference.SurveyNodeReferenceOptions & SurveyNodeReferenceOptions.InlineExpansion) &&
					null != (element = referencedNode = reference.ReferencedElement as ISurveyNode) &&
					null != (expansionKey = referencedNode.SurveyNodeExpansionKey)))
				{
					if (element == null)
					{
						element = node.Element;
					}
					foreach (ISurveyNodeProvider nodeProvider in mySurveyTree.myNodeProviders)
					{
						if (nodeProvider.IsSurveyNodeExpandable(element, expansionKey))
						{
							return true;
						}
					}
				}
				return false;
			}
			bool IBranch.IsExpandable(int row, int column)
			{
				return IsExpandable(row, column);
			}
			/// <summary>
			/// Implements <see cref="IBranch.LocateObject"/>
			/// </summary>
			protected LocateObjectData LocateObject(object obj, ObjectStyle style, int locateOptions)
			{
				if (style == ObjectStyle.TrackingObject)
				{
					NodeLocation location;
					int nodeIndex;
					ISurveyNodeContext nodeContext;
					object contextElement = null;
					MainList locatedList;
					SurveyTree<SurveyContextType> surveyTree = mySurveyTree;
					bool haveLocation = surveyTree.myNodeDictionary.TryGetValue(obj, out location);
					if (haveLocation && null != (locatedList = location.MainList))
					{
						if (locatedList == this)
						{
							if (0 <= (nodeIndex = myNodes.BinarySearch(location.ElementNode, myNodeComparer)))
							{
								return new LocateObjectData(nodeIndex, 0, (int)TrackingObjectAction.ThisLevel);
							}
						}
						else
						{
							contextElement = locatedList.myContextElement;
						}
					}
					else
					{
						ISurveyNodeReference selectReference;
						LinkedNode<SurveyNodeReference> referenceNodeLink;
						SurveyNodeReference referenceNode;
						object referenceContext;
						if (!haveLocation &&
							null != (selectReference = obj as ISurveyNodeReference) &&
							0 == (selectReference.SurveyNodeReferenceOptions & SurveyNodeReferenceOptions.TrackReferenceInstance) &&
							surveyTree.myReferenceDictionary.TryGetValue(selectReference.ReferencedElement, out referenceNodeLink))
						{
							object matchContext = myContextElement;
							while (referenceNodeLink != null)
							{
								referenceNode = referenceNodeLink.Value;
								if (matchContext == referenceNode.ContextElement)
								{
									if (0 <= (nodeIndex = myNodes.BinarySearch(referenceNode.Node, myNodeComparer)))
									{
										return new LocateObjectData(nodeIndex, 0, (int)TrackingObjectAction.ThisLevel);
									}
								}
								referenceNodeLink = referenceNodeLink.Next;
							}
						}
						if (null != (nodeContext = obj as ISurveyNodeContext))
						{
							contextElement = nodeContext.SurveyNodeContext;
						}
						else if (haveLocation)
						{
							// A reference to the element has been recorded, jump to it instead
							if (surveyTree.myReferenceDictionary.TryGetValue(obj, out referenceNodeLink))
							{
								referenceNode = referenceNodeLink.Value;
								referenceContext = referenceNode.ContextElement;
								if (referenceContext == myContextElement)
								{
									if (0 <= (nodeIndex = myNodes.BinarySearch(referenceNode.Node, myNodeComparer)))
									{
										return new LocateObjectData(nodeIndex, 0, (int)TrackingObjectAction.ThisLevel);
									}
								}
								else
								{
									contextElement = referenceContext;
								}
							}
						}
					}
					if (contextElement != null)
					{
						// This item is in an expansion, see if we can find the context element at this level
						LocateObjectData contextData = LocateObject(contextElement, style, locateOptions);
						if (contextData.Row != VirtualTreeConstant.NullIndex)
						{
							contextData.Options = (int)TrackingObjectAction.NextLevel;
							return contextData;
						}
					}
				}
				return new LocateObjectData(VirtualTreeConstant.NullIndex, VirtualTreeConstant.NullIndex, 0);
			}
			LocateObjectData IBranch.LocateObject(object obj, ObjectStyle style, int locateOptions)
			{
				return LocateObject(obj, style, locateOptions);
			}

			/// <summary>
			/// Implements <see cref="IBranch.OnBranchModification"/>
			/// </summary>
			protected event BranchModificationEventHandler OnBranchModification
			{
				add
				{
					// Note: This assumes that the branch is attached to a single tree. If
					// it is attached to multiple trees, then we need to look at the invocation
					// list to see if we already have a listener attached for that tree, and
					// we need to track a count for each attached tree listener. Alternately,
					// only the top-level grouper should attach its events to this branch. All other
					// shifter/grouper implementations should not attach events.
					if (myModificationEvents == null)
					{
						myModificationEvents += value;
					}
					++myAttachedEventCount;
				}
				remove
				{
					if (--myAttachedEventCount == 0)
					{
						myModificationEvents = null;
					}
				}
			}
			event BranchModificationEventHandler IBranch.OnBranchModification
			{
				add
				{
					OnBranchModification += value;
				}
				remove
				{
					OnBranchModification -= value;
				}
			}
			/// <summary>
			/// Implements <see cref="IBranch.OnDragEvent"/>. Defers to <see cref="ISurveyNodeDropTarget"/>
			/// </summary>
			protected void OnDragEvent(object sender, int row, int column, DragEventType eventType, DragEventArgs args)
			{
				object element = myNodes[row].Element;
				ISurveyNodeDropTarget dropTarget;
				ISurveyNodeReference reference;
				if (null != (dropTarget = element as ISurveyNodeDropTarget) ||
					(null != (reference = element as ISurveyNodeReference) &&
					null != (dropTarget = reference.ReferencedElement as ISurveyNodeDropTarget)))
				{
					dropTarget.OnDragEvent(myContextElement, eventType, args);
				}
			}
			void IBranch.OnDragEvent(object sender, int row, int column, DragEventType eventType, DragEventArgs args)
			{
				OnDragEvent(sender, row, column, eventType, args);
			}
			/// <summary>
			/// Implements <see cref="IBranch.OnGiveFeedback"/>
			/// </summary>
			protected static void OnGiveFeedback(GiveFeedbackEventArgs args, int row, int column)
			{
			}
			void IBranch.OnGiveFeedback(GiveFeedbackEventArgs args, int row, int column)
			{
				OnGiveFeedback(args, row, column);
			}
			/// <summary>
			/// Implements <see cref="IBranch.OnQueryContinueDrag"/>
			/// </summary>
			protected static void OnQueryContinueDrag(QueryContinueDragEventArgs args, int row, int column)
			{
			}
			void IBranch.OnQueryContinueDrag(QueryContinueDragEventArgs args, int row, int column)
			{
				OnQueryContinueDrag(args, row, column);
			}
			/// <summary>
			/// Implements <see cref="IBranch.OnStartDrag"/>
			/// </summary>
			protected VirtualTreeStartDragData OnStartDrag(object sender, int row, int column, DragReason reason)
			{
				if (reason == DragReason.DragDrop)
				{
					object dataObject = myNodes[row].SurveyNodeDataObject;
					return (dataObject != null) ? new VirtualTreeStartDragData(dataObject, DragDropEffects.All) : VirtualTreeStartDragData.Empty;
				}
				return VirtualTreeStartDragData.Empty;
			}
			VirtualTreeStartDragData IBranch.OnStartDrag(object sender, int row, int column, DragReason reason)
			{
				return OnStartDrag(sender, row, column, reason);
			}
			/// <summary>
			/// Implements <see cref="IBranch.SynchronizeState"/>
			/// </summary>
			protected static StateRefreshChanges SynchronizeState(int row, int column, IBranch matchBranch, int matchRow, int matchColumn)
			{
				return StateRefreshChanges.None;
			}
			StateRefreshChanges IBranch.SynchronizeState(int row, int column, IBranch matchBranch, int matchRow, int matchColumn)
			{
				return SynchronizeState(row, column, matchBranch, matchRow, matchColumn);
			}
			/// <summary>
			/// Implements <see cref="IBranch.ToggleState"/>
			/// </summary>
			protected static StateRefreshChanges ToggleState(int row, int column)
			{
				return StateRefreshChanges.None;
			}
			StateRefreshChanges IBranch.ToggleState(int row, int column)
			{
				return ToggleState(row, column);
			}
			/// <summary>
			/// Returned by <see cref="IBranch.UpdateCounter"/>
			/// </summary>
			protected static int UpdateCounter
			{
				get
				{
					return 0;
				}
			}
			int IBranch.UpdateCounter
			{
				get
				{
					return UpdateCounter;
				}
			}
			/// <summary>
			/// Implements <see cref="IBranch.VisibleItemCount"/>
			/// </summary>
			protected int VisibleItemCount
			{
				get
				{
					return myNodes.Count;
				}
			}
			int IBranch.VisibleItemCount
			{
				get
				{
					return VisibleItemCount;
				}
			}

			#endregion
			#region Notification methods, correspond to INotifySurveyElementChanged
			/// <summary>
			/// Forwarded from <see cref="INotifySurveyElementChanged.ElementAdded"/>
			/// </summary>
			public void ElementAdded(object element)
			{
				SampleDataElementNode newNode = SampleDataElementNode.Create(mySurveyTree, mySurvey, myContextElement, element);
				int index;
				if (0 <= (index = myNodes.BinarySearch(newNode, myNodeComparer)))
				{
					// Don't add a node we already have or one we can't uniquely track
					return;
				}
				index = ~index;
				myNodes.Insert(index, newNode);
				ISurveyNodeReference reference;
				if (null == (reference = element as ISurveyNodeReference) ||
					0 != (reference.SurveyNodeReferenceOptions & SurveyNodeReferenceOptions.TrackReferenceInstance))
				{
					mySurveyTree.myNodeDictionary[element] = new NodeLocation(this, newNode);
				}
				if (myRootGrouper == null)
				{
					RaiseBranchEvent(BranchModificationEventArgs.InsertItems(this, index - 1, 1));
				}
				else
				{
					BranchModificationEventHandler forwardToHandler = myModificationEvents;
					LinkedList<BranchModificationEventArgs> forwardEvents = null;
					myRootGrouper.ElementAddedAt(
						index,
						(forwardToHandler == null) ?
							(BranchModificationEventHandler)null : delegate(object eventSender, BranchModificationEventArgs e)
							{
								if (forwardEvents == null)
								{
									forwardEvents = new LinkedList<BranchModificationEventArgs>();
								}
								forwardEvents.AddLast(e);
							});
					if (forwardEvents != null)
					{
						foreach (BranchModificationEventArgs args in forwardEvents)
						{
							forwardToHandler(this, args);
						}
					}
				}
			}
			/// <summary>
			/// Forwarded from <see cref="INotifySurveyElementChanged.ElementChanged"/>
			/// </summary>
			public void NodeChanged(SampleDataElementNode node, LinkedNode<SurveyNodeReference> nodeReference, bool displayChangeOnly, params Type[] questionTypes)
			{
				int index;
				if (0 > (index = myNodes.BinarySearch(node, myNodeComparer)))
				{
					return;
				}
				if (!displayChangeOnly && questionTypes.Length != 0)
				{
					UpdateNode(index, nodeReference, node.UpdateAnswers(mySurveyTree, myContextElement, mySurvey, questionTypes), true, false);
				}
				else
				{
					BranchModificationEventHandler modificationEvents = myModificationEvents;
					if (myRootGrouper != null)
					{
						myRootGrouper.ElementChangedAt(index, VirtualTreeDisplayDataChanges.Image, modificationEvents);
					}
					else if (modificationEvents != null)
					{
						modificationEvents(this, BranchModificationEventArgs.DisplayDataChanged(new DisplayDataChangedData(VirtualTreeDisplayDataChanges.Image, this, index, 0, 1)));
					}
				}
			}
			/// <summary>
			/// Forwarded from <see cref="INotifySurveyElementChanged.ElementExpandabilityChanged"/>
			/// </summary>
			public void NodeExpandabilityChanged(SampleDataElementNode node, MainList expandedList, bool expandable)
			{
				if (expandedList != null)
				{
					if (!expandable)
					{
						// Removes the branch at all locations, including inline expansions
						RaiseBranchEvent(BranchModificationEventArgs.RemoveBranch((IBranch)expandedList.myRootGrouper ?? expandedList));
					}
				}
				else
				{
					int index;
					if (0 > (index = myNodes.BinarySearch(node, myNodeComparer)))
					{
						return;
					}
					BranchModificationEventHandler modificationEvents = myModificationEvents;
					if (myRootGrouper != null)
					{
						myRootGrouper.ElementChangedAt(index, VirtualTreeDisplayDataChanges.ItemButton, modificationEvents);
					}
					else if (modificationEvents != null)
					{
						modificationEvents(this, BranchModificationEventArgs.DisplayDataChanged(new DisplayDataChangedData(VirtualTreeDisplayDataChanges.ItemButton, this, index, 0, 1)));
					}
				}
			}
			/// <summary>
			/// Forwarded from <see cref="INotifySurveyElementChanged.ElementDeleted"/>
			/// </summary>
			public void NodeDeleted(SampleDataElementNode node)
			{
				int index;
				if (0 <= (index = myNodes.BinarySearch(node, myNodeComparer)))
				{
					DeleteAt(index);
				}
			}
			/// <summary>
			/// Helper function to delete at a location
			/// </summary>
			/// <param name="index">The preverified deletion index</param>
			private void DeleteAt(int index)
			{
				// Note that the dictionary is cleaned up in the SurveyTree's calling code
				List<SampleDataElementNode> nodes = myNodes;
				object context;
				nodes.RemoveAt(index);
				if (nodes.Count == 0 &&
					!mySurveyTree.GetExpandable(context = myContextElement, null))
				{
					// Remove this branch instead of showing it as empty
					RaiseBranchEvent(BranchModificationEventArgs.RemoveBranch((IBranch)myRootGrouper ?? this));
					mySurveyTree.myMainListDictionary.Remove(context);
				}
				else if (myRootGrouper != null)
				{
					BranchModificationEventHandler forwardToHandler = myModificationEvents;
					LinkedList<BranchModificationEventArgs> forwardEvents = null;
					myRootGrouper.ElementDeletedAt(
						index,
						(forwardToHandler == null) ?
							(BranchModificationEventHandler)null :
							delegate(object eventSender, BranchModificationEventArgs e)
							{
								if (forwardEvents == null)
								{
									forwardEvents = new LinkedList<BranchModificationEventArgs>();
								}
								forwardEvents.AddLast(e);
							});
					if (forwardEvents != null)
					{
						foreach (BranchModificationEventArgs args in forwardEvents)
						{
							forwardToHandler(this, args);
						}
					}
				}
				else
				{
					RaiseBranchEvent(BranchModificationEventArgs.DeleteItems(this, index, 1));
				}
			}
			/// <summary>
			/// Forwarded from <see cref="INotifySurveyElementChanged.ElementRenamed"/>
			/// </summary>
			public void NodeRenamed(SampleDataElementNode node, LinkedNode<SurveyNodeReference> nodeReference)
			{
				int fromIndex;
				if (0 > (fromIndex = myNodes.BinarySearch(node, myNodeComparer)))
				{
					return;
				}
				UpdateNode(fromIndex, nodeReference, node.UpdateSurveyName(mySurveyTree, myContextElement), true, false);
			}
			/// <summary>
			/// Forwarded from <see cref="INotifySurveyElementChanged.ElementCustomSortChanged"/>
			/// </summary>
			public void NodeCustomSortChanged(SampleDataElementNode node, LinkedNode<SurveyNodeReference> nodeReference)
			{
				int fromIndex;
				if (0 > (fromIndex = myNodes.BinarySearch(node, myNodeComparer)))
				{
					return;
				}
				ICustomComparableSurveyNode customCompare = node.Element as ICustomComparableSurveyNode;
				if (customCompare == null)
				{
					return;
				}
				object customSortData = node.CustomSortData;
				if (!customCompare.ResetCustomSortData(myContextElement, ref customSortData))
				{
					return;
				}
				Debug.Assert(!object.ReferenceEquals(customSortData, node.CustomSortData), "ICustomComparableSurveyNode.ResetCustomSortData should return a new instance, or false");
				UpdateNode(fromIndex, nodeReference, node.UpdateCustomSortData(mySurveyTree, myContextElement, customSortData), false, false);
			}
			/// <summary>
			/// The target of a reference element has changed. Reset all information about the node.
			/// </summary>
			/// <param name="elementReference">The element reference to retarget.</param>
			/// <param name="previousTarget">The previous target for this element.</param>
			/// <param name="removeOnly">Remove the element, but do not update or add it.</param>
			public void NodeRetargeted(ISurveyNodeReference elementReference, object previousTarget, bool removeOnly)
			{
				// Because the binary search mechanism always references the referenced element directly,
				// there is nothing we can do here except to do a linear walk of the list and find the
				// referenced element.
				List<SampleDataElementNode> nodes = myNodes;
				int nodeCount = nodes.Count;
				int fromIndex = 0;
				for (; fromIndex < nodeCount; ++fromIndex)
				{
					if (nodes[fromIndex].Element == elementReference)
					{
						break;
					}
				}
				if (fromIndex == nodeCount)
				{
					if (!removeOnly)
					{
						ElementAdded(elementReference);
					}
					return;
				}
				else if (removeOnly)
				{
					DeleteAt(fromIndex);
					return;
				}
				// UNDONE: If the reference is expandable, then we need to replace the branch for this item only. However,
				// there is no API available to force the tree to re-retrieve an expansion for a single item. The options are:
				// 1) Wrap and individually track a separate branch instance for a link. This is possible, but adds a lot of
				//    additional notification code for an uncommon scenario.
				// 2) Use a Realign operation on the tree. This is not 100% percent because the same branch can possibly be expanded
				//    from multiple locations, and there is insufficient information passed in to 
				// 3) MSBUG: We should be able to use a custom level shift adjust here by deleting the first level, inserting no new
				//    levels, and declining to reattach any nested branches. However, this is creating a crash in the tree with a
				//    circular reference in the reconstructed child nodes when a parent is replaced by one of its children.
				UpdateNode(
					fromIndex,
					null,
					SampleDataElementNode.Create(mySurveyTree, mySurvey, myContextElement, elementReference),
					true,
					0 != (elementReference.SurveyNodeReferenceOptions & SurveyNodeReferenceOptions.InlineExpansion) && mySurveyTree.myMainListDictionary.ContainsKey(previousTarget));
			}
			/// <summary>
			/// A fallback method to force a redraw of the full tree. Should be used
			/// only in broad deletion cases where side effects cannot be determined
			/// during events.
			/// </summary>
			public void ForceRedraw()
			{
				BranchModificationEventHandler modificationEvents = myModificationEvents;
				if (modificationEvents != null)
				{
					modificationEvents(this, BranchModificationEventArgs.Redraw(false));
					modificationEvents(this, BranchModificationEventArgs.Redraw(true));
				}
			}
			/// <summary>
			/// Update a node by either moving it or updating the display in line.
			/// </summary>
			/// <param name="nodeIndex">The current index of the node</param>
			/// <param name="nodeReference">A node reference to update with the new node information.</param>
			/// <param name="replacementNode">A populated replacement node.</param>
			/// <param name="displayChanged">The display has changed, notify if position does not change.</param>
			/// <param name="deleteAndAdd">Modify the tree through delete and add operations instead of direct move and display changes</param>
			private void UpdateNode(int nodeIndex, LinkedNode<SurveyNodeReference> nodeReference, SampleDataElementNode replacementNode, bool displayChanged, bool deleteAndAdd)
			{
				List<SampleDataElementNode> nodes = this.myNodes;
				ListGrouper rootGrouper = this.myRootGrouper;
				int toIndex = nodes.BinarySearch(replacementNode, myNodeComparer);
				int inverseToIndex = ~toIndex;
				BranchModificationEventHandler modificationEvents = myModificationEvents;
				object element = replacementNode.Element;
				ISurveyNodeReference reference;
				if (null == (reference = element as ISurveyNodeReference) ||
					0 != (reference.SurveyNodeReferenceOptions & SurveyNodeReferenceOptions.TrackReferenceInstance))
				{
					mySurveyTree.myNodeDictionary[element] = new NodeLocation(this, replacementNode);
				}
				if (nodeReference != null)
				{
					Debug.Assert(nodeReference.Value.ContextElement == myContextElement);
					nodeReference.Value = new SurveyNodeReference(replacementNode, myContextElement);
				}
				if (nodeIndex == toIndex || (inverseToIndex >= 0 && (inverseToIndex == nodeIndex || (inverseToIndex - nodeIndex) == 1)))
				{
					if (deleteAndAdd && modificationEvents != null)
					{
						nodes.RemoveAt(nodeIndex);
						if (rootGrouper != null)
						{
							rootGrouper.ElementDeletedAt(nodeIndex, modificationEvents);
							nodes.Insert(nodeIndex, replacementNode);
							rootGrouper.ElementAddedAt(nodeIndex, modificationEvents);
						}
						else if (displayChanged)
						{
							modificationEvents(this, BranchModificationEventArgs.DeleteItems(this, nodeIndex, 1));
							nodes.Insert(nodeIndex, replacementNode);
							modificationEvents(this, BranchModificationEventArgs.InsertItems(this, nodeIndex - 1, 1));
						}
					}
					else
					{
						nodes[nodeIndex] = replacementNode;
						if (rootGrouper != null)
						{
							rootGrouper.ElementModifiedAt(nodeIndex, nodeIndex, replacementNode.NodeData, displayChanged, modificationEvents);
						}
						else if (displayChanged && modificationEvents != null)
						{
							modificationEvents(this, BranchModificationEventArgs.DisplayDataChanged(new DisplayDataChangedData(VirtualTreeDisplayDataChanges.Text, this, nodeIndex, 0, 1)));
						}
					}
				}
				else if (inverseToIndex >= 0)
				{
					nodes.RemoveAt(nodeIndex);
					if (inverseToIndex > nodeIndex)
					{
						--inverseToIndex;
					}
					if (deleteAndAdd && modificationEvents != null)
					{
						if (rootGrouper != null)
						{
							rootGrouper.ElementDeletedAt(nodeIndex, modificationEvents);
							nodes.Insert(inverseToIndex, replacementNode);
							rootGrouper.ElementAddedAt(inverseToIndex, modificationEvents);
						}
						else
						{
							modificationEvents(this, BranchModificationEventArgs.DeleteItems(this, nodeIndex, 1));
							nodes.Insert(inverseToIndex, replacementNode);
							modificationEvents(this, BranchModificationEventArgs.InsertItems(this, inverseToIndex - 1, 1));
						}
					}
					else
					{
						nodes.Insert(inverseToIndex, replacementNode);
						if (rootGrouper != null)
						{
							rootGrouper.ElementModifiedAt(nodeIndex, inverseToIndex, replacementNode.NodeData, displayChanged, modificationEvents);
						}
						else if (modificationEvents != null)
						{
							modificationEvents(this, BranchModificationEventArgs.MoveItem(this, nodeIndex, inverseToIndex));
						}
					}
				}
				else
				{
					Debug.Assert(false); // Replacement element can't be placed in or found in the list
				}
			}
			#endregion //INotifySurveyElementChanged Implementation
			#region ITrackSurveyElementLocation implementation
			/// <summary>
			/// Pass through event handler. This allows listeners to attach the location tracking event to
			/// the root branch of a tree.
			/// </summary>
			event ElementLocationChangedEventHandler ITrackSurveyElementLocation.ElementLocationChanged
			{
				add { mySurveyTree.ElementLocationChanged += value; }
				remove { mySurveyTree.ElementLocationChanged -= value; }
			}
			#endregion // ITrackSurveyElementLocation implementation
		}
	}
}
