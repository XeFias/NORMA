#region Common Public License Copyright Notice
/**************************************************************************\
* Neumont Object-Role Modeling Architect for Visual Studio                 *
*                                                                          *
* Copyright � Neumont University. All rights reserved.                     *
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
using System.ComponentModel.Design;
using System.Diagnostics;
using Microsoft.VisualStudio.EnterpriseTools.Shell;
using Microsoft.VisualStudio.Modeling.Shell;
using Microsoft.VisualStudio.Shell;
using Microsoft.VisualStudio.Shell.Interop;
using Microsoft.VisualStudio.Modeling;
using Microsoft.VisualStudio.Modeling.Diagrams;
using Neumont.Tools.ORM;
using Neumont.Tools.ORM.ObjectModel;
using Neumont.Tools.ORM.ShapeModel;
using Neumont.Tools.ORM.ObjectModel.Editors;

namespace Neumont.Tools.ORM.Shell
{	
	public partial class ORMDesignerDocView
	{
		/// <summary>
		/// Create a command set for this type of view. Should be called
		/// once when the package loads
		/// </summary>
		/// <param name="serviceProvider">IServiceProvider</param>
		/// <returns></returns>
		public static object CreateCommandSet(IServiceProvider serviceProvider)
		{
			return new ORMDesignerCommandSet(serviceProvider);
		}
		/// <summary>
		/// Command objects for the ORMDesignerDocView
		/// </summary>
		protected class ORMDesignerCommandSet : MarshalByRefObject, IDisposable
		{
			private IMenuCommandService myMenuService;
			private IMonitorSelectionService myMonitorSelection;
			private IServiceProvider myServiceProvider;
			private ModelElementLocator myElementLocator;

			/// <summary>
			/// Commands
			/// </summary>
			private MenuCommand[] myCommands;

			/// <summary>
			/// ORMDesignerCommandSet constructor
			/// </summary>
			/// <param name="serviceProvider"></param>
			public ORMDesignerCommandSet(IServiceProvider serviceProvider)
			{
				this.myServiceProvider = serviceProvider;
				#region Array of menu commands
				myCommands = new MenuCommand[]
				{
				// Commands
#if DEBUG
				new MenuCommand(
				new EventHandler(OnMenuDebugViewStore),
				ORMDesignerCommandIds.DebugViewStore),
#endif // DEBUG
				new DynamicStatusMenuCommand(
				new EventHandler(OnStatusReferenceModesWindow),
				new EventHandler(OnMenuReferenceModesWindow),
				ORMDesignerCommandIds.ViewReferenceModeEditor)
				,new DynamicStatusMenuCommand(
				new EventHandler(OnStatusStandardWindow),
				new EventHandler(OnMenuNotesWindow),
				ORMDesignerCommandIds.ViewNotesWindow)
				,new DynamicStatusMenuCommand(
				new EventHandler(OnStatusCopyImage),
				new EventHandler(OnMenuCopyImage),
				ORMDesignerCommandIds.CopyImage)
				,new DynamicStatusMenuCommand(
				new EventHandler(OnStatusDeleteAlternate),
				new EventHandler(OnMenuDeleteAlternate),
				ORMDesignerCommandIds.DeleteAlternate)
				,new DynamicStatusMenuCommand(
				new EventHandler(OnStatusSelectAll),
				new EventHandler(OnMenuSelectAll),
				StandardCommands.SelectAll)
				,new DynamicStatusMenuCommand(
				new EventHandler(OnStatusDelete),
				new EventHandler(OnMenuDelete),
				StandardCommands.Delete)
				,new DynamicStatusMenuCommand(
				new EventHandler(OnStatusReadingsWindow),
				new EventHandler(OnMenuReadingsWindow),
				ORMDesignerCommandIds.ViewReadingEditor)
				,new DynamicStatusMenuCommand(
				new EventHandler(OnStatusInsertRole),
				new EventHandler(OnMenuInsertRoleBefore),
				ORMDesignerCommandIds.InsertRoleBefore)
				,new DynamicStatusMenuCommand(
				new EventHandler(OnStatusInsertRole),
				new EventHandler(OnMenuInsertRoleAfter),
				ORMDesignerCommandIds.InsertRoleAfter)
				,new DynamicStatusMenuCommand(
				new EventHandler(OnStatusFactEditorWindow),
				new EventHandler(OnMenuFactEditorWindow),
				ORMDesignerCommandIds.ViewFactEditor)
				// Constraint editing commands
				,new DynamicStatusMenuCommand(
				new EventHandler(OnStatusActivateRoleSequence),
				new EventHandler(OnMenuActivateRoleSequence),
				ORMDesignerCommandIds.ViewActivateRoleSequence)
				,new DynamicStatusMenuCommand(
				new EventHandler(OnStatusDeleteRowSequence),
				new EventHandler(OnMenuDeleteRowSequence),
				ORMDesignerCommandIds.ViewDeleteRoleSequence)
				,new DynamicStatusMenuCommand(
				new EventHandler(OnStatusMoveRoleSequenceUp),
				new EventHandler(OnMenuMoveRoleSequenceUp),
				ORMDesignerCommandIds.ViewMoveRoleSequenceUp)
				,new DynamicStatusMenuCommand(
				new EventHandler(OnStatusMoveRoleSequenceDown),
				new EventHandler(OnMenuMoveRoleSequenceDown),
				ORMDesignerCommandIds.ViewMoveRoleSequenceDown)
				,new DynamicStatusMenuCommand(
				new EventHandler(OnStatusEditExternalConstraint),
				new EventHandler(OnMenuEditExternalConstraint),
				ORMDesignerCommandIds.ViewEditExternalConstraint)

				// Verbalization Commands
				,new DynamicStatusMenuCommand(
				new EventHandler(OnStatusShowPositiveVerbalization),
				new EventHandler(OnMenuShowPositiveVerbalization),
				ORMDesignerCommandIds.ShowPositiveVerbalization)
				,new DynamicStatusMenuCommand(
				new EventHandler(OnStatusShowNegativeVerbalization),
				new EventHandler(OnMenuShowNegativeVerbalization),
				ORMDesignerCommandIds.ShowNegativeVerbalization)
				,new DynamicStatusMenuCommand(
				new EventHandler(OnStatusStandardWindow),
				new EventHandler(OnMenuVerbalizationWindow),
				ORMDesignerCommandIds.ViewVerbalizationBrowser)
				,new DynamicStatusMenuCommand(
				new EventHandler(OnStatusStandardWindow),
				new EventHandler(OnMenuViewORMModelBrowser),
				ORMDesignerCommandIds.ViewModelBrowser)
				,new DynamicStatusMenuCommand(
				new EventHandler(OnStatusAutoLayout),
				new EventHandler(OnMenuAutoLayout),
				ORMDesignerCommandIds.AutoLayout)
				,new DynamicStatusMenuCommand(
				new EventHandler(OnStatusToggleSimpleMandatory),
				new EventHandler(OnMenuToggleSimpleMandatory),
				ORMDesignerCommandIds.ToggleSimpleMandatory)
				,new DynamicStatusMenuCommand(
				new EventHandler(OnStatusAddInternalUniqueness),
				new EventHandler(OnMenuAddInternalUniqueness),
				ORMDesignerCommandIds.AddInternalUniqueness)
				,new DynamicStatusMenuCommand(
				new EventHandler(OnStatusExtensionManager),
				new EventHandler(OnMenuExtensionManager),
				ORMDesignerCommandIds.ExtensionManager)
				,new DynamicStatusMenuCommand(
				new EventHandler(OnStatusMoveRoleLeft), 
				new EventHandler(OnMenuMoveRoleLeft),
				ORMDesignerCommandIds.MoveRoleLeft)
				,new DynamicStatusMenuCommand(
				new EventHandler(OnStatusMoveRoleRight), 
				new EventHandler(OnMenuMoveRoleRight),
				ORMDesignerCommandIds.MoveRoleRight)

				// Alignment Commands
				,new DynamicStatusMenuCommand(
				new EventHandler(OnStatusAlignShapes),
				new EventHandler(OnMenuAlignShapes),
				StandardCommands.AlignBottom)
				,new DynamicStatusMenuCommand(
				new EventHandler(OnStatusAlignShapes),
				new EventHandler(OnMenuAlignShapes),
				StandardCommands.AlignHorizontalCenters)
				,new DynamicStatusMenuCommand(
				new EventHandler(OnStatusAlignShapes),
				new EventHandler(OnMenuAlignShapes),
				StandardCommands.AlignLeft)
				,new DynamicStatusMenuCommand(
				new EventHandler(OnStatusAlignShapes),
				new EventHandler(OnMenuAlignShapes),
				StandardCommands.AlignRight)
				,new DynamicStatusMenuCommand(
				new EventHandler(OnStatusAlignShapes),
				new EventHandler(OnMenuAlignShapes),
				StandardCommands.AlignTop)
				,new DynamicStatusMenuCommand(
				new EventHandler(OnStatusAlignShapes),
				new EventHandler(OnMenuAlignShapes),
				StandardCommands.AlignVerticalCenters)
				,new DynamicErrorCommand(
				new EventHandler(OnStatusErrorList),
				new EventHandler(OnMenuErrorList),
				ORMDesignerCommandIds.ErrorList)
			};
				#endregion
				AddCommands(myCommands);


			}

			/// <summary>
			/// Called to add a set of commands. This should be called
			/// by Initialize.
			/// </summary>
			/// <param name="commands">Commands to add</param>
			protected virtual void AddCommands(MenuCommand[] commands)
			{
				IMenuCommandService menuService = MenuService; // Use the accessor to force creation
				if (menuService != null)
				{
					int count = commands.Length;
					for (int i = 0; i < count; ++i)
					{
						menuService.AddCommand(commands[i]);
					}
				}
			}
			/// <summary>
			/// Called to remove a set of commands. This should be called
			/// by Dispose.
			/// </summary>
			/// <param name="commands">Commands to add</param>
			protected virtual void RemoveCommands(MenuCommand[] commands)
			{

				IMenuCommandService menuService = myMenuService;
				if (menuService != null)
				{
					int count = commands.Length;
					for (int i = 0; i < count; ++i)
					{
						menuService.RemoveCommand(commands[i]);
					}
				}
			}
			/// <summary>
			/// Cleanup code 
			/// </summary>
			public void Dispose()
			{
				if (myCommands != null)
				{
					RemoveCommands(myCommands);
				}
				myMenuService = null;
				myMonitorSelection = null;
				myServiceProvider = null;
				myCommands = null;
				myElementLocator = null;
			}

			/// <summary>
			/// Show the ORM Model Browser
			/// </summary>
			protected void OnMenuViewORMModelBrowser(object sender, EventArgs e)
			{
				ORMDesignerPackage.BrowserWindow.Show();
			}

			/// <summary>
			/// Status callback
			/// </summary>
			protected void OnStatusCopyImage(object sender, EventArgs e)
			{
				ORMDesignerDocView.OnStatusCommand(sender, CurrentORMView, ORMDesignerCommands.CopyImage);
			}
			/// <summary>
			/// Copies as image
			/// </summary>
			protected void OnMenuCopyImage(object sender, EventArgs e)
			{
				ORMDesignerDocView docView = CurrentORMView;
				if (docView != null)
				{
					// call CopyImage on the doc view
					docView.OnMenuCopyImage();
				}
			}

#if DEBUG
			/// <summary>
			/// Show a debug window displaying the contents of the current store
			/// </summary>
			protected void OnMenuDebugViewStore(object sender, EventArgs e)
			{
				Microsoft.VisualStudio.Modeling.Diagnostics.Debug.Assert(((ModelingDocData)CurrentORMView.DocData).Store);
			}
#endif // DEBUG

			/// <summary>
			/// Status callback
			/// </summary>
			private void OnStatusDeleteAlternate(object sender, EventArgs e)
			{
				ORMDesignerDocView.OnStatusCommand(
					sender,
					CurrentORMView,
					(OptionsPage.CurrentPrimaryDeleteBehavior == PrimaryDeleteBehavior.DeleteShape) ?
						ORMDesignerCommands.Delete | ORMDesignerCommands.DeleteAny :
						ORMDesignerCommands.DeleteShape | ORMDesignerCommands.DeleteAnyShape);
			}
			/// <summary>
			/// Menu handler
			/// </summary>
			private void OnMenuDeleteAlternate(object sender, EventArgs e)
			{
				ORMDesignerDocView docView = CurrentORMView;
				if (docView != null)
				{
					// call the appropriate delete on the doc view
					switch (OptionsPage.CurrentPrimaryDeleteBehavior)
					{
						case PrimaryDeleteBehavior.DeleteShape:
							docView.OnMenuDeleteElement((sender as OleMenuCommand).Text);
							break;
						case PrimaryDeleteBehavior.DeleteElement:
							docView.OnMenuDeleteShape((sender as OleMenuCommand).Text);
							break;
					}
				}
			}
			/// <summary>
			/// Status callback
			/// </summary>
			private void OnStatusDelete(object sender, EventArgs e)
			{
				ORMDesignerDocView.OnStatusCommand(
					sender,
					CurrentORMView,
					(OptionsPage.CurrentPrimaryDeleteBehavior == PrimaryDeleteBehavior.DeleteElement) ?
						ORMDesignerCommands.Delete | ORMDesignerCommands.DeleteAny :
						ORMDesignerCommands.DeleteShape | ORMDesignerCommands.DeleteAnyShape);
			}
			/// <summary>
			/// Menu handler
			/// </summary>
			private void OnMenuDelete(object sender, EventArgs e)
			{
				ORMDesignerDocView docView = CurrentORMView;
				if (docView != null)
				{
					// call the appropriate delete on the doc view
					switch (OptionsPage.CurrentPrimaryDeleteBehavior)
					{
						case PrimaryDeleteBehavior.DeleteElement:
							docView.OnMenuDeleteElement((sender as OleMenuCommand).Text);
							break;
						case PrimaryDeleteBehavior.DeleteShape:
							docView.OnMenuDeleteShape((sender as OleMenuCommand).Text);
							break;
					}
				}
			}
			private void OnStatusReferenceModesWindow(object sender, EventArgs e)
			{
				ORMDesignerDocView.OnStatusCommand(sender, CurrentORMView, ORMDesignerCommands.DisplayCustomReferenceModeWindow);
			}
			/// <summary>
			/// Status callback
			/// </summary>
			private void OnStatusReadingsWindow(object sender, EventArgs e)
			{
				ORMDesignerDocView.OnStatusCommand(sender, CurrentORMView, ORMDesignerCommands.DisplayReadingsWindow);
			}
			/// <summary>
			/// Menu handler
			/// </summary>
			protected void OnMenuReadingsWindow(object sender, EventArgs e)
			{
				ORMReadingEditorToolWindow editorWindow = ORMDesignerPackage.ReadingEditorWindow;
				editorWindow.Show();
			}
			private void OnStatusSelectAll(object sender, EventArgs e)
			{
				ORMDesignerDocView.OnStatusCommand(sender, CurrentORMView, ORMDesignerCommands.SelectAll);
			}
			/// <summary>
			/// Menu handler for the SelectAll command
			/// </summary>
			protected void OnMenuSelectAll(object sender, EventArgs e)
			{
				ORMDesignerDocView docView = CurrentORMView;
				if (docView != null)
				{
					// call delete on the doc view
					docView.OnMenuSelectAll();
				}
			}
			private void OnStatusAutoLayout(object sender, EventArgs e)
			{
				ORMDesignerDocView.OnStatusCommand(sender, CurrentORMView, ORMDesignerCommands.AutoLayout);
			}
			/// <summary>
			/// Menu handler for the SelectAll command
			/// </summary>
			protected void OnMenuAutoLayout(object sender, EventArgs e)
			{
				ORMDesignerDocView docView = CurrentORMView;
				if (docView != null)
				{
					// call auto layout on the doc view
					docView.OnMenuAutoLayout();
				}
			}
			/// <summary>
			/// Status callback
			/// </summary>
			private void OnStatusInsertRole(object sender, EventArgs e)
			{
				ORMDesignerDocView.OnStatusCommand(sender, CurrentORMView, ORMDesignerCommands.InsertRole);
			}
			/// <summary>
			/// Menu handler
			/// </summary>
			protected void OnMenuInsertRoleAfter(object sender, EventArgs e)
			{
				ORMDesignerDocView docView = CurrentORMView;
				if (docView != null)
				{
					// Defer to the doc view
					docView.OnMenuInsertRole(true);
				}
			}
			/// <summary>
			/// Menu handler
			/// </summary>
			protected void OnMenuInsertRoleBefore(object sender, EventArgs e)
			{
				ORMDesignerDocView docView = CurrentORMView;
				if (docView != null)
				{
					// Defer to the doc view
					docView.OnMenuInsertRole(false);
				}
			}
			/// <summary>
			/// Status callback
			/// </summary>
			private void OnStatusToggleSimpleMandatory(object sender, EventArgs e)
			{
				ORMDesignerDocView.OnStatusCommand(sender, CurrentORMView, ORMDesignerCommands.ToggleSimpleMandatory);
			}
			/// <summary>
			/// Menu handler
			/// </summary>
			protected void OnMenuToggleSimpleMandatory(object sender, EventArgs e)
			{
				ORMDesignerDocView docView = CurrentORMView;
				if (docView != null)
				{
					// Defer to the doc view
					docView.OnMenuToggleSimpleMandatory();
				}
			}
			/// <summary>
			/// Status callback
			/// </summary>
			private void OnStatusAddInternalUniqueness(object sender, EventArgs e)
			{
				ORMDesignerDocView.OnStatusCommand(sender, CurrentORMView, ORMDesignerCommands.AddInternalUniqueness);
			}
			/// <summary>
			/// Menu handler
			/// </summary>
			protected void OnMenuAddInternalUniqueness(object sender, EventArgs e)
			{
				ORMDesignerDocView docView = CurrentORMView;
				if (docView != null)
				{
					// Defer to the doc view
					docView.OnMenuAddInternalUniqueness();
				}
			}
			/// <summary>
			/// Status callback
			/// </summary>
			private void OnStatusExtensionManager(object sender, EventArgs e)
			{
				ORMDesignerDocView.OnStatusCommand(sender, CurrentORMView, ORMDesignerCommands.ExtensionManager);
			}
			/// <summary>
			/// Menu handler
			/// </summary>
			protected void OnMenuExtensionManager(object sender, EventArgs e)
			{
				ORMDesignerDocView docView = CurrentORMView;
				if (docView != null)
				{
					// Defer to the doc view
					docView.OnMenuExtensionManager();
				}
			}
			private void OnStatusMoveRoleLeft(object sender, EventArgs e)
			{
				ORMDesignerDocView.OnStatusCommand(sender, CurrentORMView, ORMDesignerCommands.MoveRoleLeft);
			}
			/// <summary>
			/// Menu handler
			/// </summary>
			protected void OnMenuMoveRoleLeft(object sender, EventArgs e)
			{
				ORMDesignerDocView docView = CurrentORMView;
				if (docView != null)
				{
					// Defer to the doc view
					docView.OnMenuMoveRoleLeft(docView);
				}
			}
			private void OnStatusMoveRoleRight(object sender, EventArgs e)
			{
				ORMDesignerDocView.OnStatusCommand(sender, CurrentORMView, ORMDesignerCommands.MoveRoleRight);
			}
			/// <summary>
			/// Menu handler
			/// </summary>
			protected void OnMenuMoveRoleRight(object sender, EventArgs e)
			{
				ORMDesignerDocView docView = CurrentORMView;
				if (docView != null)
				{
					// Defer to the doc view
					docView.OnMenuMoveRoleRight(docView);
				}
			}
			/// <summary>
			/// Status callback
			/// </summary>
			private void OnStatusAlignShapes(object sender, EventArgs e)
			{
				ORMDesignerDocView.OnStatusCommand(sender, CurrentORMView, ORMDesignerCommands.AlignShapes);
			}
			/// <summary>
			/// Menu handler
			/// </summary>
			protected void OnMenuAlignShapes(object sender, EventArgs e)
			{
				ORMDesignerDocView docView = CurrentORMView;
				if (docView != null)
				{
					// Defer to the doc view
					docView.OnMenuAlignShapes((sender as MenuCommand).CommandID.ID);
				}
			}
			private class DynamicErrorCommand : DynamicStatusMenuCommand
			{
				public DynamicErrorCommand(EventHandler statusHandler, EventHandler invokeHandler, CommandID id) : base(statusHandler, invokeHandler, id)
				{
					//Declare class variable with object containing error list
				}
				public override bool DynamicItemMatch(int cmdId)
				{
					int baseCmdId = CommandID.ID;
					int testId = cmdId - baseCmdId;
					
					
					if (testId >= 0 && testId < ORMDesignerCommandIds.ErrorListLength)
					{
						MatchedCommandId = testId;
						return true;
					}
					return false;
				}
			}
			//private System.Collections.Generic.IEnumerator<string> strings;
			/// <summary>
			/// Status callback
			/// </summary>
			protected void OnStatusErrorList(object sender, EventArgs e)
			{
				ORMDesignerDocView docView = CurrentORMView;
				ORMDesignerDocView.OnStatusCommand(sender, docView, ORMDesignerCommands.ErrorList);
				OleMenuCommand cmd = sender as OleMenuCommand;
				if (cmd.Visible)
				{
					string errorText = null;
					int matchErrorIndex = cmd.MatchedCommandId;
					if (docView.SelectionCount > 0)
					{
						IModelErrorOwner errorOwner = EditorUtility.ResolveContextInstance(docView.SelectedElements[0], false) as IModelErrorOwner;
						if (errorOwner != null)
						{
							int count = 0;
							foreach (ModelError error in errorOwner.ErrorCollection)
							{
								if (count == matchErrorIndex)
								{
									errorText = error.Name;
									break;
								}
								++count;
							}
						}
					}
					if (errorText != null)
					{
						cmd.Enabled = true;
						cmd.Visible = true;
						cmd.Supported = true;
						cmd.Text = errorText;
					}
					else
					{
						cmd.Supported = false;
					}
				}
				cmd.MatchedCommandId = 0;
			}
			/// <summary>
			/// Menu handler
			/// </summary>
			protected void OnMenuErrorList(object sender, EventArgs e)
			{
				ORMDesignerDocView docView = CurrentORMView;
				OleMenuCommand cmd = sender as OleMenuCommand;
				string errorText = cmd.Text;
				if (cmd.Visible)
				{
					if (docView.SelectionCount > 0)
					{
						IModelErrorOwner errorOwner = EditorUtility.ResolveContextInstance(docView.SelectedElements[0], false) as IModelErrorOwner;
						if (errorOwner != null)
						{
							foreach (ModelError error in errorOwner.ErrorCollection)
							{
								if (errorText == error.Name)
								{
									IORMToolTaskItem task;
									IORMToolServices services;
									IORMToolTaskProvider provider;
									if (null != (task = error.TaskData as IORMToolTaskItem) &&
										null != (services = error.Store as IORMToolServices) &&
										null != (provider = services.TaskProvider))
									{
										provider.NavigateTo(task);
									}
									break;
								}
							}
						}
					}
				}
				//if(docView.SelectionCount > 0)
				//{
				//    (docView.SelectedElements[0] as IModelErrorOwner).ErrorCollection[0];
				//}
				if (docView != null)
				{
					// Defer to the doc view
					//docView.OnMenuErrorList();
				}
			}
			#region External Constraint editing menu options
			#region Status queries
			/// <summary>
			/// Menu handler
			/// </summary>
			protected void OnMenuReferenceModesWindow(object sender, EventArgs e)
			{
				ORMDesignerPackage.ReferenceModeEditorWindow.Show();
			}
			/// <summary>
			/// Menu handler
			/// </summary>
			protected void OnMenuNotesWindow(object sender, EventArgs e)
			{
				ORMNotesToolWindow notesWindow = ORMDesignerPackage.NotesWindow;
				notesWindow.Show();
			}
			/// <summary>
			/// Status callback
			/// </summary>
			private void OnStatusFactEditorWindow(object sender, EventArgs e)
			{
				ORMDesignerDocView.OnStatusCommand(sender, CurrentORMView, ORMDesignerCommands.DisplayFactEditorWindow);
			}
			/// <summary>
			/// Menu handler
			/// </summary>
			protected void OnMenuFactEditorWindow(object sender, EventArgs e)
			{
				IVsWindowFrame editorWindow = ORMDesignerPackage.FactEditorWindow;
				editorWindow.Show();
			}

			/// <summary>
			/// Status callback
			/// </summary>
			private void OnStatusStandardWindow(object sender, EventArgs e)
			{
				ORMDesignerDocView.OnStatusCommand(sender, CurrentORMView, ORMDesignerCommands.DisplayStandardWindows);
			}
			/// <summary>
			/// Menu handler
			/// </summary>
			protected void OnMenuVerbalizationWindow(object sender, EventArgs e)
			{
				ORMVerbalizationToolWindow verbWin = ORMDesignerPackage.VerbalizationWindow;
				verbWin.Show();
			}
			/// <summary>
			/// Status callback
			/// </summary>
			protected void OnStatusShowPositiveVerbalization(object sender, EventArgs e)
			{
				MenuCommand command = sender as MenuCommand;
				command.Enabled = true;
				command.Visible = true;
				command.Supported = true;
				command.Checked = !ORMDesignerPackage.VerbalizationWindow.ShowNegativeVerbalizations;
			}
			/// <summary>
			/// Menu handler
			/// </summary>
			protected void OnMenuShowPositiveVerbalization(object sender, EventArgs e)
			{
				ORMDesignerPackage.VerbalizationWindow.ShowNegativeVerbalizations = false;
			}
			/// <summary>
			/// Status callback
			/// </summary>
			protected void OnStatusShowNegativeVerbalization(object sender, EventArgs e)
			{
				MenuCommand command = sender as MenuCommand;
				command.Enabled = true;
				command.Visible = true;
				command.Supported = true;
				command.Checked = ORMDesignerPackage.VerbalizationWindow.ShowNegativeVerbalizations;
				
			}
			/// <summary>
			/// Menu handler
			/// </summary>
			protected void OnMenuShowNegativeVerbalization(object sender, EventArgs e)
			{
				ORMDesignerPackage.VerbalizationWindow.ShowNegativeVerbalizations = true;
			}
			/// <summary>
			/// Status callback
			/// </summary>
			protected void OnStatusEditExternalConstraint(object sender, EventArgs e)
			{
				ORMDesignerDocView.OnStatusCommand(sender, CurrentORMView, ORMDesignerCommands.EditExternalConstraint);
			}
			/// <summary>
			/// Status callback
			/// </summary>
			protected void OnStatusActivateRoleSequence(object sender, EventArgs e)
			{
				ORMDesignerDocView.OnStatusCommand(sender, CurrentORMView, ORMDesignerCommands.ActivateRoleSequence);
			}
			/// <summary>
			/// Status callback
			/// </summary>
			protected void OnStatusDeleteRowSequence(object sender, EventArgs e)
			{
				ORMDesignerDocView.OnStatusCommand(sender, CurrentORMView, ORMDesignerCommands.DeleteRoleSequence);
			}
			/// <summary>
			/// Status callback
			/// </summary>
			protected void OnStatusMoveRoleSequenceUp(object sender, EventArgs e)
			{
				ORMDesignerDocView.OnStatusCommand(sender, CurrentORMView, ORMDesignerCommands.MoveRoleSequenceUp);
			}
			/// <summary>
			/// Status callback
			/// </summary>
			protected void OnStatusMoveRoleSequenceDown(object sender, EventArgs e)
			{
				ORMDesignerDocView.OnStatusCommand(sender, CurrentORMView, ORMDesignerCommands.MoveRoleSequenceDown);
			}
			#endregion // Status queries
			#region Menu actions
			/// <summary>
			/// Menu handler
			/// </summary>
			protected void OnMenuEditExternalConstraint(object sender, EventArgs e)
			{
				ORMDesignerDocView docView = CurrentORMView;
				if (docView != null)
				{
					docView.OnMenuEditExternalConstraint();
				}
			}
			/// <summary>
			/// Menu handler
			/// </summary>
			protected void OnMenuActivateRoleSequence(object sender, EventArgs e)
			{
				ORMDesignerDocView docView = CurrentORMView;
				if (docView != null)
				{
					docView.OnMenuActivateRoleSequence();
				}
			}
			/// <summary>
			/// Menu handler
			/// </summary>
			protected void OnMenuDeleteRowSequence(object sender, EventArgs e)
			{
				ORMDesignerDocView docView = CurrentORMView;
				if (docView != null)
				{
					// call delete on the doc view
					docView.OnMenuDeleteRoleSequence();
				}
			}
			/// <summary>
			/// Menu handler
			/// </summary>
			protected void OnMenuMoveRoleSequenceUp(object sender, EventArgs e)
			{
				ORMDesignerDocView docView = CurrentORMView;
				if (docView != null)
				{
					docView.OnMenuMoveRoleSequenceUp();
				}
			}
			/// <summary>
			/// Menu handler
			/// </summary>
			protected void OnMenuMoveRoleSequenceDown(object sender, EventArgs e)
			{
				ORMDesignerDocView docView = CurrentORMView;
				if (docView != null)
				{
					docView.OnMenuMoveRoleSequenceDown();
				}
			}
			#endregion // Menu actions
			#endregion // External Constraint editing menu options
			/// <summary>
			/// Retrieve the menu service from the service provider
			/// specified in the constructor
			/// </summary>
			protected IMenuCommandService MenuService
			{
				get
				{
					IMenuCommandService menuService = myMenuService;
					if (menuService == null)
					{
						try
						{
							myMenuService = menuService = (IMenuCommandService)myServiceProvider.GetService(typeof(IMenuCommandService));
						}
						catch (InvalidCastException)
						{
							Debug.Assert(false, "CommandSet relies on the menu command service, which is unavailable.");
							throw;
						}
					}

					return menuService;
				}
			}
			/// <summary>
			/// Load the monitor selection service
			/// </summary>
			private IMonitorSelectionService MonitorSelection
			{
				get
				{
					IMonitorSelectionService monitorSelect = myMonitorSelection;
					if (monitorSelect == null)
					{
						myMonitorSelection = monitorSelect = (IMonitorSelectionService)myServiceProvider.GetService(typeof(IMonitorSelectionService));
					}
					return monitorSelect;
				}
			}

			/// <summary>
			/// An element locator. Used to navigate to items.
			/// </summary>
			/// <value></value>
			public ModelElementLocator ElementLocator
			{
				get
				{
					ModelElementLocator locator = myElementLocator;
					if (locator == null)
					{
						myElementLocator = locator = new ModelElementLocator((ModelingPackage)myServiceProvider);
					}
					return locator;
				}
			}
			/// <summary>
			/// Currently focused document
			/// </summary>
			protected ORMDesignerDocData CurrentData
			{
				get
				{
					return MonitorSelection.CurrentDocument as ORMDesignerDocData;
				}
			}

			/// <summary>
			/// Currently focused ORM document view
			/// </summary>
			protected ORMDesignerDocView CurrentORMView
			{
				get
				{
					return MonitorSelection.CurrentDocumentView as ORMDesignerDocView;
				}
			}
		}

		/// <summary>
		/// CommandIDs for the Application Designer package.
		/// </summary>
		public class ORMDesignerCommandIds
		{
			/// <summary>
			/// The global identifier for the command set used by the ORM designer.
			/// </summary>
			public static readonly Guid guidORMDesignerCommandSet = new Guid("7C51C000-1EAD-4b39-89B5-42BC9F49EA24");    // keep in sync with SatDll\PkgCmd.ctc

			#region CommandID objects for commands
#if DEBUG
			/// <summary>
			/// A command to view the current store contents in debug mode
			/// </summary>
			public static readonly CommandID DebugViewStore = new CommandID(guidORMDesignerCommandSet, cmdIdDebugViewStore);
#endif // DEBUG
			/// <summary>
			/// The ORM Model Browser item on the view menu
			/// </summary>
			public static readonly CommandID ViewModelBrowser = new CommandID(guidORMDesignerCommandSet, cmdIdViewModelBrowser);
			/// <summary>
			/// Copy selected elements as an image.
			/// </summary>
			public static readonly CommandID CopyImage = new CommandID(guidORMDesignerCommandSet, cmdIdCopyImage);
			/// <summary>
			/// The ORM Readings Window item on the fact type context menu
			/// </summary>
			public static readonly CommandID ViewReadingEditor = new CommandID(guidORMDesignerCommandSet, cmdIdViewReadingEditor);
			/// <summary>
			/// The ORM Note Window item on the context menu
			/// </summary>
			public static readonly CommandID ViewNotesWindow = new CommandID(guidORMDesignerCommandSet, cmdIdViewNotesWindow);
			/// <summary>
			/// Insert a role after the selected role
			/// </summary>
			public static readonly CommandID InsertRoleAfter = new CommandID(guidORMDesignerCommandSet, cmdIdInsertRoleAfter);
			/// <summary>
			/// Insert a role before the selected role
			/// </summary>
			public static readonly CommandID InsertRoleBefore = new CommandID(guidORMDesignerCommandSet, cmdIdInsertRoleBefore);

			/// <summary>
			/// The Custom Reference Mode Editor Explorer item on the view menu
			/// </summary>
			public static readonly CommandID ViewReferenceModeEditor = new CommandID(guidORMDesignerCommandSet, cmdIdViewReferenceModeEditor);
			/// <summary>
			/// The ORM Fact Editor Window item on the fact type context menu
			/// </summary>
			public static readonly CommandID ViewFactEditor = new CommandID(guidORMDesignerCommandSet, cmdIdViewFactEditor);
			/// <summary>
			/// The ORM Verbalization Browser Window item on the fact type context menu
			/// </summary>
			public static readonly CommandID ViewVerbalizationBrowser = new CommandID(guidORMDesignerCommandSet, cmdIdViewVerbalizationBrowser);
			/// <summary>
			/// The ORM Verbalization Browser toolbar button for positive verbalization
			/// </summary>
			public static readonly CommandID ShowPositiveVerbalization = new CommandID(guidORMDesignerCommandSet, cmdIdShowPositiveVerbalization);
			/// <summary>
			/// The ORM Verbalization Browser toolbar button for negative verbalization
			/// </summary>
			public static readonly CommandID ShowNegativeVerbalization = new CommandID(guidORMDesignerCommandSet, cmdIdShowNegativeVerbalization);
			/// <summary>
			/// The AutoLayout command
			/// </summary>
			public static readonly CommandID AutoLayout = new CommandID(guidORMDesignerCommandSet, cmdIdAutoLayout);
			/// <summary>
			/// Toggle simple mandatory command. Available on a single role selection.
			/// </summary>
			public static readonly CommandID ToggleSimpleMandatory = new CommandID(guidORMDesignerCommandSet, cmdIdToggleSimpleMandatory);
			/// <summary>
			/// Add internal uniqueness command. Available on a single or multi role
			/// role selection if all roles are in the same fact and an internal
			/// uniqueness constraint is not yet defined for the combination.
			/// </summary>
			public static readonly CommandID AddInternalUniqueness = new CommandID(guidORMDesignerCommandSet, cmdIdAddInternalUniqueness);
			/// <summary>
			/// The Extension Manager dialog command.  Launches the Extension Manager dialog.
			/// </summary>
			public static readonly CommandID ExtensionManager = new CommandID(guidORMDesignerCommandSet, cmdIdExtensionManager);
			/// <summary>
			/// The standard delete command is bound to shape deletion by
			/// default in the designer. This can be changed to element deletion
			/// with the options page. The alternate delete command is bound to
			/// Control-Delete and does the command not handled directly by delete.
			/// </summary>
			public static readonly CommandID DeleteAlternate = new CommandID(guidORMDesignerCommandSet, cmdIdDeleteAlternate);
			/// <summary>
			/// Move a role to the left in its order within the fact type.
			/// </summary>
			public static readonly CommandID MoveRoleLeft = new CommandID(guidORMDesignerCommandSet, cmdIdMoveRoleLeft);
			/// <summary>
			/// Move a role to the right in its order within the fact type.
			/// </summary>
			public static readonly CommandID MoveRoleRight = new CommandID(guidORMDesignerCommandSet, cmdIdMoveRoleRight);
			#endregion // CommandID objects for commands
			#region CommandID objects for menus
			/// <summary>
			/// The context menu for the diagram
			/// </summary>
			public static readonly CommandID ViewContextMenu = new CommandID(guidORMDesignerCommandSet, menuIdContextMenu);
			/// <summary>
			/// The toolbar for the verbalization window
			/// </summary>
			public static readonly CommandID VerbalizationToolBar = new CommandID(guidORMDesignerCommandSet, menuIdVerbalizationToolBar);

			/// <summary>
			/// Available on any role belonging to the active RoleSequence in the active MCEC or SCEC.
			/// </summary>
			public static readonly CommandID ViewActivateRoleSequence = new CommandID(guidORMDesignerCommandSet, cmdIdActivateRoleSequence);

			/// <summary>
			/// Available on any role belonging to any RoleSequence in the active MCEC.
			/// </summary>
			public static readonly CommandID ViewDeleteRoleSequence = new CommandID(guidORMDesignerCommandSet, cmdIdDeleteRoleSequence);

			/// <summary>
			/// Available on any non-active external constraint.
			/// </summary>
			public static readonly CommandID ViewEditExternalConstraint = new CommandID(guidORMDesignerCommandSet, cmdIdEditExternalConstraint);

			/// <summary>
			/// Available on any role belonging to any RoleSequence in the active MCEC.
			/// </summary>
			public static readonly CommandID ViewMoveRoleSequenceUp = new CommandID(guidORMDesignerCommandSet, cmdIdMoveRoleSequenceUp);

			/// <summary>
			/// Available on any role belonging to any RoleSequence in the active MCEC.
			/// </summary>
			public static readonly CommandID ViewMoveRoleSequenceDown = new CommandID(guidORMDesignerCommandSet, cmdIdMoveRoleSequenceDown);
            /// <summary>
            /// Available to any type that is in a state of error
            /// </summary>
            public static readonly CommandID ErrorList = new CommandID(guidORMDesignerCommandSet, cmdIdErrorList);
			/// <summary>
			/// Indicates the number of command ids reserved for reporting errors
			/// </summary>
			public const int ErrorListLength = cmdIdErrorListEnd - cmdIdErrorList + 1;
            #endregion //CommandID objects for menus

            

			#region cmdIds
			// IMPORTANT: keep these constants in sync with SatDll\PkgCmdID.h

#if DEBUG
			/// <summary>
			/// A command to view the current store contents in debug mode
			/// </summary>
			private const int cmdIdDebugViewStore = 0x28FF;
#endif // DEBUG
			/// <summary>
			/// The ORM Model Browser item on the view menu
			/// </summary>
			private const int cmdIdViewModelBrowser = 0x2900;
			/// <summary>
			/// The ORM Readings Window item on the fact type context menu
			/// </summary>
			private const int cmdIdViewReadingEditor = 0x2901;
			/// <summary>
			/// View the reference mode editor
			/// </summary>
			private const int cmdIdViewReferenceModeEditor = 0x2902;
			/// <summary>
			/// Insert a role after the selected role
			/// </summary>
			private const int cmdIdInsertRoleAfter = 0x2903;
			/// <summary>
			/// Insert a role before the selected role
			/// </summary>
			private const int cmdIdInsertRoleBefore = 0x2904;
			/// <summary>
			/// The ORM Fact Editor Window item on the fact type context menu
			/// </summary>
			private const int cmdIdViewFactEditor = 0x2905;
			/// <summary>
			/// Available on any role belonging to the active RoleSequence in the active MCEC or SCEC.
			/// </summary>
			private const int cmdIdActivateRoleSequence = 0x2906;
			/// <summary>
			/// Available on any role belonging to any RoleSequence in the active MCEC.
			/// </summary>
			private const int cmdIdDeleteRoleSequence = 0x2907;
			/// <summary>
			/// Available on any non-active external constraint.
			/// </summary>
			private const int cmdIdEditExternalConstraint = 0x2908;
			/// <summary>
			/// Available on any role belonging to any RoleSequence in the active MCEC.
			/// </summary>
			private const int cmdIdMoveRoleSequenceUp = 0x2909;
			/// <summary>
			/// Available on any role belonging to any RoleSequence in the active MCEC.
			/// </summary>
			private const int cmdIdMoveRoleSequenceDown = 0x290A;
			/// <summary>
			/// Copy selected elements as an image.
			/// </summary>
			private const int cmdIdCopyImage = 0x290B;
			/// <summary>
			/// The ORM Verbalization Browser Window item on the View and context menu
			/// </summary>
			private const int cmdIdViewVerbalizationBrowser = 0x290C;
			/// <summary>
			/// The ORM Verbalization Browser toolbar button for positive verbalization
			/// </summary>
			private const int cmdIdShowPositiveVerbalization = 0x290D;
			/// <summary>
			/// The ORM Verbalization Browser toolbar button for negative verbalization
			/// </summary>
			private const int cmdIdShowNegativeVerbalization = 0x290E;
			/// <summary>
			/// AutoLayout command
			/// </summary>
			private const int cmdIdAutoLayout = 0x290F;
			/// <summary>
			/// Toggle simple mandatory command. Available on a single role selection.
			/// </summary>
			private const int cmdIdToggleSimpleMandatory = 0x2910;
			/// <summary>
			/// Add internal uniqueness command. Available on a single or multi role
			/// role selection if all roles are in the same fact and an internal
			/// uniqueness constraint is not yet defined for the combination.
			/// </summary>
			private const int cmdIdAddInternalUniqueness = 0x2911;
			/// <summary>
			/// Opens up the Extension Manager dialog
			/// </summary>
			private const int cmdIdExtensionManager = 0x2912;
			/// <summary>
			/// The ORM Note Window item on the context menu
			/// </summary>
			private const int cmdIdViewNotesWindow = 0x2913;
			/// <summary>
			/// The standard delete command is bound to shape deletion by
			/// default in the designer. This can be changed to element deletion
			/// with the options page. The alternate delete command is bound to
			/// Control-Delete and does the command not handled directly by delete.
			/// </summary>
			private const int cmdIdDeleteAlternate = 0x2914;
            /// <summary>
            /// The context menu for the local errors
            /// </summary>
            private const int cmdIdErrorList = 0x2a00;
			/// <summary>
			/// The last allowed id for an error list
			/// </summary>
			private const int cmdIdErrorListEnd = 0x2aff;
			/// <summary>
			/// The context menu for the diagram
			/// </summary>
			private const int menuIdContextMenu = 0x0100;
			/// <summary>
			/// The toolbar for the verbalization window
			/// </summary>
			private const int menuIdVerbalizationToolBar = 0x0101;
			/// <summary>
			/// Moves the role to the left in its order with the fact type.
			/// </summary>
			private const int cmdIdMoveRoleLeft = 0x2915;
			/// <summary>
			/// Moves the role to the right in its order with the fact type.
			/// </summary>
			private const int cmdIdMoveRoleRight = 0x2916;
			#endregion
		}
	}
}
