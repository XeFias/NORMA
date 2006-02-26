using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Drawing.Design;
using System.Data;
using System.Text;
using System.Windows.Forms;
using System.Windows.Forms.Design;
using Microsoft.Build.BuildEngine;
using Microsoft.VisualStudio.VirtualTreeGrid;

namespace Neumont.Tools.ORM.ORMCustomTool
{
	public sealed partial class ORMCustomTool
	{
		private sealed partial class ORMCustomToolPropertyDescriptor : PropertyDescriptor
		{
			// TODO: Localize this.
			public ORMCustomToolPropertyDescriptor()
				: base("ORM Generator Selection", null)
			{
			}

			public override object GetEditor(Type editorBaseType)
			{
				return new ORMCustomToolUITypeEditor();
			}

			public override bool CanResetValue(object component)
			{
				return false;
			}

			public override Type ComponentType
			{
				get { return typeof(ORMCustomTool); }
			}

			public override object GetValue(object component)
			{
				return null;
			}

			public override bool IsReadOnly
			{
				get { return false; }
			}

			public override Type PropertyType
			{
				get { return typeof(ORMCustomTool); }
			}

			public override void ResetValue(object component)
			{
				// Do nothing.
			}

			public override void SetValue(object component, object value)
			{
				// Do nothing.
			}

			public override bool ShouldSerializeValue(object component)
			{
				return false;
			}
		}
	}
}