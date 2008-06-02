﻿#region Common Public License Copyright Notice
/**************************************************************************\
* Neumont Object-Role Modeling Architect for Visual Studio                 *
*                                                                          *
* Copyright © Neumont University. All rights reserved.                     *
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
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using DslModeling = global::Microsoft.VisualStudio.Modeling;
using DslDesign = global::Microsoft.VisualStudio.Modeling.Design;
namespace Neumont.Tools.EntityRelationshipModels.Barker
{
	/// <summary>
	/// DomainModel BarkerDomainModel
	/// Barker Entity Relationship View of ORM Model
	/// </summary>
	[DslModeling::ExtendsDomainModel("1F394F03-8A41-48BC-BDED-2268E131B4A3"/*Neumont.Tools.ORMToORMAbstractionBridge.ORMToORMAbstractionBridgeDomainModel*/)]
	[DslDesign::DisplayNameResource("Neumont.Tools.EntityRelationshipModels.Barker.BarkerDomainModel.DisplayName", typeof(global::Neumont.Tools.EntityRelationshipModels.Barker.BarkerDomainModel), "Neumont.Tools.EntityRelationshipModels.Barker.GeneratedCode.DomainModelResx")]
	[DslDesign::DescriptionResource("Neumont.Tools.EntityRelationshipModels.Barker.BarkerDomainModel.Description", typeof(global::Neumont.Tools.EntityRelationshipModels.Barker.BarkerDomainModel), "Neumont.Tools.EntityRelationshipModels.Barker.GeneratedCode.DomainModelResx")]
	[global::System.CLSCompliant(true)]
	[DslModeling::DomainObjectId("b2caed8e-4155-4317-9405-55006fde280e")]
	public partial class BarkerDomainModel : DslModeling::DomainModel
	{
		#region Constructor, domain model Id
	
		/// <summary>
		/// BarkerDomainModel domain model Id.
		/// </summary>
		public static readonly global::System.Guid DomainModelId = new global::System.Guid(0xb2caed8e, 0x4155, 0x4317, 0x94, 0x05, 0x55, 0x00, 0x6f, 0xde, 0x28, 0x0e);
	
		/// <summary>
		/// Constructor.
		/// </summary>
		/// <param name="store">Store containing the domain model.</param>
		public BarkerDomainModel(DslModeling::Store store)
			: base(store, DomainModelId)
		{
		}
		
		#endregion
		#region Domain model reflection
			
		/// <summary>
		/// Gets the list of generated domain model types (classes, rules, relationships).
		/// </summary>
		/// <returns>List of types.</returns>
		protected sealed override global::System.Type[] GetGeneratedDomainModelTypes()
		{
			return new global::System.Type[]
			{
				typeof(BarkerModelElement),
				typeof(EntityType),
				typeof(Attribute),
				typeof(Value),
				typeof(Role),
				typeof(CardinalityQualifier),
				typeof(OptionalRole),
				typeof(ExclusiveArc),
				typeof(BinaryAssociation),
				typeof(BarkerErModel),
				typeof(EntityTypeHasAttribute),
				typeof(AttributeHasPossibleValue),
				typeof(EntityTypeIsSubtypeOfEntityType),
				typeof(EntityTypePlaysRole),
				typeof(RoleHasCardinalityQualifier),
				typeof(ExclusiveArcSpansOptionalRole),
				typeof(BinaryAssociationContainsRole),
				typeof(BarkerErModelContainsEntityType),
				typeof(BarkerErModelContainsBinaryAssociation),
				typeof(BarkerErModelContainsExclusiveArc),
			};
		}
		/// <summary>
		/// Gets the list of generated domain properties.
		/// </summary>
		/// <returns>List of property data.</returns>
		protected sealed override DomainMemberInfo[] GetGeneratedDomainProperties()
		{
			return new DomainMemberInfo[]
			{
				new DomainMemberInfo(typeof(EntityType), "Name", EntityType.NameDomainPropertyId, typeof(EntityType.NamePropertyHandler)),
				new DomainMemberInfo(typeof(Attribute), "Name", Attribute.NameDomainPropertyId, typeof(Attribute.NamePropertyHandler)),
				new DomainMemberInfo(typeof(Attribute), "IsMandatory", Attribute.IsMandatoryDomainPropertyId, typeof(Attribute.IsMandatoryPropertyHandler)),
				new DomainMemberInfo(typeof(Attribute), "IsPrimaryIdComponent", Attribute.IsPrimaryIdComponentDomainPropertyId, typeof(Attribute.IsPrimaryIdComponentPropertyHandler)),
				new DomainMemberInfo(typeof(Value), "Val", Value.ValDomainPropertyId, typeof(Value.ValPropertyHandler)),
				new DomainMemberInfo(typeof(Role), "Number", Role.NumberDomainPropertyId, typeof(Role.NumberPropertyHandler)),
				new DomainMemberInfo(typeof(Role), "PredicateText", Role.PredicateTextDomainPropertyId, typeof(Role.PredicateTextPropertyHandler)),
				new DomainMemberInfo(typeof(Role), "IsNonTransferable", Role.IsNonTransferableDomainPropertyId, typeof(Role.IsNonTransferablePropertyHandler)),
				new DomainMemberInfo(typeof(Role), "IsMandatory", Role.IsMandatoryDomainPropertyId, typeof(Role.IsMandatoryPropertyHandler)),
				new DomainMemberInfo(typeof(Role), "IsPrimaryIdComponent", Role.IsPrimaryIdComponentDomainPropertyId, typeof(Role.IsPrimaryIdComponentPropertyHandler)),
				new DomainMemberInfo(typeof(Role), "IsMultiValued", Role.IsMultiValuedDomainPropertyId, typeof(Role.IsMultiValuedPropertyHandler)),
				new DomainMemberInfo(typeof(CardinalityQualifier), "Number", CardinalityQualifier.NumberDomainPropertyId, typeof(CardinalityQualifier.NumberPropertyHandler)),
				new DomainMemberInfo(typeof(CardinalityQualifier), "Operator", CardinalityQualifier.OperatorDomainPropertyId, typeof(CardinalityQualifier.OperatorPropertyHandler)),
				new DomainMemberInfo(typeof(ExclusiveArc), "Number", ExclusiveArc.NumberDomainPropertyId, typeof(ExclusiveArc.NumberPropertyHandler)),
				new DomainMemberInfo(typeof(ExclusiveArc), "IsMandatory", ExclusiveArc.IsMandatoryDomainPropertyId, typeof(ExclusiveArc.IsMandatoryPropertyHandler)),
				new DomainMemberInfo(typeof(ExclusiveArc), "IsPrimaryIdComponent", ExclusiveArc.IsPrimaryIdComponentDomainPropertyId, typeof(ExclusiveArc.IsPrimaryIdComponentPropertyHandler)),
				new DomainMemberInfo(typeof(BinaryAssociation), "Number", BinaryAssociation.NumberDomainPropertyId, typeof(BinaryAssociation.NumberPropertyHandler)),
				new DomainMemberInfo(typeof(BarkerErModel), "Name", BarkerErModel.NameDomainPropertyId, typeof(BarkerErModel.NamePropertyHandler)),
			};
		}
		/// <summary>
		/// Gets the list of generated domain roles.
		/// </summary>
		/// <returns>List of role data.</returns>
		protected sealed override DomainRolePlayerInfo[] GetGeneratedDomainRoles()
		{
			return new DomainRolePlayerInfo[]
			{
				new DomainRolePlayerInfo(typeof(EntityTypeHasAttribute), "EntityType", EntityTypeHasAttribute.EntityTypeDomainRoleId),
				new DomainRolePlayerInfo(typeof(EntityTypeHasAttribute), "Attribute", EntityTypeHasAttribute.AttributeDomainRoleId),
				new DomainRolePlayerInfo(typeof(AttributeHasPossibleValue), "Attribute", AttributeHasPossibleValue.AttributeDomainRoleId),
				new DomainRolePlayerInfo(typeof(AttributeHasPossibleValue), "Value", AttributeHasPossibleValue.ValueDomainRoleId),
				new DomainRolePlayerInfo(typeof(EntityTypeIsSubtypeOfEntityType), "Subtype", EntityTypeIsSubtypeOfEntityType.SubtypeDomainRoleId),
				new DomainRolePlayerInfo(typeof(EntityTypeIsSubtypeOfEntityType), "Supertype", EntityTypeIsSubtypeOfEntityType.SupertypeDomainRoleId),
				new DomainRolePlayerInfo(typeof(EntityTypePlaysRole), "EntityType", EntityTypePlaysRole.EntityTypeDomainRoleId),
				new DomainRolePlayerInfo(typeof(EntityTypePlaysRole), "Role", EntityTypePlaysRole.RoleDomainRoleId),
				new DomainRolePlayerInfo(typeof(RoleHasCardinalityQualifier), "Role", RoleHasCardinalityQualifier.RoleDomainRoleId),
				new DomainRolePlayerInfo(typeof(RoleHasCardinalityQualifier), "CardinalityQualifier", RoleHasCardinalityQualifier.CardinalityQualifierDomainRoleId),
				new DomainRolePlayerInfo(typeof(ExclusiveArcSpansOptionalRole), "ExclusiveArc", ExclusiveArcSpansOptionalRole.ExclusiveArcDomainRoleId),
				new DomainRolePlayerInfo(typeof(ExclusiveArcSpansOptionalRole), "ConstrainedRole", ExclusiveArcSpansOptionalRole.ConstrainedRoleDomainRoleId),
				new DomainRolePlayerInfo(typeof(BinaryAssociationContainsRole), "BinaryAssociation", BinaryAssociationContainsRole.BinaryAssociationDomainRoleId),
				new DomainRolePlayerInfo(typeof(BinaryAssociationContainsRole), "Role", BinaryAssociationContainsRole.RoleDomainRoleId),
				new DomainRolePlayerInfo(typeof(BarkerErModelContainsEntityType), "BarkerErModel", BarkerErModelContainsEntityType.BarkerErModelDomainRoleId),
				new DomainRolePlayerInfo(typeof(BarkerErModelContainsEntityType), "EntityType", BarkerErModelContainsEntityType.EntityTypeDomainRoleId),
				new DomainRolePlayerInfo(typeof(BarkerErModelContainsBinaryAssociation), "BarkerErModel", BarkerErModelContainsBinaryAssociation.BarkerErModelDomainRoleId),
				new DomainRolePlayerInfo(typeof(BarkerErModelContainsBinaryAssociation), "BinaryAssociation", BarkerErModelContainsBinaryAssociation.BinaryAssociationDomainRoleId),
				new DomainRolePlayerInfo(typeof(BarkerErModelContainsExclusiveArc), "BarkerErModel", BarkerErModelContainsExclusiveArc.BarkerErModelDomainRoleId),
				new DomainRolePlayerInfo(typeof(BarkerErModelContainsExclusiveArc), "ExclusiveArc", BarkerErModelContainsExclusiveArc.ExclusiveArcDomainRoleId),
			};
		}
		#endregion
		#region Factory methods
		private static global::System.Collections.Generic.Dictionary<global::System.Type, int> createElementMap;
	
		/// <summary>
		/// Creates an element of specified type.
		/// </summary>
		/// <param name="partition">Partition where element is to be created.</param>
		/// <param name="elementType">Element type which belongs to this domain model.</param>
		/// <param name="propertyAssignments">New element property assignments.</param>
		/// <returns>Created element.</returns>
		[global::System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
		public sealed override DslModeling::ModelElement CreateElement(DslModeling::Partition partition, global::System.Type elementType, DslModeling::PropertyAssignment[] propertyAssignments)
		{
			if (elementType == null) throw new global::System.ArgumentNullException("elementType");
	
			if (createElementMap == null)
			{
				createElementMap = new global::System.Collections.Generic.Dictionary<global::System.Type, int>(10);
				createElementMap.Add(typeof(EntityType), 0);
				createElementMap.Add(typeof(Attribute), 1);
				createElementMap.Add(typeof(Value), 2);
				createElementMap.Add(typeof(Role), 3);
				createElementMap.Add(typeof(CardinalityQualifier), 4);
				createElementMap.Add(typeof(OptionalRole), 5);
				createElementMap.Add(typeof(ExclusiveArc), 6);
				createElementMap.Add(typeof(BinaryAssociation), 7);
				createElementMap.Add(typeof(BarkerErModel), 8);
			}
			int index;
			if (!createElementMap.TryGetValue(elementType, out index))
			{
				throw new global::System.ArgumentException("elementType is not recognized as a type of domain class which belongs to this domain model.");
			}
			switch (index)
			{
				case 0: return new EntityType(partition, propertyAssignments);
				case 1: return new Attribute(partition, propertyAssignments);
				case 2: return new Value(partition, propertyAssignments);
				case 3: return new Role(partition, propertyAssignments);
				case 4: return new CardinalityQualifier(partition, propertyAssignments);
				case 5: return new OptionalRole(partition, propertyAssignments);
				case 6: return new ExclusiveArc(partition, propertyAssignments);
				case 7: return new BinaryAssociation(partition, propertyAssignments);
				case 8: return new BarkerErModel(partition, propertyAssignments);
				default: return null;
			}
		}
	
		private static global::System.Collections.Generic.Dictionary<global::System.Type, int> createElementLinkMap;
	
		/// <summary>
		/// Creates an element link of specified type.
		/// </summary>
		/// <param name="partition">Partition where element is to be created.</param>
		/// <param name="elementLinkType">Element link type which belongs to this domain model.</param>
		/// <param name="roleAssignments">List of relationship role assignments for the new link.</param>
		/// <param name="propertyAssignments">New element property assignments.</param>
		/// <returns>Created element link.</returns>
		[global::System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
		public sealed override DslModeling::ElementLink CreateElementLink(DslModeling::Partition partition, global::System.Type elementLinkType, DslModeling::RoleAssignment[] roleAssignments, DslModeling::PropertyAssignment[] propertyAssignments)
		{
			if (elementLinkType == null) throw new global::System.ArgumentNullException("elementType");
			if (roleAssignments == null) throw new global::System.ArgumentNullException("roleAssignments");
	
			if (createElementLinkMap == null)
			{
				createElementLinkMap = new global::System.Collections.Generic.Dictionary<global::System.Type, int>(10);
				createElementLinkMap.Add(typeof(EntityTypeHasAttribute), 0);
				createElementLinkMap.Add(typeof(AttributeHasPossibleValue), 1);
				createElementLinkMap.Add(typeof(EntityTypeIsSubtypeOfEntityType), 2);
				createElementLinkMap.Add(typeof(EntityTypePlaysRole), 3);
				createElementLinkMap.Add(typeof(RoleHasCardinalityQualifier), 4);
				createElementLinkMap.Add(typeof(ExclusiveArcSpansOptionalRole), 5);
				createElementLinkMap.Add(typeof(BinaryAssociationContainsRole), 6);
				createElementLinkMap.Add(typeof(BarkerErModelContainsEntityType), 7);
				createElementLinkMap.Add(typeof(BarkerErModelContainsBinaryAssociation), 8);
				createElementLinkMap.Add(typeof(BarkerErModelContainsExclusiveArc), 9);
			}
			int index;
			if (!createElementLinkMap.TryGetValue(elementLinkType, out index))
			{
				throw new global::System.ArgumentException("elementLinkType is not recognized as a type of domain relationship which belongs to this domain model.");
			}
			switch (index)
			{
				case 0: return new EntityTypeHasAttribute(partition, roleAssignments, propertyAssignments);
				case 1: return new AttributeHasPossibleValue(partition, roleAssignments, propertyAssignments);
				case 2: return new EntityTypeIsSubtypeOfEntityType(partition, roleAssignments, propertyAssignments);
				case 3: return new EntityTypePlaysRole(partition, roleAssignments, propertyAssignments);
				case 4: return new RoleHasCardinalityQualifier(partition, roleAssignments, propertyAssignments);
				case 5: return new ExclusiveArcSpansOptionalRole(partition, roleAssignments, propertyAssignments);
				case 6: return new BinaryAssociationContainsRole(partition, roleAssignments, propertyAssignments);
				case 7: return new BarkerErModelContainsEntityType(partition, roleAssignments, propertyAssignments);
				case 8: return new BarkerErModelContainsBinaryAssociation(partition, roleAssignments, propertyAssignments);
				case 9: return new BarkerErModelContainsExclusiveArc(partition, roleAssignments, propertyAssignments);
				default: return null;
			}
		}
		#endregion
		#region Resource manager
		
		private static global::System.Resources.ResourceManager resourceManager;
		
		/// <summary>
		/// The base name of this model's resources.
		/// </summary>
		public const string ResourceBaseName = "Neumont.Tools.EntityRelationshipModels.Barker.GeneratedCode.DomainModelResx";
		
		/// <summary>
		/// Gets the DomainModel's ResourceManager. If the ResourceManager does not already exist, then it is created.
		/// </summary>
		public override global::System.Resources.ResourceManager ResourceManager
		{
			[global::System.Diagnostics.DebuggerStepThrough]
			get
			{
				return BarkerDomainModel.SingletonResourceManager;
			}
		}
	
		/// <summary>
		/// Gets the Singleton ResourceManager for this domain model.
		/// </summary>
		public static global::System.Resources.ResourceManager SingletonResourceManager
		{
			[global::System.Diagnostics.DebuggerStepThrough]
			get
			{
				if (BarkerDomainModel.resourceManager == null)
				{
					BarkerDomainModel.resourceManager = new global::System.Resources.ResourceManager(ResourceBaseName, typeof(BarkerDomainModel).Assembly);
				}
				return BarkerDomainModel.resourceManager;
			}
		}
		#endregion
		#region Copy/Remove closures
		/// <summary>
		/// CopyClosure cache
		/// </summary>
		private static DslModeling::IElementVisitorFilter copyClosure;
		/// <summary>
		/// DeleteClosure cache
		/// </summary>
		private static DslModeling::IElementVisitorFilter removeClosure;
		/// <summary>
		/// Returns an IElementVisitorFilter that corresponds to the ClosureType.
		/// </summary>
		/// <param name="type">closure type</param>
		/// <param name="rootElements">collection of root elements</param>
		/// <returns>IElementVisitorFilter or null</returns>
		public override DslModeling::IElementVisitorFilter GetClosureFilter(DslModeling::ClosureType type, global::System.Collections.Generic.ICollection<DslModeling::ModelElement> rootElements)
		{
			switch (type)
			{
				case DslModeling::ClosureType.CopyClosure:
					return BarkerDomainModel.CopyClosure;
				case DslModeling::ClosureType.DeleteClosure:
					return BarkerDomainModel.DeleteClosure;
			}
			return base.GetClosureFilter(type, rootElements);
		}
		/// <summary>
		/// CopyClosure cache
		/// </summary>
		private static DslModeling::IElementVisitorFilter CopyClosure
		{
			get
			{
				// Incorporate all of the closures from the models we extend
				if (BarkerDomainModel.copyClosure == null)
				{
					DslModeling::ChainingElementVisitorFilter copyFilter = new DslModeling::ChainingElementVisitorFilter();
					copyFilter.AddFilter(new BarkerCopyClosure());
					
					BarkerDomainModel.copyClosure = copyFilter;
				}
				return BarkerDomainModel.copyClosure;
			}
		}
		/// <summary>
		/// DeleteClosure cache
		/// </summary>
		private static DslModeling::IElementVisitorFilter DeleteClosure
		{
			get
			{
				// Incorporate all of the closures from the models we extend
				if (BarkerDomainModel.removeClosure == null)
				{
					DslModeling::ChainingElementVisitorFilter removeFilter = new DslModeling::ChainingElementVisitorFilter();
					removeFilter.AddFilter(new BarkerDeleteClosure());
		
					BarkerDomainModel.removeClosure = removeFilter;
				}
				return BarkerDomainModel.removeClosure;
			}
		}
		#endregion
	}
		
	#region Copy/Remove closure classes
	/// <summary>
	/// Remove closure visitor filter
	/// </summary>
	[global::System.CLSCompliant(true)]
	public partial class BarkerDeleteClosure : BarkerDeleteClosureBase, DslModeling::IElementVisitorFilter
	{
		/// <summary>
		/// Constructor
		/// </summary>
		public BarkerDeleteClosure() : base()
		{
		}
	}
	
	/// <summary>
	/// Base class for remove closure visitor filter
	/// </summary>
	public partial class BarkerDeleteClosureBase : DslModeling::IElementVisitorFilter
	{
		/// <summary>
		/// DomainRoles
		/// </summary>
		private global::System.Collections.Generic.Dictionary<global::System.Guid, bool> domainRoles;
		/// <summary>
		/// Constructor
		/// </summary>
		public BarkerDeleteClosureBase()
		{
			#region Initialize DomainData Table
			DomainRoles.Add(global::Neumont.Tools.EntityRelationshipModels.Barker.EntityTypeHasAttribute.AttributeDomainRoleId, true);
			DomainRoles.Add(global::Neumont.Tools.EntityRelationshipModels.Barker.EntityTypePlaysRole.RoleDomainRoleId, true);
			DomainRoles.Add(global::Neumont.Tools.EntityRelationshipModels.Barker.BarkerErModelContainsEntityType.EntityTypeDomainRoleId, true);
			DomainRoles.Add(global::Neumont.Tools.EntityRelationshipModels.Barker.BarkerErModelContainsBinaryAssociation.BinaryAssociationDomainRoleId, true);
			DomainRoles.Add(global::Neumont.Tools.EntityRelationshipModels.Barker.BarkerErModelContainsExclusiveArc.ExclusiveArcDomainRoleId, true);
			#endregion
		}
		/// <summary>
		/// Called to ask the filter if a particular relationship from a source element should be included in the traversal
		/// </summary>
		/// <param name="walker">ElementWalker that is traversing the model</param>
		/// <param name="sourceElement">Model Element playing the source role</param>
		/// <param name="sourceRoleInfo">DomainRoleInfo of the role that the source element is playing in the relationship</param>
		/// <param name="domainRelationshipInfo">DomainRelationshipInfo for the ElementLink in question</param>
		/// <param name="targetRelationship">Relationship in question</param>
		/// <returns>Yes if the relationship should be traversed</returns>
		public virtual DslModeling::VisitorFilterResult ShouldVisitRelationship(DslModeling::ElementWalker walker, DslModeling::ModelElement sourceElement, DslModeling::DomainRoleInfo sourceRoleInfo, DslModeling::DomainRelationshipInfo domainRelationshipInfo, DslModeling::ElementLink targetRelationship)
		{
			return DslModeling::VisitorFilterResult.Yes;
		}
		/// <summary>
		/// Called to ask the filter if a particular role player should be Visited during traversal
		/// </summary>
		/// <param name="walker">ElementWalker that is traversing the model</param>
		/// <param name="sourceElement">Model Element playing the source role</param>
		/// <param name="elementLink">Element Link that forms the relationship to the role player in question</param>
		/// <param name="targetDomainRole">DomainRoleInfo of the target role</param>
		/// <param name="targetRolePlayer">Model Element that plays the target role in the relationship</param>
		/// <returns></returns>
		public virtual DslModeling::VisitorFilterResult ShouldVisitRolePlayer(DslModeling::ElementWalker walker, DslModeling::ModelElement sourceElement, DslModeling::ElementLink elementLink, DslModeling::DomainRoleInfo targetDomainRole, DslModeling::ModelElement targetRolePlayer)
		{
			return this.DomainRoles.ContainsKey(targetDomainRole.Id) ? DslModeling::VisitorFilterResult.Yes : DslModeling::VisitorFilterResult.DoNotCare;
		}
		/// <summary>
		/// DomainRoles
		/// </summary>
		private global::System.Collections.Generic.Dictionary<global::System.Guid, bool> DomainRoles
		{
			get
			{
				if (this.domainRoles == null)
				{
					this.domainRoles = new global::System.Collections.Generic.Dictionary<global::System.Guid, bool>();
				}
				return this.domainRoles;
			}
		}
	
	}
	/// <summary>
	/// Copy closure visitor filter
	/// </summary>
	[global::System.CLSCompliant(true)]
	public partial class BarkerCopyClosure : BarkerCopyClosureBase, DslModeling::IElementVisitorFilter
	{
		/// <summary>
		/// Constructor
		/// </summary>
		public BarkerCopyClosure() : base()
		{
		}
	}
	/// <summary>
	/// Base class for copy closure visitor filter
	/// </summary>
	public partial class BarkerCopyClosureBase : DslModeling::IElementVisitorFilter
	{
		/// <summary>
		/// DomainRoles
		/// </summary>
		private global::System.Collections.Generic.Dictionary<global::System.Guid, bool> domainRoles;
		/// <summary>
		/// Constructor
		/// </summary>
		public BarkerCopyClosureBase()
		{
			#region Initialize DomainData Table
			#endregion
		}
		/// <summary>
		/// Called to ask the filter if a particular relationship from a source element should be included in the traversal
		/// </summary>
		/// <param name="walker">ElementWalker traversing the model</param>
		/// <param name="sourceElement">Model Element playing the source role</param>
		/// <param name="sourceRoleInfo">DomainRoleInfo of the role that the source element is playing in the relationship</param>
		/// <param name="domainRelationshipInfo">DomainRelationshipInfo for the ElementLink in question</param>
		/// <param name="targetRelationship">Relationship in question</param>
		/// <returns>Yes if the relationship should be traversed</returns>
		public virtual DslModeling::VisitorFilterResult ShouldVisitRelationship(DslModeling::ElementWalker walker, DslModeling::ModelElement sourceElement, DslModeling::DomainRoleInfo sourceRoleInfo, DslModeling::DomainRelationshipInfo domainRelationshipInfo, DslModeling::ElementLink targetRelationship)
		{
			return this.DomainRoles.ContainsKey(sourceRoleInfo.Id) ? DslModeling::VisitorFilterResult.Yes : DslModeling::VisitorFilterResult.DoNotCare;
		}
		/// <summary>
		/// Called to ask the filter if a particular role player should be Visited during traversal
		/// </summary>
		/// <param name="walker">ElementWalker traversing the model</param>
		/// <param name="sourceElement">Model Element playing the source role</param>
		/// <param name="elementLink">Element Link that forms the relationship to the role player in question</param>
		/// <param name="targetDomainRole">DomainRoleInfo of the target role</param>
		/// <param name="targetRolePlayer">Model Element that plays the target role in the relationship</param>
		/// <returns></returns>
		public virtual DslModeling::VisitorFilterResult ShouldVisitRolePlayer(DslModeling::ElementWalker walker, DslModeling::ModelElement sourceElement, DslModeling::ElementLink elementLink, DslModeling::DomainRoleInfo targetDomainRole, DslModeling::ModelElement targetRolePlayer)
		{
			return this.DomainRoles.ContainsKey(targetDomainRole.Id) ? DslModeling::VisitorFilterResult.Yes : DslModeling::VisitorFilterResult.DoNotCare;
		}
		/// <summary>
		/// DomainRoles
		/// </summary>
		private global::System.Collections.Generic.Dictionary<global::System.Guid, bool> DomainRoles
		{
			get
			{
				if (this.domainRoles == null)
				{
					this.domainRoles = new global::System.Collections.Generic.Dictionary<global::System.Guid, bool>();
				}
				return this.domainRoles;
			}
		}
	
	}
	#endregion
		
}
namespace Neumont.Tools.EntityRelationshipModels.Barker
{
	/// <summary>
	/// DomainEnumeration: OperatorSymbol
	/// Valid values for comparison operators.
	/// </summary>
	[global::System.Serializable()]
	[global::System.ComponentModel.TypeConverter(typeof(global::Neumont.Tools.Modeling.Design.EnumConverter<OperatorSymbol, global::Neumont.Tools.EntityRelationshipModels.Barker.BarkerErModel>))]
	[global::System.CLSCompliant(true)]
	public enum OperatorSymbol
	{
		/// <summary>
		/// Equal
		/// Description for
		/// Neumont.Tools.EntityRelationshipModels.Barker.OperatorSymbol.Equal
		/// </summary>
		[global::System.Xml.Serialization.XmlEnum("EQUAL")]
		[DslDesign::DescriptionResource("Neumont.Tools.EntityRelationshipModels.Barker.OperatorSymbol/Equal.Description", typeof(global::Neumont.Tools.EntityRelationshipModels.Barker.BarkerDomainModel), "Neumont.Tools.EntityRelationshipModels.Barker.GeneratedCode.DomainModelResx")]
		Equal = 0,
		/// <summary>
		/// LessThan
		/// Description for
		/// Neumont.Tools.EntityRelationshipModels.Barker.OperatorSymbol.LessThan
		/// </summary>
		[global::System.Xml.Serialization.XmlEnum("LESS_THAN")]
		[DslDesign::DescriptionResource("Neumont.Tools.EntityRelationshipModels.Barker.OperatorSymbol/LessThan.Description", typeof(global::Neumont.Tools.EntityRelationshipModels.Barker.BarkerDomainModel), "Neumont.Tools.EntityRelationshipModels.Barker.GeneratedCode.DomainModelResx")]
		LessThan = 1,
		/// <summary>
		/// GreaterThan
		/// Description for
		/// Neumont.Tools.EntityRelationshipModels.Barker.OperatorSymbol.GreaterThan
		/// </summary>
		[global::System.Xml.Serialization.XmlEnum("GREATER_THAN")]
		[DslDesign::DescriptionResource("Neumont.Tools.EntityRelationshipModels.Barker.OperatorSymbol/GreaterThan.Description", typeof(global::Neumont.Tools.EntityRelationshipModels.Barker.BarkerDomainModel), "Neumont.Tools.EntityRelationshipModels.Barker.GeneratedCode.DomainModelResx")]
		GreaterThan = 2,
		/// <summary>
		/// LessThanOrEqualTo
		/// Description for
		/// Neumont.Tools.EntityRelationshipModels.Barker.OperatorSymbol.LessThanOrEqualTo
		/// </summary>
		[global::System.Xml.Serialization.XmlEnum("LESS_THAN_OR_EQUAL_TO")]
		[DslDesign::DescriptionResource("Neumont.Tools.EntityRelationshipModels.Barker.OperatorSymbol/LessThanOrEqualTo.Description", typeof(global::Neumont.Tools.EntityRelationshipModels.Barker.BarkerDomainModel), "Neumont.Tools.EntityRelationshipModels.Barker.GeneratedCode.DomainModelResx")]
		LessThanOrEqualTo = 3,
		/// <summary>
		/// GreaterThanOrEqualTo
		/// Description for
		/// Neumont.Tools.EntityRelationshipModels.Barker.OperatorSymbol.GreaterThanOrEqualTo
		/// </summary>
		[global::System.Xml.Serialization.XmlEnum("GREATER_THAN_OR_EQUAL_TO")]
		[DslDesign::DescriptionResource("Neumont.Tools.EntityRelationshipModels.Barker.OperatorSymbol/GreaterThanOrEqualTo.Description", typeof(global::Neumont.Tools.EntityRelationshipModels.Barker.BarkerDomainModel), "Neumont.Tools.EntityRelationshipModels.Barker.GeneratedCode.DomainModelResx")]
		GreaterThanOrEqualTo = 4,
	}
}

