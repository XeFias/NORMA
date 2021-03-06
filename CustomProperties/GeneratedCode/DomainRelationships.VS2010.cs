﻿#region Common Public License Copyright Notice
/**************************************************************************\
* Natural Object-Role Modeling Architect for Visual Studio                 *
*                                                                          *
* Copyright © Neumont University. All rights reserved.                     *
* Copyright © ORM Solutions, LLC. All rights reserved.                     *
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
namespace ORMSolutions.ORMArchitect.CustomProperties
{
	/// <summary>
	/// DomainRelationship CustomPropertyHasCustomPropertyDefinition
	/// Description for
	/// ORMSolutions.ORMArchitect.CustomProperties.CustomPropertyHasCustomPropertyDefinition
	/// </summary>
	[DslDesign::DisplayNameResource("ORMSolutions.ORMArchitect.CustomProperties.CustomPropertyHasCustomPropertyDefinition.DisplayName", typeof(global::ORMSolutions.ORMArchitect.CustomProperties.CustomPropertiesDomainModel), "ORMSolutions.ORMArchitect.CustomProperties.GeneratedCode.DomainModelResx")]
	[DslDesign::DescriptionResource("ORMSolutions.ORMArchitect.CustomProperties.CustomPropertyHasCustomPropertyDefinition.Description", typeof(global::ORMSolutions.ORMArchitect.CustomProperties.CustomPropertiesDomainModel), "ORMSolutions.ORMArchitect.CustomProperties.GeneratedCode.DomainModelResx")]
	[DslModeling::DomainModelOwner(typeof(global::ORMSolutions.ORMArchitect.CustomProperties.CustomPropertiesDomainModel))]
	[DslModeling::DomainRelationship()]
	[DslModeling::DomainObjectId("1a95e98a-4185-48f4-8fd0-e5af676d26e7")]
	internal sealed partial class CustomPropertyHasCustomPropertyDefinition : DslModeling::ElementLink
	{
		#region Constructors, domain class Id
		
		/// <summary>
		/// CustomPropertyHasCustomPropertyDefinition domain class Id.
		/// </summary>
		public static readonly new global::System.Guid DomainClassId = new global::System.Guid(0x1a95e98a, 0x4185, 0x48f4, 0x8f, 0xd0, 0xe5, 0xaf, 0x67, 0x6d, 0x26, 0xe7);
	
				
		/// <summary>
		/// Constructor
		/// Creates a CustomPropertyHasCustomPropertyDefinition link in the same Partition as the given CustomProperty
		/// </summary>
		/// <param name="source">CustomProperty to use as the source of the relationship.</param>
		/// <param name="target">CustomPropertyDefinition to use as the target of the relationship.</param>
		internal CustomPropertyHasCustomPropertyDefinition(CustomProperty source, CustomPropertyDefinition target)
			: base((source != null ? source.Partition : null), new DslModeling::RoleAssignment[]{new DslModeling::RoleAssignment(CustomPropertyHasCustomPropertyDefinition.CustomPropertyDomainRoleId, source), new DslModeling::RoleAssignment(CustomPropertyHasCustomPropertyDefinition.CustomPropertyDefinitionDomainRoleId, target)}, null)
		{
		}
		
		/// <summary>
		/// Constructor
		/// </summary>
		/// <param name="store">Store where new link is to be created.</param>
		/// <param name="roleAssignments">List of relationship role assignments.</param>
		public CustomPropertyHasCustomPropertyDefinition(DslModeling::Store store, params DslModeling::RoleAssignment[] roleAssignments)
			: base(store != null ? store.DefaultPartitionForClass(DomainClassId) : null, roleAssignments, null)
		{
		}
		
		/// <summary>
		/// Constructor
		/// </summary>
		/// <param name="store">Store where new link is to be created.</param>
		/// <param name="roleAssignments">List of relationship role assignments.</param>
		/// <param name="propertyAssignments">List of properties assignments to set on the new link.</param>
		public CustomPropertyHasCustomPropertyDefinition(DslModeling::Store store, DslModeling::RoleAssignment[] roleAssignments, DslModeling::PropertyAssignment[] propertyAssignments)
			: base(store != null ? store.DefaultPartitionForClass(DomainClassId) : null, roleAssignments, propertyAssignments)
		{
		}
		
		/// <summary>
		/// Constructor
		/// </summary>
		/// <param name="partition">Partition where new link is to be created.</param>
		/// <param name="roleAssignments">List of relationship role assignments.</param>
		public CustomPropertyHasCustomPropertyDefinition(DslModeling::Partition partition, params DslModeling::RoleAssignment[] roleAssignments)
			: base(partition, roleAssignments, null)
		{
		}
		
		/// <summary>
		/// Constructor
		/// </summary>
		/// <param name="partition">Partition where new link is to be created.</param>
		/// <param name="roleAssignments">List of relationship role assignments.</param>
		/// <param name="propertyAssignments">List of properties assignments to set on the new link.</param>
		public CustomPropertyHasCustomPropertyDefinition(DslModeling::Partition partition, DslModeling::RoleAssignment[] roleAssignments, DslModeling::PropertyAssignment[] propertyAssignments)
			: base(partition, roleAssignments, propertyAssignments)
		{
		}
		#endregion
		#region CustomProperty domain role code
		
		/// <summary>
		/// CustomProperty domain role Id.
		/// </summary>
		public static readonly global::System.Guid CustomPropertyDomainRoleId = new global::System.Guid(0xb8bf7986, 0x4312, 0x42e2, 0xb5, 0xc0, 0xa4, 0x60, 0xbb, 0x38, 0x16, 0x66);
		
		/// <summary>
		/// DomainRole CustomProperty
		/// Description for
		/// ORMSolutions.ORMArchitect.CustomProperties.CustomPropertyHasCustomPropertyDefinition.CustomProperty
		/// </summary>
		[DslDesign::DisplayNameResource("ORMSolutions.ORMArchitect.CustomProperties.CustomPropertyHasCustomPropertyDefinition/CustomProperty.DisplayName", typeof(global::ORMSolutions.ORMArchitect.CustomProperties.CustomPropertiesDomainModel), "ORMSolutions.ORMArchitect.CustomProperties.GeneratedCode.DomainModelResx")]
		[DslDesign::DescriptionResource("ORMSolutions.ORMArchitect.CustomProperties.CustomPropertyHasCustomPropertyDefinition/CustomProperty.Description", typeof(global::ORMSolutions.ORMArchitect.CustomProperties.CustomPropertiesDomainModel), "ORMSolutions.ORMArchitect.CustomProperties.GeneratedCode.DomainModelResx")]
		[DslModeling::DomainRole(DslModeling::DomainRoleOrder.Source, PropertyName = "CustomPropertyDefinition", PropertyDisplayNameKey="ORMSolutions.ORMArchitect.CustomProperties.CustomPropertyHasCustomPropertyDefinition/CustomProperty.PropertyDisplayName", PropagatesDelete = true,  PropagatesCopy = DslModeling::PropagatesCopyOption.DoNotPropagateCopy, Multiplicity = DslModeling::Multiplicity.One)]
		[DslModeling::DomainObjectId("b8bf7986-4312-42e2-b5c0-a460bb381666")]
		internal CustomProperty CustomProperty
		{
			[global::System.Diagnostics.DebuggerStepThrough]
			get
			{
				return (CustomProperty)DslModeling::DomainRoleInfo.GetRolePlayer(this, CustomPropertyDomainRoleId);
			}
			[global::System.Diagnostics.DebuggerStepThrough]
			set
			{
				DslModeling::DomainRoleInfo.SetRolePlayer(this, CustomPropertyDomainRoleId, value);
			}
		}
				
		#endregion
		#region Static methods to access CustomPropertyCollection of a CustomPropertyDefinition
		/// <summary>
		/// Gets a list of CustomPropertyCollection.
		/// </summary>
		[global::System.Diagnostics.DebuggerStepThrough]
		[global::System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1011")]
		internal static DslModeling::LinkedElementCollection<CustomProperty> GetCustomPropertyCollection(CustomPropertyDefinition element)
		{
			return GetRoleCollection<DslModeling::LinkedElementCollection<CustomProperty>, CustomProperty>(element, CustomPropertyDefinitionDomainRoleId);
		}
		#endregion
		#region CustomPropertyDefinition domain role code
		
		/// <summary>
		/// CustomPropertyDefinition domain role Id.
		/// </summary>
		public static readonly global::System.Guid CustomPropertyDefinitionDomainRoleId = new global::System.Guid(0xaf59cd4c, 0x9cb9, 0x4fda, 0xa5, 0xf2, 0x83, 0x62, 0xce, 0xc9, 0xa9, 0x4e);
		
		/// <summary>
		/// DomainRole CustomPropertyDefinition
		/// Description for
		/// ORMSolutions.ORMArchitect.CustomProperties.CustomPropertyHasCustomPropertyDefinition.CustomPropertyDefinition
		/// </summary>
		[DslDesign::DisplayNameResource("ORMSolutions.ORMArchitect.CustomProperties.CustomPropertyHasCustomPropertyDefinition/CustomPropertyDefinition.DisplayName", typeof(global::ORMSolutions.ORMArchitect.CustomProperties.CustomPropertiesDomainModel), "ORMSolutions.ORMArchitect.CustomProperties.GeneratedCode.DomainModelResx")]
		[DslDesign::DescriptionResource("ORMSolutions.ORMArchitect.CustomProperties.CustomPropertyHasCustomPropertyDefinition/CustomPropertyDefinition.Description", typeof(global::ORMSolutions.ORMArchitect.CustomProperties.CustomPropertiesDomainModel), "ORMSolutions.ORMArchitect.CustomProperties.GeneratedCode.DomainModelResx")]
		[DslModeling::DomainRole(DslModeling::DomainRoleOrder.Target, PropertyName = "CustomPropertyCollection", PropertyDisplayNameKey="ORMSolutions.ORMArchitect.CustomProperties.CustomPropertyHasCustomPropertyDefinition/CustomPropertyDefinition.PropertyDisplayName",  PropagatesCopy = DslModeling::PropagatesCopyOption.DoNotPropagateCopy, Multiplicity = DslModeling::Multiplicity.ZeroMany)]
		[DslModeling::DomainObjectId("af59cd4c-9cb9-4fda-a5f2-8362cec9a94e")]
		internal CustomPropertyDefinition CustomPropertyDefinition
		{
			[global::System.Diagnostics.DebuggerStepThrough]
			get
			{
				return (CustomPropertyDefinition)DslModeling::DomainRoleInfo.GetRolePlayer(this, CustomPropertyDefinitionDomainRoleId);
			}
			[global::System.Diagnostics.DebuggerStepThrough]
			set
			{
				DslModeling::DomainRoleInfo.SetRolePlayer(this, CustomPropertyDefinitionDomainRoleId, value);
			}
		}
				
		#endregion
		#region Static methods to access CustomPropertyDefinition of a CustomProperty
		/// <summary>
		/// Gets CustomPropertyDefinition.
		/// </summary>
		[global::System.Diagnostics.DebuggerStepThrough]
		[global::System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1011")]
		internal static CustomPropertyDefinition GetCustomPropertyDefinition(CustomProperty element)
		{
			return DslModeling::DomainRoleInfo.GetLinkedElement(element, CustomPropertyDomainRoleId) as CustomPropertyDefinition;
		}
		
		/// <summary>
		/// Sets CustomPropertyDefinition.
		/// </summary>
		[global::System.Diagnostics.DebuggerStepThrough]
		[global::System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1011")]
		internal static void SetCustomPropertyDefinition(CustomProperty element, CustomPropertyDefinition newCustomPropertyDefinition)
		{
			DslModeling::DomainRoleInfo.SetLinkedElement(element, CustomPropertyDomainRoleId, newCustomPropertyDefinition);
		}
		#endregion
		#region CustomProperty link accessor
		/// <summary>
		/// Get the CustomPropertyHasCustomPropertyDefinition link to a CustomProperty.
		/// </summary>
		[global::System.Diagnostics.DebuggerStepThrough]
		[global::System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1011")]
		internal static global::ORMSolutions.ORMArchitect.CustomProperties.CustomPropertyHasCustomPropertyDefinition GetLinkToCustomPropertyDefinition (global::ORMSolutions.ORMArchitect.CustomProperties.CustomProperty customPropertyInstance)
		{
			global::System.Collections.Generic.IList<global::ORMSolutions.ORMArchitect.CustomProperties.CustomPropertyHasCustomPropertyDefinition> links = DslModeling::DomainRoleInfo.GetElementLinks<global::ORMSolutions.ORMArchitect.CustomProperties.CustomPropertyHasCustomPropertyDefinition>(customPropertyInstance, global::ORMSolutions.ORMArchitect.CustomProperties.CustomPropertyHasCustomPropertyDefinition.CustomPropertyDomainRoleId);
			global::System.Diagnostics.Debug.Assert(links.Count <= 1, "Multiplicity of CustomProperty not obeyed.");
			if ( links.Count == 0 )
			{
				return null;
			}
			else
			{
				return links[0];
			}
		}
		#endregion
		#region CustomPropertyDefinition link accessor
		/// <summary>
		/// Get the list of CustomPropertyHasCustomPropertyDefinition links to a CustomPropertyDefinition.
		/// </summary>
		[global::System.Diagnostics.DebuggerStepThrough]
		[global::System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1011")]
		internal static global::System.Collections.ObjectModel.ReadOnlyCollection<global::ORMSolutions.ORMArchitect.CustomProperties.CustomPropertyHasCustomPropertyDefinition> GetLinksToCustomPropertyCollection ( global::ORMSolutions.ORMArchitect.CustomProperties.CustomPropertyDefinition customPropertyDefinitionInstance )
		{
			return DslModeling::DomainRoleInfo.GetElementLinks<global::ORMSolutions.ORMArchitect.CustomProperties.CustomPropertyHasCustomPropertyDefinition>(customPropertyDefinitionInstance, global::ORMSolutions.ORMArchitect.CustomProperties.CustomPropertyHasCustomPropertyDefinition.CustomPropertyDefinitionDomainRoleId);
		}
		#endregion
		#region CustomPropertyHasCustomPropertyDefinition instance accessors
		
		/// <summary>
		/// Get any CustomPropertyHasCustomPropertyDefinition links between a given CustomProperty and a CustomPropertyDefinition.
		/// </summary>
		[global::System.Diagnostics.DebuggerStepThrough]
		[global::System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1011")]
		internal static global::System.Collections.ObjectModel.ReadOnlyCollection<global::ORMSolutions.ORMArchitect.CustomProperties.CustomPropertyHasCustomPropertyDefinition> GetLinks( global::ORMSolutions.ORMArchitect.CustomProperties.CustomProperty source, global::ORMSolutions.ORMArchitect.CustomProperties.CustomPropertyDefinition target )
		{
			global::System.Collections.Generic.List<global::ORMSolutions.ORMArchitect.CustomProperties.CustomPropertyHasCustomPropertyDefinition> outLinks = new global::System.Collections.Generic.List<global::ORMSolutions.ORMArchitect.CustomProperties.CustomPropertyHasCustomPropertyDefinition>();
			global::System.Collections.Generic.IList<global::ORMSolutions.ORMArchitect.CustomProperties.CustomPropertyHasCustomPropertyDefinition> links = DslModeling::DomainRoleInfo.GetElementLinks<global::ORMSolutions.ORMArchitect.CustomProperties.CustomPropertyHasCustomPropertyDefinition>(source, global::ORMSolutions.ORMArchitect.CustomProperties.CustomPropertyHasCustomPropertyDefinition.CustomPropertyDomainRoleId);
			foreach ( global::ORMSolutions.ORMArchitect.CustomProperties.CustomPropertyHasCustomPropertyDefinition link in links )
			{
				if ( target.Equals(link.CustomPropertyDefinition) )
				{
					outLinks.Add(link);
				}
			}
			return outLinks.AsReadOnly();
		}
		/// <summary>
		/// Get the one CustomPropertyHasCustomPropertyDefinition link between a given CustomPropertyand a CustomPropertyDefinition.
		/// </summary>
		[global::System.Diagnostics.DebuggerStepThrough]
		[global::System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1011")]
		internal static global::ORMSolutions.ORMArchitect.CustomProperties.CustomPropertyHasCustomPropertyDefinition GetLink( global::ORMSolutions.ORMArchitect.CustomProperties.CustomProperty source, global::ORMSolutions.ORMArchitect.CustomProperties.CustomPropertyDefinition target )
		{
			global::System.Collections.Generic.IList<global::ORMSolutions.ORMArchitect.CustomProperties.CustomPropertyHasCustomPropertyDefinition> links = DslModeling::DomainRoleInfo.GetElementLinks<global::ORMSolutions.ORMArchitect.CustomProperties.CustomPropertyHasCustomPropertyDefinition>(source, global::ORMSolutions.ORMArchitect.CustomProperties.CustomPropertyHasCustomPropertyDefinition.CustomPropertyDomainRoleId);
			foreach ( global::ORMSolutions.ORMArchitect.CustomProperties.CustomPropertyHasCustomPropertyDefinition link in links )
			{
				if ( target.Equals(link.CustomPropertyDefinition) )
				{
					return link;
				}
			}
			return null;
		}
		
		#endregion
	}
}
namespace ORMSolutions.ORMArchitect.CustomProperties
{
	/// <summary>
	/// DomainRelationship CustomPropertyGroupContainsCustomPropertyDefinition
	/// Description for
	/// ORMSolutions.ORMArchitect.CustomProperties.CustomPropertyGroupContainsCustomPropertyDefinition
	/// </summary>
	[DslDesign::DisplayNameResource("ORMSolutions.ORMArchitect.CustomProperties.CustomPropertyGroupContainsCustomPropertyDefinition.DisplayName", typeof(global::ORMSolutions.ORMArchitect.CustomProperties.CustomPropertiesDomainModel), "ORMSolutions.ORMArchitect.CustomProperties.GeneratedCode.DomainModelResx")]
	[DslDesign::DescriptionResource("ORMSolutions.ORMArchitect.CustomProperties.CustomPropertyGroupContainsCustomPropertyDefinition.Description", typeof(global::ORMSolutions.ORMArchitect.CustomProperties.CustomPropertiesDomainModel), "ORMSolutions.ORMArchitect.CustomProperties.GeneratedCode.DomainModelResx")]
	[DslModeling::DomainModelOwner(typeof(global::ORMSolutions.ORMArchitect.CustomProperties.CustomPropertiesDomainModel))]
	[DslModeling::DomainRelationship(IsEmbedding=true)]
	[DslModeling::DomainObjectId("157c325f-561f-430d-95bb-1ae421fc3eda")]
	internal sealed partial class CustomPropertyGroupContainsCustomPropertyDefinition : DslModeling::ElementLink
	{
		#region Constructors, domain class Id
		
		/// <summary>
		/// CustomPropertyGroupContainsCustomPropertyDefinition domain class Id.
		/// </summary>
		public static readonly new global::System.Guid DomainClassId = new global::System.Guid(0x157c325f, 0x561f, 0x430d, 0x95, 0xbb, 0x1a, 0xe4, 0x21, 0xfc, 0x3e, 0xda);
	
				
		/// <summary>
		/// Constructor
		/// Creates a CustomPropertyGroupContainsCustomPropertyDefinition link in the same Partition as the given CustomPropertyGroup
		/// </summary>
		/// <param name="source">CustomPropertyGroup to use as the source of the relationship.</param>
		/// <param name="target">CustomPropertyDefinition to use as the target of the relationship.</param>
		internal CustomPropertyGroupContainsCustomPropertyDefinition(CustomPropertyGroup source, CustomPropertyDefinition target)
			: base((source != null ? source.Partition : null), new DslModeling::RoleAssignment[]{new DslModeling::RoleAssignment(CustomPropertyGroupContainsCustomPropertyDefinition.CustomPropertyGroupDomainRoleId, source), new DslModeling::RoleAssignment(CustomPropertyGroupContainsCustomPropertyDefinition.CustomPropertyDefinitionDomainRoleId, target)}, null)
		{
		}
		
		/// <summary>
		/// Constructor
		/// </summary>
		/// <param name="store">Store where new link is to be created.</param>
		/// <param name="roleAssignments">List of relationship role assignments.</param>
		public CustomPropertyGroupContainsCustomPropertyDefinition(DslModeling::Store store, params DslModeling::RoleAssignment[] roleAssignments)
			: base(store != null ? store.DefaultPartitionForClass(DomainClassId) : null, roleAssignments, null)
		{
		}
		
		/// <summary>
		/// Constructor
		/// </summary>
		/// <param name="store">Store where new link is to be created.</param>
		/// <param name="roleAssignments">List of relationship role assignments.</param>
		/// <param name="propertyAssignments">List of properties assignments to set on the new link.</param>
		public CustomPropertyGroupContainsCustomPropertyDefinition(DslModeling::Store store, DslModeling::RoleAssignment[] roleAssignments, DslModeling::PropertyAssignment[] propertyAssignments)
			: base(store != null ? store.DefaultPartitionForClass(DomainClassId) : null, roleAssignments, propertyAssignments)
		{
		}
		
		/// <summary>
		/// Constructor
		/// </summary>
		/// <param name="partition">Partition where new link is to be created.</param>
		/// <param name="roleAssignments">List of relationship role assignments.</param>
		public CustomPropertyGroupContainsCustomPropertyDefinition(DslModeling::Partition partition, params DslModeling::RoleAssignment[] roleAssignments)
			: base(partition, roleAssignments, null)
		{
		}
		
		/// <summary>
		/// Constructor
		/// </summary>
		/// <param name="partition">Partition where new link is to be created.</param>
		/// <param name="roleAssignments">List of relationship role assignments.</param>
		/// <param name="propertyAssignments">List of properties assignments to set on the new link.</param>
		public CustomPropertyGroupContainsCustomPropertyDefinition(DslModeling::Partition partition, DslModeling::RoleAssignment[] roleAssignments, DslModeling::PropertyAssignment[] propertyAssignments)
			: base(partition, roleAssignments, propertyAssignments)
		{
		}
		#endregion
		#region CustomPropertyGroup domain role code
		
		/// <summary>
		/// CustomPropertyGroup domain role Id.
		/// </summary>
		public static readonly global::System.Guid CustomPropertyGroupDomainRoleId = new global::System.Guid(0xcc4a4e71, 0x9945, 0x4b47, 0xa0, 0x10, 0x33, 0xe2, 0xf7, 0x86, 0x46, 0xfa);
		
		/// <summary>
		/// DomainRole CustomPropertyGroup
		/// Description for
		/// ORMSolutions.ORMArchitect.CustomProperties.CustomPropertyGroupContainsCustomPropertyDefinition.CustomPropertyGroup
		/// </summary>
		[DslDesign::DisplayNameResource("ORMSolutions.ORMArchitect.CustomProperties.CustomPropertyGroupContainsCustomPropertyDefinition/CustomPropertyGroup.DisplayName", typeof(global::ORMSolutions.ORMArchitect.CustomProperties.CustomPropertiesDomainModel), "ORMSolutions.ORMArchitect.CustomProperties.GeneratedCode.DomainModelResx")]
		[DslDesign::DescriptionResource("ORMSolutions.ORMArchitect.CustomProperties.CustomPropertyGroupContainsCustomPropertyDefinition/CustomPropertyGroup.Description", typeof(global::ORMSolutions.ORMArchitect.CustomProperties.CustomPropertiesDomainModel), "ORMSolutions.ORMArchitect.CustomProperties.GeneratedCode.DomainModelResx")]
		[DslModeling::DomainRole(DslModeling::DomainRoleOrder.Source, PropertyName = "CustomPropertyDefinitionCollection", PropertyDisplayNameKey="ORMSolutions.ORMArchitect.CustomProperties.CustomPropertyGroupContainsCustomPropertyDefinition/CustomPropertyGroup.PropertyDisplayName",  PropagatesCopy = DslModeling::PropagatesCopyOption.DoNotPropagateCopy, Multiplicity = DslModeling::Multiplicity.ZeroMany)]
		[DslModeling::DomainObjectId("cc4a4e71-9945-4b47-a010-33e2f78646fa")]
		internal CustomPropertyGroup CustomPropertyGroup
		{
			[global::System.Diagnostics.DebuggerStepThrough]
			get
			{
				return (CustomPropertyGroup)DslModeling::DomainRoleInfo.GetRolePlayer(this, CustomPropertyGroupDomainRoleId);
			}
			[global::System.Diagnostics.DebuggerStepThrough]
			set
			{
				DslModeling::DomainRoleInfo.SetRolePlayer(this, CustomPropertyGroupDomainRoleId, value);
			}
		}
				
		#endregion
		#region Static methods to access CustomPropertyGroup of a CustomPropertyDefinition
		/// <summary>
		/// Gets CustomPropertyGroup.
		/// </summary>
		[global::System.Diagnostics.DebuggerStepThrough]
		[global::System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1011")]
		internal static CustomPropertyGroup GetCustomPropertyGroup(CustomPropertyDefinition element)
		{
			return DslModeling::DomainRoleInfo.GetLinkedElement(element, CustomPropertyDefinitionDomainRoleId) as CustomPropertyGroup;
		}
		
		/// <summary>
		/// Sets CustomPropertyGroup.
		/// </summary>
		[global::System.Diagnostics.DebuggerStepThrough]
		[global::System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1011")]
		internal static void SetCustomPropertyGroup(CustomPropertyDefinition element, CustomPropertyGroup newCustomPropertyGroup)
		{
			DslModeling::DomainRoleInfo.SetLinkedElement(element, CustomPropertyDefinitionDomainRoleId, newCustomPropertyGroup);
		}
		#endregion
		#region CustomPropertyDefinition domain role code
		
		/// <summary>
		/// CustomPropertyDefinition domain role Id.
		/// </summary>
		public static readonly global::System.Guid CustomPropertyDefinitionDomainRoleId = new global::System.Guid(0x6b330d54, 0x4307, 0x4117, 0x83, 0xe2, 0x6c, 0x91, 0x24, 0x26, 0x75, 0xf1);
		
		/// <summary>
		/// DomainRole CustomPropertyDefinition
		/// Description for
		/// ORMSolutions.ORMArchitect.CustomProperties.CustomPropertyGroupContainsCustomPropertyDefinition.CustomPropertyDefinition
		/// </summary>
		[DslDesign::DisplayNameResource("ORMSolutions.ORMArchitect.CustomProperties.CustomPropertyGroupContainsCustomPropertyDefinition/CustomPropertyDefinition.DisplayName", typeof(global::ORMSolutions.ORMArchitect.CustomProperties.CustomPropertiesDomainModel), "ORMSolutions.ORMArchitect.CustomProperties.GeneratedCode.DomainModelResx")]
		[DslDesign::DescriptionResource("ORMSolutions.ORMArchitect.CustomProperties.CustomPropertyGroupContainsCustomPropertyDefinition/CustomPropertyDefinition.Description", typeof(global::ORMSolutions.ORMArchitect.CustomProperties.CustomPropertiesDomainModel), "ORMSolutions.ORMArchitect.CustomProperties.GeneratedCode.DomainModelResx")]
		[DslModeling::DomainRole(DslModeling::DomainRoleOrder.Target, PropertyName = "CustomPropertyGroup", PropertyDisplayNameKey="ORMSolutions.ORMArchitect.CustomProperties.CustomPropertyGroupContainsCustomPropertyDefinition/CustomPropertyDefinition.PropertyDisplayName", PropagatesDelete = true,  PropagatesCopy = DslModeling::PropagatesCopyOption.DoNotPropagateCopy, Multiplicity = DslModeling::Multiplicity.One)]
		[DslModeling::DomainObjectId("6b330d54-4307-4117-83e2-6c91242675f1")]
		internal CustomPropertyDefinition CustomPropertyDefinition
		{
			[global::System.Diagnostics.DebuggerStepThrough]
			get
			{
				return (CustomPropertyDefinition)DslModeling::DomainRoleInfo.GetRolePlayer(this, CustomPropertyDefinitionDomainRoleId);
			}
			[global::System.Diagnostics.DebuggerStepThrough]
			set
			{
				DslModeling::DomainRoleInfo.SetRolePlayer(this, CustomPropertyDefinitionDomainRoleId, value);
			}
		}
				
		#endregion
		#region Static methods to access CustomPropertyDefinitionCollection of a CustomPropertyGroup
		/// <summary>
		/// Gets a list of CustomPropertyDefinitionCollection.
		/// </summary>
		[global::System.Diagnostics.DebuggerStepThrough]
		[global::System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1011")]
		internal static DslModeling::LinkedElementCollection<CustomPropertyDefinition> GetCustomPropertyDefinitionCollection(CustomPropertyGroup element)
		{
			return GetRoleCollection<DslModeling::LinkedElementCollection<CustomPropertyDefinition>, CustomPropertyDefinition>(element, CustomPropertyGroupDomainRoleId);
		}
		#endregion
		#region CustomPropertyGroup link accessor
		/// <summary>
		/// Get the list of CustomPropertyGroupContainsCustomPropertyDefinition links to a CustomPropertyGroup.
		/// </summary>
		[global::System.Diagnostics.DebuggerStepThrough]
		[global::System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1011")]
		internal static global::System.Collections.ObjectModel.ReadOnlyCollection<global::ORMSolutions.ORMArchitect.CustomProperties.CustomPropertyGroupContainsCustomPropertyDefinition> GetLinksToCustomPropertyDefinitionCollection ( global::ORMSolutions.ORMArchitect.CustomProperties.CustomPropertyGroup customPropertyGroupInstance )
		{
			return DslModeling::DomainRoleInfo.GetElementLinks<global::ORMSolutions.ORMArchitect.CustomProperties.CustomPropertyGroupContainsCustomPropertyDefinition>(customPropertyGroupInstance, global::ORMSolutions.ORMArchitect.CustomProperties.CustomPropertyGroupContainsCustomPropertyDefinition.CustomPropertyGroupDomainRoleId);
		}
		#endregion
		#region CustomPropertyDefinition link accessor
		/// <summary>
		/// Get the CustomPropertyGroupContainsCustomPropertyDefinition link to a CustomPropertyDefinition.
		/// </summary>
		[global::System.Diagnostics.DebuggerStepThrough]
		[global::System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1011")]
		internal static global::ORMSolutions.ORMArchitect.CustomProperties.CustomPropertyGroupContainsCustomPropertyDefinition GetLinkToCustomPropertyGroup (global::ORMSolutions.ORMArchitect.CustomProperties.CustomPropertyDefinition customPropertyDefinitionInstance)
		{
			global::System.Collections.Generic.IList<global::ORMSolutions.ORMArchitect.CustomProperties.CustomPropertyGroupContainsCustomPropertyDefinition> links = DslModeling::DomainRoleInfo.GetElementLinks<global::ORMSolutions.ORMArchitect.CustomProperties.CustomPropertyGroupContainsCustomPropertyDefinition>(customPropertyDefinitionInstance, global::ORMSolutions.ORMArchitect.CustomProperties.CustomPropertyGroupContainsCustomPropertyDefinition.CustomPropertyDefinitionDomainRoleId);
			global::System.Diagnostics.Debug.Assert(links.Count <= 1, "Multiplicity of CustomPropertyDefinition not obeyed.");
			if ( links.Count == 0 )
			{
				return null;
			}
			else
			{
				return links[0];
			}
		}
		#endregion
		#region CustomPropertyGroupContainsCustomPropertyDefinition instance accessors
		
		/// <summary>
		/// Get any CustomPropertyGroupContainsCustomPropertyDefinition links between a given CustomPropertyGroup and a CustomPropertyDefinition.
		/// </summary>
		[global::System.Diagnostics.DebuggerStepThrough]
		[global::System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1011")]
		internal static global::System.Collections.ObjectModel.ReadOnlyCollection<global::ORMSolutions.ORMArchitect.CustomProperties.CustomPropertyGroupContainsCustomPropertyDefinition> GetLinks( global::ORMSolutions.ORMArchitect.CustomProperties.CustomPropertyGroup source, global::ORMSolutions.ORMArchitect.CustomProperties.CustomPropertyDefinition target )
		{
			global::System.Collections.Generic.List<global::ORMSolutions.ORMArchitect.CustomProperties.CustomPropertyGroupContainsCustomPropertyDefinition> outLinks = new global::System.Collections.Generic.List<global::ORMSolutions.ORMArchitect.CustomProperties.CustomPropertyGroupContainsCustomPropertyDefinition>();
			global::System.Collections.Generic.IList<global::ORMSolutions.ORMArchitect.CustomProperties.CustomPropertyGroupContainsCustomPropertyDefinition> links = DslModeling::DomainRoleInfo.GetElementLinks<global::ORMSolutions.ORMArchitect.CustomProperties.CustomPropertyGroupContainsCustomPropertyDefinition>(source, global::ORMSolutions.ORMArchitect.CustomProperties.CustomPropertyGroupContainsCustomPropertyDefinition.CustomPropertyGroupDomainRoleId);
			foreach ( global::ORMSolutions.ORMArchitect.CustomProperties.CustomPropertyGroupContainsCustomPropertyDefinition link in links )
			{
				if ( target.Equals(link.CustomPropertyDefinition) )
				{
					outLinks.Add(link);
				}
			}
			return outLinks.AsReadOnly();
		}
		/// <summary>
		/// Get the one CustomPropertyGroupContainsCustomPropertyDefinition link between a given CustomPropertyGroupand a CustomPropertyDefinition.
		/// </summary>
		[global::System.Diagnostics.DebuggerStepThrough]
		[global::System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1011")]
		internal static global::ORMSolutions.ORMArchitect.CustomProperties.CustomPropertyGroupContainsCustomPropertyDefinition GetLink( global::ORMSolutions.ORMArchitect.CustomProperties.CustomPropertyGroup source, global::ORMSolutions.ORMArchitect.CustomProperties.CustomPropertyDefinition target )
		{
			global::System.Collections.Generic.IList<global::ORMSolutions.ORMArchitect.CustomProperties.CustomPropertyGroupContainsCustomPropertyDefinition> links = DslModeling::DomainRoleInfo.GetElementLinks<global::ORMSolutions.ORMArchitect.CustomProperties.CustomPropertyGroupContainsCustomPropertyDefinition>(source, global::ORMSolutions.ORMArchitect.CustomProperties.CustomPropertyGroupContainsCustomPropertyDefinition.CustomPropertyGroupDomainRoleId);
			foreach ( global::ORMSolutions.ORMArchitect.CustomProperties.CustomPropertyGroupContainsCustomPropertyDefinition link in links )
			{
				if ( target.Equals(link.CustomPropertyDefinition) )
				{
					return link;
				}
			}
			return null;
		}
		
		#endregion
	}
}
