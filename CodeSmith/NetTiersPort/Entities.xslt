<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet
	version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:se="http://NetTiers/2.2/SchemaExplorer"
	xmlns:plx="http://schemas.neumont.edu/CodeGeneration/PLiX"
	xmlns:exsl="http://exslt.org/common"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt"
	xmlns:csc="urn:nettiers:CommonSqlCode"
	xmlns:tmp="urn:temporary"
	extension-element-prefixes="exsl msxsl csc"
	exclude-result-prefixes="se xsl tmp">
	<xsl:include href="EntityScript.xslt"/>
	<!-- DEBUG: indent="yes" is for debugging only, has sideeffects on docComment output. -->
	<xsl:output method="xml" indent="no"/>
	<xsl:param name="CustomToolNamespace" select="'TestNamespace'"/>
	<xsl:param name="NetTiersSettings" select="document('NETTiersSettings.xml')/child::*"/>
	<xsl:variable name="settings" select="$NetTiersSettings/child::*"/>
	<xsl:variable name="DALNamespace" select="concat($CustomToolNamespace,'.',$settings[@name='DataAccessLayerNamespace'])"/>
	<xsl:variable name="BLLNamespace" select="concat($CustomToolNamespace,'.',$settings[@name='BusinessLogicLayerNamespace'])"/>
	<xsl:template match="/">
		<xsl:variable name="initializeSettings">
			<xsl:value-of select="csc:SetChangeUnderscoreToPascalCase(boolean($settings[@name='ChangeUnderscoreToPascalCase']))"/>
			<xsl:value-of select="csc:SetUsePascalCasing($settings[@name='UsePascalCasing'])"/>
			<xsl:value-of select="csc:SetManyToManyFormat($settings[@name='ManyToManyFormat'])"/>
		</xsl:variable>
		<plx:root>
			<plx:namespaceImport name="System"/>
			<plx:namespaceImport name="System.Text"/>
			<plx:namespaceImport name="System.Text.RegularExpressions"/>
			<plx:namespaceImport name="System.ComponentModel"/>
			<plx:namespaceImport name="System.Collections"/>
			<plx:namespaceImport name="System.Collections.Generic"/>
			<plx:namespaceImport name="System.Data"/>
			<plx:namespaceImport name="System.Data.Common"/>
			<plx:namespaceImport name="System.Diagnostics"/>
			<plx:namespaceImport name="System.Runtime.Serialization"/>
			<plx:namespaceImport name="System.Xml.Serialization"/>
			<plx:namespaceImport name="Microsoft.Practices.EnterpriseLibrary.Caching"/>
			<plx:namespaceImport name="Microsoft.Practices.EnterpriseLibrary.Common.Configuration"/>
			<plx:namespaceImport name="Microsoft.Practices.ObjectBuilder"/>
			<plx:namespaceImport name="System.Reflection"/>
			<plx:namespaceImport name="{$CustomToolNamespace}"/>
			<plx:namespaceImport name="{$DALNamespace}"/>
			<plx:namespaceImport name="{$BLLNamespace}"/>
			
			<!-- **********************************************************-->
			<!-- TRANSFORM FOR CODESMITH 4.0 SAMPLES/NETTIERS/ENTITIES CSTs-->
			<!-- **********************************************************-->
			
			<!-- START Validation Namespace -->
			<plx:namespace name="{$BLLNamespace}.Validation">
				<!-- START Entities.Validation.BrokenRule.cst -->
				<plx:pragma type="region" data="BrokenRule Class"/>
				<plx:class name="BrokenRule" visibility="public">
					<plx:attribute dataTypeName="SerializableAttribute" dataTypeQualifier="System"/>
					<plx:field name="_ruleName" visibility="private" dataTypeName=".string"/>
					<plx:field name="_description" visibility="private" dataTypeName=".string"/>
					<plx:field name="_property" visibility="private" dataTypeName=".string"/>
					<plx:property name="RuleName" visibility="public">
						<plx:returns dataTypeName=".string"/>
						<plx:get>
							<plx:return>
								<plx:callThis name="_ruleName" type="field"/>
							</plx:return>
						</plx:get>
					</plx:property>
					<plx:property name="Description" visibility="public">
						<plx:returns dataTypeName=".string"/>
						<plx:get>
							<plx:return>
								<plx:callThis name="_description" type="field"/>
							</plx:return>
						</plx:get>
					</plx:property>
					<plx:property name="Property" visibility="public">
						<plx:returns dataTypeName=".string"/>
						<plx:get>
							<plx:return>
								<plx:callThis name="_property" type="field"/>
							</plx:return>
						</plx:get>
					</plx:property>
					<plx:function name=".construct" visibility="private"/>
					<plx:function name=".construct" visibility="internal">
						<plx:param name="rule" dataTypeName="ValidationRuleInfo"/>
						<plx:assign>
							<plx:left>
								<plx:callThis name="_ruleName" type="field"/>
							</plx:left>
							<plx:right>
								<plx:callInstance name="RuleName" type="property">
									<plx:callObject>
										<plx:nameRef name="rule" type="parameter"/>
									</plx:callObject>
								</plx:callInstance>
							</plx:right>
						</plx:assign>
						<plx:assign>
							<plx:left>
								<plx:callThis name="_description" type="field"/>
							</plx:left>
							<plx:right>
								<plx:callInstance name="Description" type="property">
									<plx:callObject>
										<plx:callInstance name="ValidationRuleArgs" type="property">
											<plx:callObject>
												<plx:nameRef name="rule" type="parameter"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:callObject>
								</plx:callInstance>
							</plx:right>
						</plx:assign>
						<plx:assign>
							<plx:left>
								<plx:callThis name="_property" type="field"/>
							</plx:left>
							<plx:right>
								<plx:callInstance name="PropertyName" type="property">
									<plx:callObject>
										<plx:callInstance name="ValidationRuleArgs" type="property">
											<plx:callObject>
												<plx:nameRef name="rule" type="parameter"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:callObject>
								</plx:callInstance>
							</plx:right>
						</plx:assign>
					</plx:function>
				</plx:class>
				<plx:pragma type="closeRegion" data="BrokenRule Class"/>
				<!-- END Entities.Validation.BrokenRule.cst -->

				<!-- START Entities.Validation.BrokenRulesList.cst -->
				<plx:pragma type="region" data="BrokenRulesList Class"/>
				<plx:class name="BrokenRulesList" visibility="public">
					<plx:attribute dataTypeName="SerializableAttribute" dataTypeQualifier="System"/>
					<plx:derivesFromClass dataTypeName="BindingList" dataTypeQualifier="System.ComponentModel">
						<plx:passTypeParam dataTypeName="BrokenRule"/>
					</plx:derivesFromClass>
					<plx:function name="GetFirstBrokenRule" visibility="public">
						<plx:param name="property" dataTypeName=".string"/>
						<plx:returns dataTypeName="BrokenRule"/>
						<plx:iterator localName="item" dataTypeName="BrokenRule">
							<plx:initialize>
								<plx:thisKeyword/>
							</plx:initialize>
							<plx:branch>
								<plx:condition>
									<plx:binaryOperator type="equality">
										<plx:left>
											<plx:callInstance name="Property" type="property">
												<plx:callObject>
													<plx:nameRef name="item"/>
												</plx:callObject>
											</plx:callInstance>
										</plx:left>
										<plx:right>
											<plx:nameRef name="property" type="parameter"/>
										</plx:right>
									</plx:binaryOperator>
								</plx:condition>
								<plx:return>
									<plx:nameRef name="item"/>
								</plx:return>
							</plx:branch>
						</plx:iterator>
						<plx:return>
							<plx:nullKeyword/>
						</plx:return>
					</plx:function>
					<plx:function name=".construct" visibility="internal"/>
					<plx:function name="Add" visibility="internal">
						<plx:param name="rule" dataTypeName="ValidationRuleInfo"/>
						<plx:callThis name="Remove">
							<plx:passParam>
								<plx:nameRef name="rule" type="parameter"/>
							</plx:passParam>
						</plx:callThis>
						<plx:callThis name="Add" accessor="base">
							<plx:passParam>
								<plx:callNew dataTypeName="BrokenRule">
									<plx:passParam>
										<plx:nameRef name="rule" type="parameter"/>
									</plx:passParam>
								</plx:callNew>
							</plx:passParam>
						</plx:callThis>
					</plx:function>
					<plx:function name="Remove" visibility="internal">
						<plx:param name="rule" dataTypeName="ValidationRuleInfo"/>
						<plx:loop>
							<plx:initializeLoop>
								<plx:local name="index" dataTypeName=".i4">
									<plx:initialize>
										<plx:binaryOperator type="subtract">
											<plx:left>
												<plx:callThis name="Count" type="property" accessor="base"/>
											</plx:left>
											<plx:right>
												<plx:value data="1" type="i4"/>
											</plx:right>
										</plx:binaryOperator>
									</plx:initialize>
								</plx:local>
							</plx:initializeLoop>
							<plx:condition>
								<plx:binaryOperator type="greaterThanOrEqual">
									<plx:left>
										<plx:nameRef name="index"/>
									</plx:left>
									<plx:right>
										<plx:value data="0" type="i4"/>
									</plx:right>
								</plx:binaryOperator>
							</plx:condition>
							<plx:beforeLoop>
								<plx:decrement>
									<plx:nameRef name="index"/>
								</plx:decrement>
							</plx:beforeLoop>
							<plx:branch>
								<plx:condition>
									<plx:binaryOperator type="equality">
										<plx:left>
											<plx:callInstance name="RuleName" type="property">
												<plx:callObject>
													<plx:callThis name=".implied" type="indexerCall" accessor="base">
														<plx:passParam>
															<plx:nameRef name="index"/>
														</plx:passParam>
													</plx:callThis>
												</plx:callObject>
											</plx:callInstance>
										</plx:left>
										<plx:right>
											<plx:callInstance name="RuleName" type="property">
												<plx:callObject>
													<plx:nameRef name="rule" type="parameter"/>
												</plx:callObject>
											</plx:callInstance>
										</plx:right>
									</plx:binaryOperator>
								</plx:condition>
								<plx:callThis name="RemoveAt" accessor="base">
									<plx:passParam>
										<plx:nameRef name="index"/>
									</plx:passParam>
								</plx:callThis>
								<plx:break/>
							</plx:branch>
						</plx:loop>
					</plx:function>
					<plx:function name="GetPropertyErrorDescriptions" visibility="public">
						<plx:param name="propertyName" dataTypeName=".string"/>
						<plx:returns dataTypeName=".string"/>
						<plx:local name="errorDescription" dataTypeName="StringBuilder" dataTypeQualifier="System.Text">
							<plx:initialize>
								<plx:callNew dataTypeName="StringBuilder" dataTypeQualifier="System.Text"/>
							</plx:initialize>
						</plx:local>
						<plx:local name="firstRule" dataTypeName=".boolean">
							<plx:initialize>
								<plx:trueKeyword/>
							</plx:initialize>
						</plx:local>
						<plx:iterator localName="item" dataTypeName="BrokenRule">
							<plx:initialize>
								<plx:thisKeyword/>
							</plx:initialize>
							<plx:branch>
								<plx:condition>
									<plx:binaryOperator type="booleanOr">
										<plx:left>
											<plx:callStatic name="IsNullOrEmpty" dataTypeName=".string">
												<plx:passParam>
													<plx:nameRef name="propertyName" type="parameter"/>
												</plx:passParam>
											</plx:callStatic>
										</plx:left>
										<plx:right>
											<plx:callInstance name="Equals">
												<plx:callObject>
													<plx:callInstance name="Property" type="property">
														<plx:callObject>
															<plx:nameRef name="item"/>
														</plx:callObject>
													</plx:callInstance>
												</plx:callObject>
												<plx:passParam>
													<plx:nameRef name="propertyName" type="parameter"/>
												</plx:passParam>
											</plx:callInstance>
										</plx:right>
									</plx:binaryOperator>
								</plx:condition>
								<plx:branch>
									<plx:condition>
										<plx:nameRef name="firstRule"/>
									</plx:condition>
									<plx:assign>
										<plx:left>
											<plx:nameRef name="firstRule"/>
										</plx:left>
										<plx:right>
											<plx:falseKeyword/>
										</plx:right>
									</plx:assign>
								</plx:branch>
								<plx:fallbackBranch>
									<plx:callInstance name="Append">
										<plx:callObject>
											<plx:nameRef name="errorDescription"/>
										</plx:callObject>
										<plx:passParam>
											<plx:callStatic name="NewLine" type="property" dataTypeName="Environment" dataTypeQualifier="System"/>
										</plx:passParam>
									</plx:callInstance>
								</plx:fallbackBranch>
								<plx:callInstance name="Append">
									<plx:callObject>
										<plx:nameRef name="errorDescription"/>
									</plx:callObject>
									<plx:passParam>
										<plx:callInstance name="Description" type="property">
											<plx:callObject>
												<plx:nameRef name="item"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:passParam>
								</plx:callInstance>
							</plx:branch>
						</plx:iterator>
						<plx:return>
							<plx:callInstance name="ToString">
								<plx:callObject>
									<plx:nameRef name="errorDescription"/>
								</plx:callObject>
							</plx:callInstance>
						</plx:return>
					</plx:function>
					<plx:function name="ToString" visibility="public" modifier="override">
						<plx:returns dataTypeName=".string"/>
						<plx:return>
							<plx:callThis name="GetPropertyErrorDescriptions">
								<plx:passParam>
									<plx:nullKeyword/>
								</plx:passParam>
							</plx:callThis>
						</plx:return>
					</plx:function>
				</plx:class>
				<plx:pragma type="closeRegion" data="BrokenRulesList Class"/>
				<!-- START Entities.Validation.BrokenRulesList.cst -->

				<!-- START Entities.Validation.CommonRules.cst -->
				<plx:pragma type="region" data="CommonRules Class"/>
				<plx:class name="CommonRules" visibility="public" modifier="abstract">
					<plx:function name="NotNull" visibility="public" modifier="static">
						<plx:param name="target" dataTypeName=".object"/>
						<plx:param name="e" dataTypeName="ValidationRuleArgs"/>
						<plx:returns dataTypeName=".boolean"/>
						<plx:local name="p" dataTypeName="PropertyInfo" dataTypeQualifier="System.Reflection">
							<plx:initialize>
								<plx:callInstance name="GetProperty">
									<plx:callObject>
										<plx:callInstance name="GetType">
											<plx:callObject>
												<plx:nameRef name="target" type="parameter"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:callObject>
									<plx:passParam>
										<plx:callInstance name="PropertyName" type="property">
											<plx:callObject>
												<plx:nameRef name="e" type="parameter"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:passParam>
								</plx:callInstance>
							</plx:initialize>
						</plx:local>
						<plx:branch>
							<plx:condition>
								<plx:binaryOperator type="identityEquality">
									<plx:left>
										<plx:nameRef name="p"/>
									</plx:left>
									<plx:right>
										<plx:nullKeyword/>
									</plx:right>
								</plx:binaryOperator>
							</plx:condition>
							<plx:throw>
								<plx:callNew dataTypeName="ArgumentException" dataTypeQualifier="System">
									<plx:passParam>
										<plx:callStatic name="Format" dataTypeName=".string">
											<plx:passParam>
												<plx:string>Property "{0}" not found on object "{1}"</plx:string>
											</plx:passParam>
											<plx:passParam>
												<plx:callInstance name="PropertyName" type="property">
													<plx:callObject>
														<plx:nameRef name="e" type="parameter"/>
													</plx:callObject>
												</plx:callInstance>
											</plx:passParam>
											<plx:passParam>
												<plx:callInstance name="ToString">
													<plx:callObject>
														<plx:callInstance name="GetType">
															<plx:callObject>
																<plx:nameRef name="target" type="parameter"/>
															</plx:callObject>
														</plx:callInstance>
													</plx:callObject>
												</plx:callInstance>
											</plx:passParam>
										</plx:callStatic>
									</plx:passParam>
								</plx:callNew>
							</plx:throw>
						</plx:branch>
						<plx:branch>
							<plx:condition>
								<plx:binaryOperator type="identityEquality">
									<plx:left>
										<plx:callInstance name="GetValue">
											<plx:callObject>
												<plx:nameRef name="p"/>
											</plx:callObject>
											<plx:passParam>
												<plx:nameRef name="target" type="parameter"/>
											</plx:passParam>
											<plx:passParam>
												<plx:nullKeyword/>
											</plx:passParam>
										</plx:callInstance>
									</plx:left>
									<plx:right>
										<plx:nullKeyword/>
									</plx:right>
								</plx:binaryOperator>
							</plx:condition>
							<plx:branch>
								<plx:condition>
									<plx:callStatic name="IsNullOrEmpty" dataTypeName=".string">
										<plx:passParam>
											<plx:callInstance name="Description" type="property">
												<plx:callObject>
													<plx:nameRef name="e" type="parameter"/>
												</plx:callObject>
											</plx:callInstance>
										</plx:passParam>
									</plx:callStatic>
								</plx:condition>
								<plx:assign>
									<plx:left>
										<plx:callInstance name="Description" type="property">
											<plx:callObject>
												<plx:nameRef name="e" type="parameter"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:left>
									<plx:right>
										<plx:callStatic name="Format" dataTypeName=".string">
											<plx:passParam>
												<plx:string>{0} cannot be null.</plx:string>
											</plx:passParam>
											<plx:passParam>
												<plx:callInstance name="FriendlyName" type="property">
													<plx:callObject>
														<plx:nameRef name="e" type="parameter"/>
													</plx:callObject>
												</plx:callInstance>
											</plx:passParam>
										</plx:callStatic>
									</plx:right>
								</plx:assign>
							</plx:branch>
							<plx:return>
								<plx:falseKeyword/>
							</plx:return>
						</plx:branch>
						<plx:return>
							<plx:trueKeyword/>
						</plx:return>
					</plx:function>
					<plx:function name="StringRequired" visibility="public" modifier="static">
						<plx:param name="target" dataTypeName=".object"/>
						<plx:param name="e" dataTypeName="ValidationRuleArgs"/>
						<plx:returns dataTypeName=".boolean"/>
						<plx:local name="p" dataTypeName="PropertyInfo" dataTypeQualifier="System.Reflection">
							<plx:initialize>
								<plx:callInstance name="GetProperty">
									<plx:callObject>
										<plx:callInstance name="GetType">
											<plx:callObject>
												<plx:nameRef name="target" type="parameter"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:callObject>
									<plx:passParam>
										<plx:callInstance name="PropertyName" type="property">
											<plx:callObject>
												<plx:nameRef name="e" type="parameter"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:passParam>
								</plx:callInstance>
							</plx:initialize>
						</plx:local>
						<plx:branch>
							<plx:condition>
								<plx:binaryOperator type="identityEquality">
									<plx:left>
										<plx:nameRef name="p"/>
									</plx:left>
									<plx:right>
										<plx:nullKeyword/>
									</plx:right>
								</plx:binaryOperator>
							</plx:condition>
							<plx:throw>
								<plx:callNew dataTypeName="ArgumentException" dataTypeQualifier="System">
									<plx:passParam>
										<plx:callStatic name="Format" dataTypeName=".string">
											<plx:passParam>
												<plx:string>Property "{0}" not found on object "{1}"</plx:string>
											</plx:passParam>
											<plx:passParam>
												<plx:callInstance name="PropertyName" type="property">
													<plx:callObject>
														<plx:nameRef name="e" type="parameter"/>
													</plx:callObject>
												</plx:callInstance>
											</plx:passParam>
											<plx:passParam>
												<plx:callInstance name="ToString">
													<plx:callObject>
														<plx:callInstance name="GetType">
															<plx:callObject>
																<plx:nameRef name="target" type="parameter"/>
															</plx:callObject>
														</plx:callInstance>
													</plx:callObject>
												</plx:callInstance>
											</plx:passParam>
										</plx:callStatic>
									</plx:passParam>
								</plx:callNew>
							</plx:throw>
						</plx:branch>
						<plx:local name="value" dataTypeName=".string">
							<plx:initialize>
								<plx:cast dataTypeName=".string">
									<plx:callInstance name="GetValue">
										<plx:callObject>
											<plx:nameRef name="p"/>
										</plx:callObject>
										<plx:passParam>
											<plx:nameRef name="target" type="parameter"/>
										</plx:passParam>
										<plx:passParam>
											<plx:nullKeyword/>
										</plx:passParam>
									</plx:callInstance>
								</plx:cast>
							</plx:initialize>
						</plx:local>
						<plx:branch>
							<plx:condition>
								<plx:callStatic name="IsNullOrEmpty" dataTypeName=".string">
									<plx:passParam>
										<plx:nameRef name="value"/>
									</plx:passParam>
								</plx:callStatic>
							</plx:condition>
							<plx:branch>
								<plx:condition>
									<plx:callStatic name="IsNullOrEmpty" dataTypeName=".string">
										<plx:passParam>
											<plx:callInstance name="Description" type="property">
												<plx:callObject>
													<plx:nameRef name="e" type="parameter"/>
												</plx:callObject>
											</plx:callInstance>
										</plx:passParam>
									</plx:callStatic>
								</plx:condition>
								<plx:assign>
									<plx:left>
										<plx:callInstance name="Description" type="property">
											<plx:callObject>
												<plx:nameRef name="e" type="parameter"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:left>
									<plx:right>
										<plx:callStatic name="Concat" dataTypeName=".string">
											<plx:passParam>
												<plx:callInstance name="FriendlyName" type="property">
													<plx:callObject>
														<plx:nameRef name="e" type="parameter"/>
													</plx:callObject>
												</plx:callInstance>
											</plx:passParam>
											<plx:passParam>
												<plx:string> is required.</plx:string>
											</plx:passParam>
										</plx:callStatic>
									</plx:right>
								</plx:assign>
							</plx:branch>
							<plx:return>
								<plx:falseKeyword/>
							</plx:return>
						</plx:branch>
						<plx:return>
							<plx:trueKeyword/>
						</plx:return>
					</plx:function>
					<plx:function name="StringMaxLength" visibility="public" modifier="static">
						<plx:param name="target" dataTypeName=".object"/>
						<plx:param name="e" dataTypeName="ValidationRuleArgs"/>
						<plx:returns dataTypeName=".boolean"/>
						<plx:local name="args" dataTypeName="MaxLengthRuleArgs" dataTypeQualifier="CommonRules">
							<plx:initialize>
								<plx:cast type="testCast" dataTypeName="MaxLengthRuleArgs" dataTypeQualifier="CommonRules">
									<plx:nameRef name="e" type="parameter"/>
								</plx:cast>
							</plx:initialize>
						</plx:local>
						<plx:branch>
							<plx:condition>
								<plx:binaryOperator type="identityEquality">
									<plx:left>
										<plx:nameRef name="args"/>
									</plx:left>
									<plx:right>
										<plx:nullKeyword/>
									</plx:right>
								</plx:binaryOperator>
							</plx:condition>
							<plx:throw>
								<plx:callNew dataTypeName="ArgumentException" dataTypeQualifier="System">
									<plx:passParam>
										<plx:string>Invalid ValidationRuleArgs. e must be of type MaxLengthRuleArgs.</plx:string>
									</plx:passParam>
								</plx:callNew>
							</plx:throw>
						</plx:branch>
						<plx:local name="max" dataTypeName=".i4">
							<plx:initialize>
								<plx:callInstance name="MaxLength" type="property">
									<plx:callObject>
										<plx:nameRef name="args"/>
									</plx:callObject>
								</plx:callInstance>
							</plx:initialize>
						</plx:local>
						<plx:local name="p" dataTypeName="PropertyInfo" dataTypeQualifier="System.Reflection">
							<plx:initialize>
								<plx:callInstance name="GetProperty">
									<plx:callObject>
										<plx:callInstance name="GetType">
											<plx:callObject>
												<plx:nameRef name="target" type="parameter"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:callObject>
									<plx:passParam>
										<plx:callInstance name="PropertyName" type="property">
											<plx:callObject>
												<plx:nameRef name="e" type="parameter"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:passParam>
								</plx:callInstance>
							</plx:initialize>
						</plx:local>
						<plx:branch>
							<plx:condition>
								<plx:binaryOperator type="identityEquality">
									<plx:left>
										<plx:nameRef name="p"/>
									</plx:left>
									<plx:right>
										<plx:nullKeyword/>
									</plx:right>
								</plx:binaryOperator>
							</plx:condition>
							<plx:throw>
								<plx:callNew dataTypeName="ArgumentException" dataTypeQualifier="System">
									<plx:passParam>
										<plx:callStatic name="Format" dataTypeName=".string">
											<plx:passParam>
												<plx:string>Property "{0}" not found on object "{1}"</plx:string>
											</plx:passParam>
											<plx:passParam>
												<plx:callInstance name="PropertyName" type="property">
													<plx:callObject>
														<plx:nameRef name="e" type="parameter"/>
													</plx:callObject>
												</plx:callInstance>
											</plx:passParam>
											<plx:passParam>
												<plx:callInstance name="ToString">
													<plx:callObject>
														<plx:callInstance name="GetType">
															<plx:callObject>
																<plx:nameRef name="target" type="parameter"/>
															</plx:callObject>
														</plx:callInstance>
													</plx:callObject>
												</plx:callInstance>
											</plx:passParam>
										</plx:callStatic>
									</plx:passParam>
								</plx:callNew>
							</plx:throw>
						</plx:branch>
						<plx:branch>
							<plx:condition>
								<plx:binaryOperator type="identityInequality">
									<plx:left>
										<plx:callInstance name="PropertyType" type="property">
											<plx:callObject>
												<plx:nameRef name="p"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:left>
									<plx:right>
										<plx:typeOf dataTypeName=".string"/>
									</plx:right>
								</plx:binaryOperator>
							</plx:condition>
							<plx:throw>
								<plx:callNew dataTypeName="ArgumentException" dataTypeQualifier="System">
									<plx:passParam>
										<plx:callStatic name="Format" dataTypeName=".string">
											<plx:passParam>
												<plx:string>Property "{0}" is not of type String.</plx:string>
											</plx:passParam>
											<plx:passParam>
												<plx:callInstance name="PropertyName" type="property">
													<plx:callObject>
														<plx:nameRef name="e" type="parameter"/>
													</plx:callObject>
												</plx:callInstance>
											</plx:passParam>
										</plx:callStatic>
									</plx:passParam>
								</plx:callNew>
							</plx:throw>
						</plx:branch>
						<plx:local name="value" dataTypeName=".string">
							<plx:initialize>
								<plx:cast dataTypeName=".string">
									<plx:callInstance name="GetValue">
										<plx:callObject>
											<plx:nameRef name="p"/>
										</plx:callObject>
										<plx:passParam>
											<plx:nameRef name="target" type="parameter"/>
										</plx:passParam>
										<plx:passParam>
											<plx:nullKeyword/>
										</plx:passParam>
									</plx:callInstance>
								</plx:cast>
							</plx:initialize>
						</plx:local>
						<plx:branch>
							<plx:condition>
								<plx:binaryOperator type="booleanAnd">
									<plx:left>
										<plx:unaryOperator type="booleanNot">
											<plx:callStatic name="IsNullOrEmpty" dataTypeName=".string">
												<plx:passParam>
													<plx:nameRef name="value"/>
												</plx:passParam>
											</plx:callStatic>
										</plx:unaryOperator>
									</plx:left>
									<plx:right>
										<plx:binaryOperator type="greaterThan">
											<plx:left>
												<plx:callInstance name="Length" type="property">
													<plx:callObject>
														<plx:nameRef name="value"/>
													</plx:callObject>
												</plx:callInstance>
											</plx:left>
											<plx:right>
												<plx:nameRef name="max"/>
											</plx:right>
										</plx:binaryOperator>
									</plx:right>
								</plx:binaryOperator>
							</plx:condition>
							<plx:branch>
								<plx:condition>
									<plx:callStatic name="IsNullOrEmpty" dataTypeName=".string">
										<plx:passParam>
											<plx:callInstance name="Description" type="property">
												<plx:callObject>
													<plx:nameRef name="e" type="parameter"/>
												</plx:callObject>
											</plx:callInstance>
										</plx:passParam>
									</plx:callStatic>
								</plx:condition>
								<plx:assign>
									<plx:left>
										<plx:callInstance name="Description" type="property">
											<plx:callObject>
												<plx:nameRef name="e" type="parameter"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:left>
									<plx:right>
										<plx:callStatic name="Format" dataTypeName=".string">
											<plx:passParam>
												<plx:string>{0} can not exceed {1} characters</plx:string>
											</plx:passParam>
											<plx:passParam>
												<plx:callInstance name="FriendlyName" type="property">
													<plx:callObject>
														<plx:nameRef name="e" type="parameter"/>
													</plx:callObject>
												</plx:callInstance>
											</plx:passParam>
											<plx:passParam>
												<plx:callInstance name="ToString">
													<plx:callObject>
														<plx:nameRef name="max"/>
													</plx:callObject>
												</plx:callInstance>
											</plx:passParam>
										</plx:callStatic>
									</plx:right>
								</plx:assign>
							</plx:branch>
							<plx:return>
								<plx:falseKeyword/>
							</plx:return>
						</plx:branch>
						<plx:return>
							<plx:trueKeyword/>
						</plx:return>
					</plx:function>
					<plx:function name="MaxWords" visibility="public" modifier="static">
						<plx:param name="target" dataTypeName=".object"/>
						<plx:param name="e" dataTypeName="ValidationRuleArgs"/>
						<plx:returns dataTypeName=".boolean"/>
						<plx:local name="args1" dataTypeName="MaxWordsRuleArgs" dataTypeQualifier="CommonRules">
							<plx:initialize>
								<plx:cast type="testCast" dataTypeName="MaxWordsRuleArgs" dataTypeQualifier="CommonRules">
									<plx:nameRef name="e" type="parameter"/>
								</plx:cast>
							</plx:initialize>
						</plx:local>
						<plx:branch>
							<plx:condition>
								<plx:binaryOperator type="identityEquality">
									<plx:left>
										<plx:nameRef name="args1"/>
									</plx:left>
									<plx:right>
										<plx:nullKeyword/>
									</plx:right>
								</plx:binaryOperator>
							</plx:condition>
							<plx:throw>
								<plx:callNew dataTypeName="ArgumentException" dataTypeQualifier="System">
									<plx:passParam>
										<plx:string>Invalid ValidationRuleArgs. e must be of type MaxWordsRuleArgs.</plx:string>
									</plx:passParam>
								</plx:callNew>
							</plx:throw>
						</plx:branch>
						<plx:local name="text1" dataTypeName=".string">
							<plx:initialize>
								<plx:string>\b\w+\b</plx:string>
							</plx:initialize>
						</plx:local>
						<plx:local name="info1" dataTypeName="PropertyInfo" dataTypeQualifier="System.Reflection">
							<plx:initialize>
								<plx:callInstance name="GetProperty">
									<plx:callObject>
										<plx:callInstance name="GetType">
											<plx:callObject>
												<plx:nameRef name="target" type="parameter"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:callObject>
									<plx:passParam>
										<plx:callInstance name="PropertyName" type="property">
											<plx:callObject>
												<plx:nameRef name="e" type="parameter"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:passParam>
								</plx:callInstance>
							</plx:initialize>
						</plx:local>
						<plx:branch>
							<plx:condition>
								<plx:binaryOperator type="identityEquality">
									<plx:left>
										<plx:nameRef name="info1"/>
									</plx:left>
									<plx:right>
										<plx:nullKeyword/>
									</plx:right>
								</plx:binaryOperator>
							</plx:condition>
							<plx:throw>
								<plx:callNew dataTypeName="ArgumentException" dataTypeQualifier="System">
									<plx:passParam>
										<plx:callStatic name="Format" dataTypeName=".string">
											<plx:passParam>
												<plx:string>Property "{0}" not found on object "{1}"</plx:string>
											</plx:passParam>
											<plx:passParam>
												<plx:callInstance name="PropertyName" type="property">
													<plx:callObject>
														<plx:nameRef name="e" type="parameter"/>
													</plx:callObject>
												</plx:callInstance>
											</plx:passParam>
											<plx:passParam>
												<plx:callInstance name="ToString">
													<plx:callObject>
														<plx:callInstance name="GetType">
															<plx:callObject>
																<plx:nameRef name="target" type="parameter"/>
															</plx:callObject>
														</plx:callInstance>
													</plx:callObject>
												</plx:callInstance>
											</plx:passParam>
										</plx:callStatic>
									</plx:passParam>
								</plx:callNew>
							</plx:throw>
						</plx:branch>
						<plx:branch>
							<plx:condition>
								<plx:binaryOperator type="identityInequality">
									<plx:left>
										<plx:callInstance name="PropertyType" type="property">
											<plx:callObject>
												<plx:nameRef name="info1"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:left>
									<plx:right>
										<plx:typeOf dataTypeName=".string"/>
									</plx:right>
								</plx:binaryOperator>
							</plx:condition>
							<plx:throw>
								<plx:callNew dataTypeName="ArgumentException" dataTypeQualifier="System">
									<plx:passParam>
										<plx:callStatic name="Format" dataTypeName=".string">
											<plx:passParam>
												<plx:string>Property "{0}" is not of type String.</plx:string>
											</plx:passParam>
											<plx:passParam>
												<plx:callInstance name="PropertyName" type="property">
													<plx:callObject>
														<plx:nameRef name="e" type="parameter"/>
													</plx:callObject>
												</plx:callInstance>
											</plx:passParam>
										</plx:callStatic>
									</plx:passParam>
								</plx:callNew>
							</plx:throw>
						</plx:branch>
						<plx:local name="text2" dataTypeName=".string">
							<plx:initialize>
								<plx:cast dataTypeName=".string">
									<plx:callInstance name="GetValue">
										<plx:callObject>
											<plx:nameRef name="info1"/>
										</plx:callObject>
										<plx:passParam>
											<plx:nameRef name="target" type="parameter"/>
										</plx:passParam>
										<plx:passParam>
											<plx:nullKeyword/>
										</plx:passParam>
									</plx:callInstance>
								</plx:cast>
							</plx:initialize>
						</plx:local>
						<plx:branch>
							<plx:condition>
								<plx:binaryOperator type="greaterThan">
									<plx:left>
										<plx:callInstance name="Count" type="property">
											<plx:callObject>
												<plx:callStatic name="Matches" dataTypeName="Regex" dataTypeQualifier="System.Text.RegularExpressions">
													<plx:passParam>
														<plx:nameRef name="text2"/>
													</plx:passParam>
													<plx:passParam>
														<plx:nameRef name="text1"/>
													</plx:passParam>
												</plx:callStatic>
											</plx:callObject>
										</plx:callInstance>
									</plx:left>
									<plx:right>
										<plx:callInstance name="MaxLength" type="property">
											<plx:callObject>
												<plx:nameRef name="args1"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:right>
								</plx:binaryOperator>
							</plx:condition>
							<plx:branch>
								<plx:condition>
									<plx:binaryOperator type="equality">
										<plx:left>
											<plx:callInstance name="Description" type="property">
												<plx:callObject>
													<plx:nameRef name="e" type="parameter"/>
												</plx:callObject>
											</plx:callInstance>
										</plx:left>
										<plx:right>
											<plx:callStatic name="Empty" type="field" dataTypeName=".string"/>
										</plx:right>
									</plx:binaryOperator>
								</plx:condition>
								<plx:assign>
									<plx:left>
										<plx:callInstance name="Description" type="property">
											<plx:callObject>
												<plx:nameRef name="e" type="parameter"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:left>
									<plx:right>
										<plx:callStatic name="Format" dataTypeName=".string">
											<plx:passParam>
												<plx:string>{0} exceed the maximum number of words</plx:string>
											</plx:passParam>
											<plx:passParam>
												<plx:callInstance name="FriendlyName" type="property">
													<plx:callObject>
														<plx:nameRef name="e" type="parameter"/>
													</plx:callObject>
												</plx:callInstance>
											</plx:passParam>
											<plx:passParam>
												<plx:nameRef name="text1"/>
											</plx:passParam>
										</plx:callStatic>
									</plx:right>
								</plx:assign>
							</plx:branch>
							<plx:return>
								<plx:falseKeyword/>
							</plx:return>
						</plx:branch>
						<plx:return>
							<plx:trueKeyword/>
						</plx:return>
					</plx:function>
					<plx:function name="RegexIsMatch" visibility="public" modifier="static">
						<plx:param name="target" dataTypeName=".object"/>
						<plx:param name="e" dataTypeName="ValidationRuleArgs"/>
						<plx:returns dataTypeName=".boolean"/>
						<plx:local name="args" dataTypeName="RegexRuleArgs" dataTypeQualifier="CommonRules">
							<plx:initialize>
								<plx:cast type="testCast" dataTypeName="RegexRuleArgs" dataTypeQualifier="CommonRules">
									<plx:nameRef name="e" type="parameter"/>
								</plx:cast>
							</plx:initialize>
						</plx:local>
						<plx:branch>
							<plx:condition>
								<plx:binaryOperator type="identityEquality">
									<plx:left>
										<plx:nameRef name="args"/>
									</plx:left>
									<plx:right>
										<plx:nullKeyword/>
									</plx:right>
								</plx:binaryOperator>
							</plx:condition>
							<plx:throw>
								<plx:callNew dataTypeName="ArgumentException" dataTypeQualifier="System">
									<plx:passParam>
										<plx:string>Invalid ValidationRuleArgs. e must be of type RegexRuleArgs.</plx:string>
									</plx:passParam>
								</plx:callNew>
							</plx:throw>
						</plx:branch>
						<plx:local name="expression" dataTypeName=".string">
							<plx:initialize>
								<plx:callInstance name="Expression" type="property">
									<plx:callObject>
										<plx:nameRef name="args"/>
									</plx:callObject>
								</plx:callInstance>
							</plx:initialize>
						</plx:local>
						<plx:local name="p" dataTypeName="PropertyInfo" dataTypeQualifier="System.Reflection">
							<plx:initialize>
								<plx:callInstance name="GetProperty">
									<plx:callObject>
										<plx:callInstance name="GetType">
											<plx:callObject>
												<plx:nameRef name="target" type="parameter"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:callObject>
									<plx:passParam>
										<plx:callInstance name="PropertyName" type="property">
											<plx:callObject>
												<plx:nameRef name="e" type="parameter"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:passParam>
								</plx:callInstance>
							</plx:initialize>
						</plx:local>
						<plx:branch>
							<plx:condition>
								<plx:binaryOperator type="identityEquality">
									<plx:left>
										<plx:nameRef name="p"/>
									</plx:left>
									<plx:right>
										<plx:nullKeyword/>
									</plx:right>
								</plx:binaryOperator>
							</plx:condition>
							<plx:throw>
								<plx:callNew dataTypeName="ArgumentException" dataTypeQualifier="System">
									<plx:passParam>
										<plx:callStatic name="Format" dataTypeName=".string">
											<plx:passParam>
												<plx:string>Property "{0}" not found on object "{1}"</plx:string>
											</plx:passParam>
											<plx:passParam>
												<plx:callInstance name="PropertyName" type="property">
													<plx:callObject>
														<plx:nameRef name="e" type="parameter"/>
													</plx:callObject>
												</plx:callInstance>
											</plx:passParam>
											<plx:passParam>
												<plx:callInstance name="ToString">
													<plx:callObject>
														<plx:callInstance name="GetType">
															<plx:callObject>
																<plx:nameRef name="target" type="parameter"/>
															</plx:callObject>
														</plx:callInstance>
													</plx:callObject>
												</plx:callInstance>
											</plx:passParam>
										</plx:callStatic>
									</plx:passParam>
								</plx:callNew>
							</plx:throw>
						</plx:branch>
						<plx:branch>
							<plx:condition>
								<plx:binaryOperator type="identityInequality">
									<plx:left>
										<plx:callInstance name="PropertyType" type="property">
											<plx:callObject>
												<plx:nameRef name="p"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:left>
									<plx:right>
										<plx:typeOf dataTypeName=".string"/>
									</plx:right>
								</plx:binaryOperator>
							</plx:condition>
							<plx:throw>
								<plx:callNew dataTypeName="ArgumentException" dataTypeQualifier="System">
									<plx:passParam>
										<plx:callStatic name="Format" dataTypeName=".string">
											<plx:passParam>
												<plx:string>Property "{0}" is not of type String.</plx:string>
											</plx:passParam>
											<plx:passParam>
												<plx:callInstance name="PropertyName" type="property">
													<plx:callObject>
														<plx:nameRef name="e" type="parameter"/>
													</plx:callObject>
												</plx:callInstance>
											</plx:passParam>
										</plx:callStatic>
									</plx:passParam>
								</plx:callNew>
							</plx:throw>
						</plx:branch>
						<plx:local name="value" dataTypeName=".string">
							<plx:initialize>
								<plx:cast dataTypeName=".string">
									<plx:callInstance name="GetValue">
										<plx:callObject>
											<plx:nameRef name="p"/>
										</plx:callObject>
										<plx:passParam>
											<plx:nameRef name="target" type="parameter"/>
										</plx:passParam>
										<plx:passParam>
											<plx:nullKeyword/>
										</plx:passParam>
									</plx:callInstance>
								</plx:cast>
							</plx:initialize>
						</plx:local>
						<plx:branch>
							<plx:condition>
								<plx:binaryOperator type="booleanOr">
									<plx:left>
										<plx:binaryOperator type="identityEquality">
											<plx:left>
												<plx:nameRef name="value"/>
											</plx:left>
											<plx:right>
												<plx:nullKeyword/>
											</plx:right>
										</plx:binaryOperator>
									</plx:left>
									<plx:right>
										<plx:unaryOperator type="booleanNot">
											<plx:callStatic name="IsMatch" dataTypeName="Regex" dataTypeQualifier="System.Text.RegularExpressions">
												<plx:passParam>
													<plx:nameRef name="value"/>
												</plx:passParam>
												<plx:passParam>
													<plx:nameRef name="expression"/>
												</plx:passParam>
											</plx:callStatic>
										</plx:unaryOperator>
									</plx:right>
								</plx:binaryOperator>
							</plx:condition>
							<plx:branch>
								<plx:condition>
									<plx:callStatic name="IsNullOrEmpty" dataTypeName=".string">
										<plx:passParam>
											<plx:callInstance name="Description" type="property">
												<plx:callObject>
													<plx:nameRef name="e" type="parameter"/>
												</plx:callObject>
											</plx:callInstance>
										</plx:passParam>
									</plx:callStatic>
								</plx:condition>
								<plx:assign>
									<plx:left>
										<plx:callInstance name="Description" type="property">
											<plx:callObject>
												<plx:nameRef name="e" type="parameter"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:left>
									<plx:right>
										<plx:callStatic name="Format" dataTypeName=".string">
											<plx:passParam>
												<plx:string>{0} is not valid.</plx:string>
											</plx:passParam>
											<plx:passParam>
												<plx:callInstance name="FriendlyName" type="property">
													<plx:callObject>
														<plx:nameRef name="e" type="parameter"/>
													</plx:callObject>
												</plx:callInstance>
											</plx:passParam>
										</plx:callStatic>
									</plx:right>
								</plx:assign>
							</plx:branch>
							<plx:return>
								<plx:falseKeyword/>
							</plx:return>
						</plx:branch>
						<plx:return>
							<plx:trueKeyword/>
						</plx:return>
					</plx:function>
					<plx:function name="LessThanValue" visibility="public" modifier="static">
						<plx:typeParam name="T"/>
						<plx:param name="target" dataTypeName=".object"/>
						<plx:param name="e" dataTypeName="ValidationRuleArgs"/>
						<plx:returns dataTypeName=".boolean"/>
						<plx:return>
							<plx:callStatic name="CompareValues" dataTypeName="CommonRules">
								<plx:passMemberTypeParam dataTypeName="T"/>
								<plx:passParam>
									<plx:nameRef name="target" type="parameter"/>
								</plx:passParam>
								<plx:passParam>
									<plx:cast type="testCast" dataTypeName="CompareValueRuleArgs" dataTypeQualifier="CommonRules">
										<plx:passTypeParam dataTypeName="T"/>
										<plx:nameRef name="e" type="parameter"/>
									</plx:cast>
								</plx:passParam>
								<plx:passParam>
									<plx:callStatic name="LessThan" type="field" dataTypeName="CompareType" dataTypeQualifier="CommonRules"/>
								</plx:passParam>
							</plx:callStatic>
						</plx:return>
					</plx:function>
					<plx:function name="LessThanOrEqualToValue" visibility="public" modifier="static">
						<plx:typeParam name="T"/>
						<plx:param name="target" dataTypeName=".object"/>
						<plx:param name="e" dataTypeName="ValidationRuleArgs"/>
						<plx:returns dataTypeName=".boolean"/>
						<plx:return>
							<plx:callStatic name="CompareValues" dataTypeName="CommonRules">
								<plx:passMemberTypeParam dataTypeName="T"/>
								<plx:passParam>
									<plx:nameRef name="target" type="parameter"/>
								</plx:passParam>
								<plx:passParam>
									<plx:cast type="testCast" dataTypeName="CompareValueRuleArgs" dataTypeQualifier="CommonRules">
										<plx:passTypeParam dataTypeName="T"/>
										<plx:nameRef name="e" type="parameter"/>
									</plx:cast>
								</plx:passParam>
								<plx:passParam>
									<plx:callStatic name="LessThanOrEqualTo" type="field" dataTypeName="CompareType" dataTypeQualifier="CommonRules"/>
								</plx:passParam>
							</plx:callStatic>
						</plx:return>
					</plx:function>
					<plx:function name="EqualsValue" visibility="public" modifier="static">
						<plx:typeParam name="T"/>
						<plx:param name="target" dataTypeName=".object"/>
						<plx:param name="e" dataTypeName="ValidationRuleArgs"/>
						<plx:returns dataTypeName=".boolean"/>
						<plx:return>
							<plx:callStatic name="CompareValues" dataTypeName="CommonRules">
								<plx:passMemberTypeParam dataTypeName="T"/>
								<plx:passParam>
									<plx:nameRef name="target" type="parameter"/>
								</plx:passParam>
								<plx:passParam>
									<plx:cast type="testCast" dataTypeName="CompareValueRuleArgs" dataTypeQualifier="CommonRules">
										<plx:passTypeParam dataTypeName="T"/>
										<plx:nameRef name="e" type="parameter"/>
									</plx:cast>
								</plx:passParam>
								<plx:passParam>
									<plx:callStatic name="EqualTo" type="field" dataTypeName="CompareType" dataTypeQualifier="CommonRules"/>
								</plx:passParam>
							</plx:callStatic>
						</plx:return>
					</plx:function>
					<plx:function name="GreaterThanValue" visibility="public" modifier="static">
						<plx:typeParam name="T"/>
						<plx:param name="target" dataTypeName=".object"/>
						<plx:param name="e" dataTypeName="ValidationRuleArgs"/>
						<plx:returns dataTypeName=".boolean"/>
						<plx:return>
							<plx:callStatic name="CompareValues" dataTypeName="CommonRules">
								<plx:passMemberTypeParam dataTypeName="T"/>
								<plx:passParam>
									<plx:nameRef name="target" type="parameter"/>
								</plx:passParam>
								<plx:passParam>
									<plx:cast type="testCast" dataTypeName="CompareValueRuleArgs" dataTypeQualifier="CommonRules">
										<plx:passTypeParam dataTypeName="T"/>
										<plx:nameRef name="e" type="parameter"/>
									</plx:cast>
								</plx:passParam>
								<plx:passParam>
									<plx:callStatic name="GreaterThan" type="field" dataTypeName="CompareType" dataTypeQualifier="CommonRules"/>
								</plx:passParam>
							</plx:callStatic>
						</plx:return>
					</plx:function>
					<plx:function name="GreaterThanOrEqualToValue" visibility="public" modifier="static">
						<plx:typeParam name="T"/>
						<plx:param name="target" dataTypeName=".object"/>
						<plx:param name="e" dataTypeName="ValidationRuleArgs"/>
						<plx:returns dataTypeName=".boolean"/>
						<plx:return>
							<plx:callStatic name="CompareValues" dataTypeName="CommonRules">
								<plx:passMemberTypeParam dataTypeName="T"/>
								<plx:passParam>
									<plx:nameRef name="target" type="parameter"/>
								</plx:passParam>
								<plx:passParam>
									<plx:cast type="testCast" dataTypeName="CompareValueRuleArgs" dataTypeQualifier="CommonRules">
										<plx:passTypeParam dataTypeName="T"/>
										<plx:nameRef name="e" type="parameter"/>
									</plx:cast>
								</plx:passParam>
								<plx:passParam>
									<plx:callStatic name="GreaterThanOrEqualTo" type="field" dataTypeName="CompareType" dataTypeQualifier="CommonRules"/>
								</plx:passParam>
							</plx:callStatic>
						</plx:return>
					</plx:function>
					<plx:function name="CompareValues" visibility="private" modifier="static">
						<plx:typeParam name="T"/>
						<plx:param name="target" dataTypeName=".object"/>
						<plx:param name="e" dataTypeName="CompareValueRuleArgs" dataTypeQualifier="CommonRules">
							<plx:passTypeParam dataTypeName="T"/>
						</plx:param>
						<plx:param name="compareType" dataTypeName="CompareType" dataTypeQualifier="CommonRules"/>
						<plx:returns dataTypeName=".boolean"/>
						<plx:local name="result" dataTypeName=".boolean">
							<plx:initialize>
								<plx:trueKeyword/>
							</plx:initialize>
						</plx:local>
						<plx:branch>
							<plx:condition>
								<plx:binaryOperator type="identityInequality">
									<plx:left>
										<plx:nameRef name="e" type="parameter"/>
									</plx:left>
									<plx:right>
										<plx:nullKeyword/>
									</plx:right>
								</plx:binaryOperator>
							</plx:condition>
							<plx:local name="value" dataTypeName="T"/>
							<plx:local name="compareValue" dataTypeName="T">
								<plx:initialize>
									<plx:callInstance name="CompareValue" type="property">
										<plx:callObject>
											<plx:nameRef name="e" type="parameter"/>
										</plx:callObject>
									</plx:callInstance>
								</plx:initialize>
							</plx:local>
							<plx:local name="p" dataTypeName="PropertyInfo" dataTypeQualifier="System.Reflection">
								<plx:initialize>
									<plx:callInstance name="GetProperty">
										<plx:callObject>
											<plx:callInstance name="GetType">
												<plx:callObject>
													<plx:nameRef name="target" type="parameter"/>
												</plx:callObject>
											</plx:callInstance>
										</plx:callObject>
										<plx:passParam>
											<plx:callInstance name="PropertyName" type="property">
												<plx:callObject>
													<plx:nameRef name="e" type="parameter"/>
												</plx:callObject>
											</plx:callInstance>
										</plx:passParam>
									</plx:callInstance>
								</plx:initialize>
							</plx:local>
							<plx:try>
								<plx:assign>
									<plx:left>
										<plx:nameRef name="value"/>
									</plx:left>
									<plx:right>
										<plx:cast dataTypeName="T">
											<plx:callInstance name="GetValue">
												<plx:callObject>
													<plx:nameRef name="p"/>
												</plx:callObject>
												<plx:passParam>
													<plx:nameRef name="target" type="parameter"/>
												</plx:passParam>
												<plx:passParam>
													<plx:nullKeyword/>
												</plx:passParam>
											</plx:callInstance>
										</plx:cast>
									</plx:right>
								</plx:assign>
								<plx:catch dataTypeName="Exception" dataTypeQualifier="System">
									<plx:return>
										<plx:trueKeyword/>
									</plx:return>
								</plx:catch>
							</plx:try>
							<plx:branch>
								<plx:condition>
									<plx:binaryOperator type="booleanAnd">
										<plx:left>
											<plx:callInstance name="Equals">
												<plx:callObject>
													<plx:callInstance name="Name" type="property">
														<plx:callObject>
															<plx:callInstance name="PropertyType" type="property">
																<plx:callObject>
																	<plx:nameRef name="p"/>
																</plx:callObject>
															</plx:callInstance>
														</plx:callObject>
													</plx:callInstance>
												</plx:callObject>
												<plx:passParam>
													<plx:callInstance name="Name" type="property">
														<plx:callObject>
															<plx:typeOf dataTypeName="Nullable" dataTypeQualifier="System">
																<plx:passTypeParam dataTypeName=".unspecifiedTypeParam"/>
															</plx:typeOf>
														</plx:callObject>
													</plx:callInstance>
												</plx:passParam>
											</plx:callInstance>
										</plx:left>
										<plx:right>
											<plx:binaryOperator type="identityEquality">
												<plx:left>
													<plx:nameRef name="value"/>
												</plx:left>
												<plx:right>
													<plx:nullKeyword/>
												</plx:right>
											</plx:binaryOperator>
										</plx:right>
									</plx:binaryOperator>
								</plx:condition>
								<plx:return>
									<plx:trueKeyword/>
								</plx:return>
							</plx:branch>
							<plx:local name="res" dataTypeName=".i4">
								<plx:initialize>
									<plx:callInstance name="Compare">
										<plx:callObject>
											<plx:callStatic name="DefaultInvariant" type="field" dataTypeName="Comparer" dataTypeQualifier="System.Collections"/>
										</plx:callObject>
										<plx:passParam>
											<plx:nameRef name="value"/>
										</plx:passParam>
										<plx:passParam>
											<plx:nameRef name="compareValue"/>
										</plx:passParam>
									</plx:callInstance>
								</plx:initialize>
							</plx:local>
							<plx:switch>
								<plx:condition>
									<plx:nameRef name="compareType" type="parameter"/>
								</plx:condition>
								<plx:case>
									<plx:condition>
										<plx:callStatic name="LessThanOrEqualTo" type="field" dataTypeName="CompareType" dataTypeQualifier="CommonRules"/>
									</plx:condition>
									<plx:assign>
										<plx:left>
											<plx:nameRef name="result"/>
										</plx:left>
										<plx:right>
											<plx:binaryOperator type="lessThanOrEqual">
												<plx:left>
													<plx:nameRef name="res"/>
												</plx:left>
												<plx:right>
													<plx:value data="0" type="i4"/>
												</plx:right>
											</plx:binaryOperator>
										</plx:right>
									</plx:assign>
									<plx:branch>
										<plx:condition>
											<plx:binaryOperator type="booleanAnd">
												<plx:left>
													<plx:unaryOperator type="booleanNot">
														<plx:nameRef name="result"/>
													</plx:unaryOperator>
												</plx:left>
												<plx:right>
													<plx:callStatic name="IsNullOrEmpty" dataTypeName=".string">
														<plx:passParam>
															<plx:callInstance name="Description" type="property">
																<plx:callObject>
																	<plx:nameRef name="e" type="parameter"/>
																</plx:callObject>
															</plx:callInstance>
														</plx:passParam>
													</plx:callStatic>
												</plx:right>
											</plx:binaryOperator>
										</plx:condition>
										<plx:assign>
											<plx:left>
												<plx:callInstance name="Description" type="property">
													<plx:callObject>
														<plx:nameRef name="e" type="parameter"/>
													</plx:callObject>
												</plx:callInstance>
											</plx:left>
											<plx:right>
												<plx:callStatic name="Format" dataTypeName=".string">
													<plx:passParam>
														<plx:string>{0} cannot exceed {1}.</plx:string>
													</plx:passParam>
													<plx:passParam>
														<plx:callInstance name="FriendlyName" type="property">
															<plx:callObject>
																<plx:nameRef name="e" type="parameter"/>
															</plx:callObject>
														</plx:callInstance>
													</plx:passParam>
													<plx:passParam>
														<plx:callInstance name="ToString">
															<plx:callObject>
																<plx:nameRef name="compareValue"/>
															</plx:callObject>
														</plx:callInstance>
													</plx:passParam>
												</plx:callStatic>
											</plx:right>
										</plx:assign>
									</plx:branch>
								</plx:case>
								<plx:case>
									<plx:condition>
										<plx:callStatic name="LessThan" type="field" dataTypeName="CompareType" dataTypeQualifier="CommonRules"/>
									</plx:condition>
									<plx:assign>
										<plx:left>
											<plx:nameRef name="result"/>
										</plx:left>
										<plx:right>
											<plx:binaryOperator type="lessThan">
												<plx:left>
													<plx:nameRef name="res"/>
												</plx:left>
												<plx:right>
													<plx:value data="0" type="i4"/>
												</plx:right>
											</plx:binaryOperator>
										</plx:right>
									</plx:assign>
									<plx:branch>
										<plx:condition>
											<plx:binaryOperator type="booleanAnd">
												<plx:left>
													<plx:unaryOperator type="booleanNot">
														<plx:nameRef name="result"/>
													</plx:unaryOperator>
												</plx:left>
												<plx:right>
													<plx:callStatic name="IsNullOrEmpty" dataTypeName=".string">
														<plx:passParam>
															<plx:callInstance name="Description" type="property">
																<plx:callObject>
																	<plx:nameRef name="e" type="parameter"/>
																</plx:callObject>
															</plx:callInstance>
														</plx:passParam>
													</plx:callStatic>
												</plx:right>
											</plx:binaryOperator>
										</plx:condition>
										<plx:assign>
											<plx:left>
												<plx:callInstance name="Description" type="property">
													<plx:callObject>
														<plx:nameRef name="e" type="parameter"/>
													</plx:callObject>
												</plx:callInstance>
											</plx:left>
											<plx:right>
												<plx:callStatic name="Format" dataTypeName=".string">
													<plx:passParam>
														<plx:string>{0} must be less than {1}.</plx:string>
													</plx:passParam>
													<plx:passParam>
														<plx:callInstance name="FriendlyName" type="property">
															<plx:callObject>
																<plx:nameRef name="e" type="parameter"/>
															</plx:callObject>
														</plx:callInstance>
													</plx:passParam>
													<plx:passParam>
														<plx:callInstance name="ToString">
															<plx:callObject>
																<plx:nameRef name="compareValue"/>
															</plx:callObject>
														</plx:callInstance>
													</plx:passParam>
												</plx:callStatic>
											</plx:right>
										</plx:assign>
									</plx:branch>
								</plx:case>
								<plx:case>
									<plx:condition>
										<plx:callStatic name="EqualTo" type="field" dataTypeName="CompareType" dataTypeQualifier="CommonRules"/>
									</plx:condition>
									<plx:assign>
										<plx:left>
											<plx:nameRef name="result"/>
										</plx:left>
										<plx:right>
											<plx:binaryOperator type="equality">
												<plx:left>
													<plx:nameRef name="res"/>
												</plx:left>
												<plx:right>
													<plx:value data="0" type="i4"/>
												</plx:right>
											</plx:binaryOperator>
										</plx:right>
									</plx:assign>
									<plx:branch>
										<plx:condition>
											<plx:binaryOperator type="booleanAnd">
												<plx:left>
													<plx:unaryOperator type="booleanNot">
														<plx:nameRef name="result"/>
													</plx:unaryOperator>
												</plx:left>
												<plx:right>
													<plx:callStatic name="IsNullOrEmpty" dataTypeName=".string">
														<plx:passParam>
															<plx:callInstance name="Description" type="property">
																<plx:callObject>
																	<plx:nameRef name="e" type="parameter"/>
																</plx:callObject>
															</plx:callInstance>
														</plx:passParam>
													</plx:callStatic>
												</plx:right>
											</plx:binaryOperator>
										</plx:condition>
										<plx:assign>
											<plx:left>
												<plx:callInstance name="Description" type="property">
													<plx:callObject>
														<plx:nameRef name="e" type="parameter"/>
													</plx:callObject>
												</plx:callInstance>
											</plx:left>
											<plx:right>
												<plx:callStatic name="Format" dataTypeName=".string">
													<plx:passParam>
														<plx:string>{0} must equal {1}.</plx:string>
													</plx:passParam>
													<plx:passParam>
														<plx:callInstance name="FriendlyName" type="property">
															<plx:callObject>
																<plx:nameRef name="e" type="parameter"/>
															</plx:callObject>
														</plx:callInstance>
													</plx:passParam>
													<plx:passParam>
														<plx:callInstance name="ToString">
															<plx:callObject>
																<plx:nameRef name="compareValue"/>
															</plx:callObject>
														</plx:callInstance>
													</plx:passParam>
												</plx:callStatic>
											</plx:right>
										</plx:assign>
									</plx:branch>
								</plx:case>
								<plx:case>
									<plx:condition>
										<plx:callStatic name="GreaterThan" type="field" dataTypeName="CompareType" dataTypeQualifier="CommonRules"/>
									</plx:condition>
									<plx:assign>
										<plx:left>
											<plx:nameRef name="result"/>
										</plx:left>
										<plx:right>
											<plx:binaryOperator type="greaterThan">
												<plx:left>
													<plx:nameRef name="res"/>
												</plx:left>
												<plx:right>
													<plx:value data="0" type="i4"/>
												</plx:right>
											</plx:binaryOperator>
										</plx:right>
									</plx:assign>
									<plx:branch>
										<plx:condition>
											<plx:binaryOperator type="booleanAnd">
												<plx:left>
													<plx:unaryOperator type="booleanNot">
														<plx:nameRef name="result"/>
													</plx:unaryOperator>
												</plx:left>
												<plx:right>
													<plx:callStatic name="IsNullOrEmpty" dataTypeName=".string">
														<plx:passParam>
															<plx:callInstance name="Description" type="property">
																<plx:callObject>
																	<plx:nameRef name="e" type="parameter"/>
																</plx:callObject>
															</plx:callInstance>
														</plx:passParam>
													</plx:callStatic>
												</plx:right>
											</plx:binaryOperator>
										</plx:condition>
										<plx:assign>
											<plx:left>
												<plx:callInstance name="Description" type="property">
													<plx:callObject>
														<plx:nameRef name="e" type="parameter"/>
													</plx:callObject>
												</plx:callInstance>
											</plx:left>
											<plx:right>
												<plx:callStatic name="Format" dataTypeName=".string">
													<plx:passParam>
														<plx:string>{0} must exceed {1}.</plx:string>
													</plx:passParam>
													<plx:passParam>
														<plx:callInstance name="FriendlyName" type="property">
															<plx:callObject>
																<plx:nameRef name="e" type="parameter"/>
															</plx:callObject>
														</plx:callInstance>
													</plx:passParam>
													<plx:passParam>
														<plx:callInstance name="ToString">
															<plx:callObject>
																<plx:nameRef name="compareValue"/>
															</plx:callObject>
														</plx:callInstance>
													</plx:passParam>
												</plx:callStatic>
											</plx:right>
										</plx:assign>
									</plx:branch>
								</plx:case>
								<plx:case>
									<plx:condition>
										<plx:callStatic name="GreaterThanOrEqualTo" type="field" dataTypeName="CompareType" dataTypeQualifier="CommonRules"/>
									</plx:condition>
									<plx:assign>
										<plx:left>
											<plx:nameRef name="result"/>
										</plx:left>
										<plx:right>
											<plx:binaryOperator type="greaterThanOrEqual">
												<plx:left>
													<plx:nameRef name="res"/>
												</plx:left>
												<plx:right>
													<plx:value data="0" type="i4"/>
												</plx:right>
											</plx:binaryOperator>
										</plx:right>
									</plx:assign>
									<plx:branch>
										<plx:condition>
											<plx:binaryOperator type="booleanAnd">
												<plx:left>
													<plx:unaryOperator type="booleanNot">
														<plx:nameRef name="result"/>
													</plx:unaryOperator>
												</plx:left>
												<plx:right>
													<plx:callStatic name="IsNullOrEmpty" dataTypeName=".string">
														<plx:passParam>
															<plx:callInstance name="Description" type="property">
																<plx:callObject>
																	<plx:nameRef name="e" type="parameter"/>
																</plx:callObject>
															</plx:callInstance>
														</plx:passParam>
													</plx:callStatic>
												</plx:right>
											</plx:binaryOperator>
										</plx:condition>
										<plx:assign>
											<plx:left>
												<plx:callInstance name="Description" type="property">
													<plx:callObject>
														<plx:nameRef name="e" type="parameter"/>
													</plx:callObject>
												</plx:callInstance>
											</plx:left>
											<plx:right>
												<plx:callStatic name="Format" dataTypeName=".string">
													<plx:passParam>
														<plx:string>{0} must be greater than or equal to {1}.</plx:string>
													</plx:passParam>
													<plx:passParam>
														<plx:callInstance name="FriendlyName" type="property">
															<plx:callObject>
																<plx:nameRef name="e" type="parameter"/>
															</plx:callObject>
														</plx:callInstance>
													</plx:passParam>
													<plx:passParam>
														<plx:callInstance name="ToString">
															<plx:callObject>
																<plx:nameRef name="compareValue"/>
															</plx:callObject>
														</plx:callInstance>
													</plx:passParam>
												</plx:callStatic>
											</plx:right>
										</plx:assign>
									</plx:branch>
								</plx:case>
							</plx:switch>
							<plx:branch>
								<plx:condition>
									<plx:unaryOperator type="booleanNot">
										<plx:nameRef name="result"/>
									</plx:unaryOperator>
								</plx:condition>
							</plx:branch>
						</plx:branch>
						<plx:return>
							<plx:nameRef name="result"/>
						</plx:return>
					</plx:function>
					<plx:function name="InRange" visibility="public" modifier="static">
						<plx:typeParam name="T"/>
						<plx:param name="target" dataTypeName=".object"/>
						<plx:param name="e" dataTypeName="ValidationRuleArgs"/>
						<plx:returns dataTypeName=".boolean"/>
						<plx:local name="result" dataTypeName=".boolean">
							<plx:initialize>
								<plx:trueKeyword/>
							</plx:initialize>
						</plx:local>
						<plx:local name="ruleArgs" dataTypeName="RangeRuleArgs" dataTypeQualifier="CommonRules">
							<plx:passTypeParam dataTypeName="T"/>
							<plx:initialize>
								<plx:cast type="testCast" dataTypeName="RangeRuleArgs" dataTypeQualifier="CommonRules">
									<plx:passTypeParam dataTypeName="T"/>
									<plx:nameRef name="e" type="parameter"/>
								</plx:cast>
							</plx:initialize>
						</plx:local>
						<plx:branch>
							<plx:condition>
								<plx:binaryOperator type="identityEquality">
									<plx:left>
										<plx:nameRef name="ruleArgs"/>
									</plx:left>
									<plx:right>
										<plx:nullKeyword/>
									</plx:right>
								</plx:binaryOperator>
							</plx:condition>
							<plx:throw>
								<plx:callNew dataTypeName="ArgumentException" dataTypeQualifier="System">
									<plx:passParam>
										<plx:string>Must be of type RangeRuleArgs.</plx:string>
									</plx:passParam>
									<plx:passParam>
										<plx:string>e</plx:string>
									</plx:passParam>
								</plx:callNew>
							</plx:throw>
						</plx:branch>
						<plx:local name="value" dataTypeName="T">
							<plx:initialize>
								<plx:cast dataTypeName="T">
									<plx:callInstance name="GetValue">
										<plx:callObject>
											<plx:callInstance name="GetProperty">
												<plx:callObject>
													<plx:callInstance name="GetType">
														<plx:callObject>
															<plx:nameRef name="target" type="parameter"/>
														</plx:callObject>
													</plx:callInstance>
												</plx:callObject>
												<plx:passParam>
													<plx:callInstance name="PropertyName" type="property">
														<plx:callObject>
															<plx:nameRef name="e" type="parameter"/>
														</plx:callObject>
													</plx:callInstance>
												</plx:passParam>
											</plx:callInstance>
										</plx:callObject>
										<plx:passParam>
											<plx:nameRef name="target" type="parameter"/>
										</plx:passParam>
										<plx:passParam>
											<plx:nullKeyword/>
										</plx:passParam>
									</plx:callInstance>
								</plx:cast>
							</plx:initialize>
						</plx:local>
						<plx:assign>
							<plx:left>
								<plx:nameRef name="result"/>
							</plx:left>
							<plx:right>
								<plx:callInstance name="Contains">
									<plx:callObject>
										<plx:callInstance name="Range" type="property">
											<plx:callObject>
												<plx:nameRef name="ruleArgs"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:callObject>
									<plx:passParam>
										<plx:nameRef name="value"/>
									</plx:passParam>
								</plx:callInstance>
							</plx:right>
						</plx:assign>
						<plx:branch>
							<plx:condition>
								<plx:binaryOperator type="booleanAnd">
									<plx:left>
										<plx:unaryOperator type="booleanNot">
											<plx:nameRef name="result"/>
										</plx:unaryOperator>
									</plx:left>
									<plx:right>
										<plx:callStatic name="IsNullOrEmpty" dataTypeName=".string">
											<plx:passParam>
												<plx:callInstance name="Description" type="property">
													<plx:callObject>
														<plx:nameRef name="e" type="parameter"/>
													</plx:callObject>
												</plx:callInstance>
											</plx:passParam>
										</plx:callStatic>
									</plx:right>
								</plx:binaryOperator>
							</plx:condition>
							<plx:assign>
								<plx:left>
									<plx:callInstance name="Description" type="property">
										<plx:callObject>
											<plx:nameRef name="e" type="parameter"/>
										</plx:callObject>
									</plx:callInstance>
								</plx:left>
								<plx:right>
									<plx:callStatic name="Format" dataTypeName=".string">
										<plx:passParam>
											<plx:string>{0} must be between {1} and {2}.</plx:string>
										</plx:passParam>
										<plx:passParam>
											<plx:callInstance name="FriendlyName" type="property">
												<plx:callObject>
													<plx:nameRef name="ruleArgs"/>
												</plx:callObject>
											</plx:callInstance>
										</plx:passParam>
										<plx:passParam>
											<plx:callInstance name="MinValue" type="property">
												<plx:callObject>
													<plx:callInstance name="Range" type="property">
														<plx:callObject>
															<plx:nameRef name="ruleArgs"/>
														</plx:callObject>
													</plx:callInstance>
												</plx:callObject>
											</plx:callInstance>
										</plx:passParam>
										<plx:passParam>
											<plx:callInstance name="MaxValue" type="property">
												<plx:callObject>
													<plx:callInstance name="Range" type="property">
														<plx:callObject>
															<plx:nameRef name="ruleArgs"/>
														</plx:callObject>
													</plx:callInstance>
												</plx:callObject>
											</plx:callInstance>
										</plx:passParam>
									</plx:callStatic>
								</plx:right>
							</plx:assign>
						</plx:branch>
						<plx:return>
							<plx:nameRef name="result"/>
						</plx:return>
					</plx:function>
					<plx:class name="MaxLengthRuleArgs" visibility="public">
						<plx:derivesFromClass dataTypeName="ValidationRuleArgs"/>
						<plx:field name="_maxLength" visibility="private" dataTypeName=".i4"/>
						<plx:property name="MaxLength" visibility="public">
							<plx:returns dataTypeName=".i4"/>
							<plx:get>
								<plx:return>
									<plx:callThis name="_maxLength" type="field"/>
								</plx:return>
							</plx:get>
						</plx:property>
						<plx:function name=".construct" visibility="public">
							<plx:param name="propertyName" dataTypeName=".string"/>
							<plx:param name="friendlyName" dataTypeName=".string"/>
							<plx:param name="maxLength" dataTypeName=".i4"/>
							<plx:initialize>
								<plx:callThis name=".implied" accessor="base">
									<plx:passParam>
										<plx:nameRef name="propertyName" type="parameter"/>
									</plx:passParam>
									<plx:passParam>
										<plx:nameRef name="friendlyName" type="parameter"/>
									</plx:passParam>
								</plx:callThis>
							</plx:initialize>
							<plx:assign>
								<plx:left>
									<plx:callThis name="_maxLength" type="field"/>
								</plx:left>
								<plx:right>
									<plx:nameRef name="maxLength" type="parameter"/>
								</plx:right>
							</plx:assign>
						</plx:function>
						<plx:function name=".construct" visibility="public">
							<plx:param name="propertyName" dataTypeName=".string"/>
							<plx:param name="maxLength" dataTypeName=".i4"/>
							<plx:initialize>
								<plx:callThis name=".implied" accessor="base">
									<plx:passParam>
										<plx:nameRef name="propertyName" type="parameter"/>
									</plx:passParam>
								</plx:callThis>
							</plx:initialize>
							<plx:assign>
								<plx:left>
									<plx:callThis name="_maxLength" type="field"/>
								</plx:left>
								<plx:right>
									<plx:nameRef name="maxLength" type="parameter"/>
								</plx:right>
							</plx:assign>
						</plx:function>
						<plx:function name="ToString" visibility="public" modifier="override">
							<plx:returns dataTypeName=".string"/>
							<plx:return>
								<plx:callStatic name="Concat" dataTypeName=".string">
									<plx:passParam>
										<plx:callThis name="ToString" accessor="base"/>
									</plx:passParam>
									<plx:passParam>
										<plx:string>!</plx:string>
									</plx:passParam>
									<plx:passParam>
										<plx:callInstance name="ToString">
											<plx:callObject>
												<plx:callThis name="_maxLength" type="field"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:passParam>
								</plx:callStatic>
							</plx:return>
						</plx:function>
					</plx:class>
					<plx:class name="MaxWordsRuleArgs" visibility="public">
						<plx:derivesFromClass dataTypeName="ValidationRuleArgs"/>
						<plx:field name="_maxLength" visibility="private" dataTypeName=".i4"/>
						<plx:property name="MaxLength" visibility="public">
							<plx:returns dataTypeName=".i4"/>
							<plx:get>
								<plx:return>
									<plx:callThis name="_maxLength" type="field"/>
								</plx:return>
							</plx:get>
						</plx:property>
						<plx:function name=".construct" visibility="public">
							<plx:param name="propertyName" dataTypeName=".string"/>
							<plx:param name="maxLength" dataTypeName=".i4"/>
							<plx:initialize>
								<plx:callThis name=".implied" accessor="base">
									<plx:passParam>
										<plx:nameRef name="propertyName" type="parameter"/>
									</plx:passParam>
								</plx:callThis>
							</plx:initialize>
							<plx:assign>
								<plx:left>
									<plx:callThis name="_maxLength" type="field"/>
								</plx:left>
								<plx:right>
									<plx:nameRef name="maxLength" type="parameter"/>
								</plx:right>
							</plx:assign>
						</plx:function>
						<plx:function name=".construct" visibility="public">
							<plx:param name="propertyName" dataTypeName=".string"/>
							<plx:param name="friendlyName" dataTypeName=".string"/>
							<plx:param name="maxLength" dataTypeName=".i4"/>
							<plx:initialize>
								<plx:callThis name=".implied" accessor="base">
									<plx:passParam>
										<plx:nameRef name="propertyName" type="parameter"/>
									</plx:passParam>
									<plx:passParam>
										<plx:nameRef name="friendlyName" type="parameter"/>
									</plx:passParam>
								</plx:callThis>
							</plx:initialize>
							<plx:assign>
								<plx:left>
									<plx:callThis name="_maxLength" type="field"/>
								</plx:left>
								<plx:right>
									<plx:nameRef name="maxLength" type="parameter"/>
								</plx:right>
							</plx:assign>
						</plx:function>
						<plx:function name="ToString" visibility="public" modifier="override">
							<plx:returns dataTypeName=".string"/>
							<plx:return>
								<plx:callStatic name="Concat" dataTypeName=".string">
									<plx:passParam>
										<plx:callThis name="ToString" accessor="base"/>
									</plx:passParam>
									<plx:passParam>
										<plx:string>!</plx:string>
									</plx:passParam>
									<plx:passParam>
										<plx:callInstance name="ToString">
											<plx:callObject>
												<plx:callThis name="_maxLength" type="field"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:passParam>
								</plx:callStatic>
							</plx:return>
						</plx:function>
					</plx:class>
					<plx:class name="RegexRuleArgs" visibility="public">
						<plx:derivesFromClass dataTypeName="ValidationRuleArgs"/>
						<plx:field name="_expression" visibility="private" dataTypeName=".string"/>
						<plx:property name="Expression" visibility="public">
							<plx:returns dataTypeName=".string"/>
							<plx:get>
								<plx:return>
									<plx:callThis name="_expression" type="field"/>
								</plx:return>
							</plx:get>
						</plx:property>
						<plx:function name=".construct" visibility="public">
							<plx:param name="propertyName" dataTypeName=".string"/>
							<plx:param name="friendlyName" dataTypeName=".string"/>
							<plx:param name="expression" dataTypeName=".string"/>
							<plx:initialize>
								<plx:callThis name=".implied" accessor="base">
									<plx:passParam>
										<plx:nameRef name="propertyName" type="parameter"/>
									</plx:passParam>
									<plx:passParam>
										<plx:nameRef name="friendlyName" type="parameter"/>
									</plx:passParam>
								</plx:callThis>
							</plx:initialize>
							<plx:assign>
								<plx:left>
									<plx:callThis name="_expression" type="field"/>
								</plx:left>
								<plx:right>
									<plx:nameRef name="expression" type="parameter"/>
								</plx:right>
							</plx:assign>
						</plx:function>
						<plx:function name=".construct" visibility="public">
							<plx:param name="propertyName" dataTypeName=".string"/>
							<plx:param name="expression" dataTypeName=".string"/>
							<plx:initialize>
								<plx:callThis name=".implied" accessor="base">
									<plx:passParam>
										<plx:nameRef name="propertyName" type="parameter"/>
									</plx:passParam>
								</plx:callThis>
							</plx:initialize>
							<plx:assign>
								<plx:left>
									<plx:callThis name="_expression" type="field"/>
								</plx:left>
								<plx:right>
									<plx:nameRef name="expression" type="parameter"/>
								</plx:right>
							</plx:assign>
						</plx:function>
						<plx:function name="ToString" visibility="public" modifier="override">
							<plx:returns dataTypeName=".string"/>
							<plx:return>
								<plx:callStatic name="Concat" dataTypeName=".string">
									<plx:passParam>
										<plx:callThis name="ToString" accessor="base"/>
									</plx:passParam>
									<plx:passParam>
										<plx:string>!</plx:string>
									</plx:passParam>
									<plx:passParam>
										<plx:callThis name="_expression" type="field"/>
									</plx:passParam>
								</plx:callStatic>
							</plx:return>
						</plx:function>
					</plx:class>
					<plx:enum name="CompareType" visibility="private">
						<plx:enumItem name="LessThanOrEqualTo">
							<plx:initialize>
								<plx:value data="0" type="i4"/>
							</plx:initialize>
						</plx:enumItem>
						<plx:enumItem name="LessThan">
							<plx:initialize>
								<plx:value data="1" type="i4"/>
							</plx:initialize>
						</plx:enumItem>
						<plx:enumItem name="EqualTo">
							<plx:initialize>
								<plx:value data="2" type="i4"/>
							</plx:initialize>
						</plx:enumItem>
						<plx:enumItem name="GreaterThan">
							<plx:initialize>
								<plx:value data="3" type="i4"/>
							</plx:initialize>
						</plx:enumItem>
						<plx:enumItem name="GreaterThanOrEqualTo">
							<plx:initialize>
								<plx:value data="4" type="i4"/>
							</plx:initialize>
						</plx:enumItem>
					</plx:enum>
					<plx:class name="CompareValueRuleArgs" visibility="public">
						<plx:typeParam name="T"/>
						<plx:derivesFromClass dataTypeName="ValidationRuleArgs"/>
						<plx:field name="_compareValue" visibility="private" dataTypeName="T"/>
						<plx:property name="CompareValue" visibility="public">
							<plx:returns dataTypeName="T"/>
							<plx:get>
								<plx:return>
									<plx:callThis name="_compareValue" type="field"/>
								</plx:return>
							</plx:get>
						</plx:property>
						<plx:function name=".construct" visibility="public">
							<plx:param name="propertyName" dataTypeName=".string"/>
							<plx:param name="compareValue" dataTypeName="T"/>
							<plx:initialize>
								<plx:callThis name=".implied" accessor="base">
									<plx:passParam>
										<plx:nameRef name="propertyName" type="parameter"/>
									</plx:passParam>
								</plx:callThis>
							</plx:initialize>
							<plx:assign>
								<plx:left>
									<plx:callThis name="_compareValue" type="field"/>
								</plx:left>
								<plx:right>
									<plx:nameRef name="compareValue" type="parameter"/>
								</plx:right>
							</plx:assign>
						</plx:function>
						<plx:function name=".construct" visibility="public">
							<plx:param name="propertyName" dataTypeName=".string"/>
							<plx:param name="friendlyName" dataTypeName=".string"/>
							<plx:param name="compareValue" dataTypeName="T"/>
							<plx:initialize>
								<plx:callThis name=".implied" accessor="base">
									<plx:passParam>
										<plx:nameRef name="propertyName" type="parameter"/>
									</plx:passParam>
									<plx:passParam>
										<plx:nameRef name="friendlyName" type="parameter"/>
									</plx:passParam>
								</plx:callThis>
							</plx:initialize>
							<plx:assign>
								<plx:left>
									<plx:callThis name="_compareValue" type="field"/>
								</plx:left>
								<plx:right>
									<plx:nameRef name="compareValue" type="parameter"/>
								</plx:right>
							</plx:assign>
						</plx:function>
						<plx:function name="ToString" visibility="public" modifier="override">
							<plx:returns dataTypeName=".string"/>
							<plx:return>
								<plx:callStatic name="Concat" dataTypeName=".string">
									<plx:passParam>
										<plx:callThis name="ToString" accessor="base"/>
									</plx:passParam>
									<plx:passParam>
										<plx:string>!</plx:string>
									</plx:passParam>
									<plx:passParam>
										<plx:callInstance name="ToString">
											<plx:callObject>
												<plx:callThis name="_compareValue" type="field"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:passParam>
								</plx:callStatic>
							</plx:return>
						</plx:function>
					</plx:class>
					<plx:class name="Range" visibility="public">
						<plx:typeParam name="T"/>
						<plx:field name="minValue" visibility="private" readOnly="true" dataTypeName="T"/>
						<plx:field name="maxValue" visibility="private" readOnly="true" dataTypeName="T"/>
						<plx:property name="MinValue" visibility="public">
							<plx:returns dataTypeName="T"/>
							<plx:get>
								<plx:return>
									<plx:callThis name="minValue" type="field"/>
								</plx:return>
							</plx:get>
						</plx:property>
						<plx:property name="MaxValue" visibility="public">
							<plx:returns dataTypeName="T"/>
							<plx:get>
								<plx:return>
									<plx:callThis name="maxValue" type="field"/>
								</plx:return>
							</plx:get>
						</plx:property>
						<plx:function name=".construct" visibility="public">
							<plx:param name="minValue" dataTypeName="T"/>
							<plx:param name="maxValue" dataTypeName="T"/>
							<plx:branch>
								<plx:condition>
									<plx:binaryOperator type="lessThanOrEqual">
										<plx:left>
											<plx:callInstance name="Compare">
												<plx:callObject>
													<plx:callStatic name="DefaultInvariant" type="field" dataTypeName="Comparer" dataTypeQualifier="System.Collections"/>
												</plx:callObject>
												<plx:passParam>
													<plx:nameRef name="minValue" type="parameter"/>
												</plx:passParam>
												<plx:passParam>
													<plx:nameRef name="maxValue" type="parameter"/>
												</plx:passParam>
											</plx:callInstance>
										</plx:left>
										<plx:right>
											<plx:value data="0" type="i4"/>
										</plx:right>
									</plx:binaryOperator>
								</plx:condition>
								<plx:assign>
									<plx:left>
										<plx:callThis name="minValue" type="field"/>
									</plx:left>
									<plx:right>
										<plx:nameRef name="minValue" type="parameter"/>
									</plx:right>
								</plx:assign>
								<plx:assign>
									<plx:left>
										<plx:callThis name="maxValue" type="field"/>
									</plx:left>
									<plx:right>
										<plx:nameRef name="maxValue" type="parameter"/>
									</plx:right>
								</plx:assign>
							</plx:branch>
							<plx:fallbackBranch>
								<plx:assign>
									<plx:left>
										<plx:callThis name="minValue" type="field"/>
									</plx:left>
									<plx:right>
										<plx:nameRef name="maxValue" type="parameter"/>
									</plx:right>
								</plx:assign>
								<plx:assign>
									<plx:left>
										<plx:callThis name="maxValue" type="field"/>
									</plx:left>
									<plx:right>
										<plx:nameRef name="minValue" type="parameter"/>
									</plx:right>
								</plx:assign>
							</plx:fallbackBranch>
						</plx:function>
						<plx:function name="Contains" visibility="public">
							<plx:param name="value" dataTypeName="T"/>
							<plx:returns dataTypeName=".boolean"/>
							<plx:return>
								<plx:binaryOperator type="booleanAnd">
									<plx:left>
										<plx:binaryOperator type="greaterThanOrEqual">
											<plx:left>
												<plx:callInstance name="Compare">
													<plx:callObject>
														<plx:callStatic name="DefaultInvariant" type="field" dataTypeName="Comparer" dataTypeQualifier="System.Collections"/>
													</plx:callObject>
													<plx:passParam>
														<plx:nameRef name="value" type="parameter"/>
													</plx:passParam>
													<plx:passParam>
														<plx:callThis name="MinValue" type="property"/>
													</plx:passParam>
												</plx:callInstance>
											</plx:left>
											<plx:right>
												<plx:value data="0" type="i4"/>
											</plx:right>
										</plx:binaryOperator>
									</plx:left>
									<plx:right>
										<plx:binaryOperator type="lessThanOrEqual">
											<plx:left>
												<plx:callInstance name="Compare">
													<plx:callObject>
														<plx:callStatic name="DefaultInvariant" type="field" dataTypeName="Comparer" dataTypeQualifier="System.Collections"/>
													</plx:callObject>
													<plx:passParam>
														<plx:nameRef name="value" type="parameter"/>
													</plx:passParam>
													<plx:passParam>
														<plx:callThis name="MaxValue" type="property"/>
													</plx:passParam>
												</plx:callInstance>
											</plx:left>
											<plx:right>
												<plx:value data="0" type="i4"/>
											</plx:right>
										</plx:binaryOperator>
									</plx:right>
								</plx:binaryOperator>
							</plx:return>
						</plx:function>
						<plx:function name="ToString" visibility="public" modifier="override">
							<plx:returns dataTypeName=".string"/>
							<plx:return>
								<plx:callStatic name="Concat" dataTypeName=".string">
									<plx:passParamArray dataTypeIsSimpleArray="true" dataTypeName=".string">
										<plx:passParam>
											<plx:callThis name="ToString" accessor="base"/>
										</plx:passParam>
										<plx:passParam>
											<plx:string>!</plx:string>
										</plx:passParam>
										<plx:passParam>
											<plx:callInstance name="ToString">
												<plx:callObject>
													<plx:callThis name="minValue" type="field"/>
												</plx:callObject>
											</plx:callInstance>
										</plx:passParam>
										<plx:passParam>
											<plx:string>-</plx:string>
										</plx:passParam>
										<plx:passParam>
											<plx:callInstance name="ToString">
												<plx:callObject>
													<plx:callThis name="maxValue" type="field"/>
												</plx:callObject>
											</plx:callInstance>
										</plx:passParam>
									</plx:passParamArray>
								</plx:callStatic>
							</plx:return>
						</plx:function>
					</plx:class>
					<plx:class name="RangeRuleArgs" visibility="public">
						<plx:typeParam name="T"/>
						<plx:derivesFromClass dataTypeName="ValidationRuleArgs"/>
						<plx:field name="range" visibility="private" dataTypeName="Range" dataTypeQualifier="CommonRules">
							<plx:passTypeParam dataTypeName="T"/>
						</plx:field>
						<plx:property name="Range" visibility="public">
							<plx:returns dataTypeName="Range" dataTypeQualifier="CommonRules">
								<plx:passTypeParam dataTypeName="T"/>
							</plx:returns>
							<plx:get>
								<plx:return>
									<plx:callThis name="range" type="field"/>
								</plx:return>
							</plx:get>
						</plx:property>
						<plx:function name=".construct" visibility="public">
							<plx:param name="propertyName" dataTypeName=".string"/>
							<plx:param name="minValue" dataTypeName="T"/>
							<plx:param name="maxValue" dataTypeName="T"/>
							<plx:initialize>
								<plx:callThis name=".implied" accessor="base">
									<plx:passParam>
										<plx:nameRef name="propertyName" type="parameter"/>
									</plx:passParam>
								</plx:callThis>
							</plx:initialize>
							<plx:assign>
								<plx:left>
									<plx:callThis name="range" type="field"/>
								</plx:left>
								<plx:right>
									<plx:callNew dataTypeName="Range" dataTypeQualifier="CommonRules">
										<plx:passTypeParam dataTypeName="T"/>
										<plx:passParam>
											<plx:nameRef name="minValue" type="parameter"/>
										</plx:passParam>
										<plx:passParam>
											<plx:nameRef name="maxValue" type="parameter"/>
										</plx:passParam>
									</plx:callNew>
								</plx:right>
							</plx:assign>
						</plx:function>
						<plx:function name=".construct" visibility="public">
							<plx:param name="propertyName" dataTypeName=".string"/>
							<plx:param name="friendlyName" dataTypeName=".string"/>
							<plx:param name="minValue" dataTypeName="T"/>
							<plx:param name="maxValue" dataTypeName="T"/>
							<plx:initialize>
								<plx:callThis name=".implied" accessor="base">
									<plx:passParam>
										<plx:nameRef name="propertyName" type="parameter"/>
									</plx:passParam>
									<plx:passParam>
										<plx:nameRef name="friendlyName" type="parameter"/>
									</plx:passParam>
								</plx:callThis>
							</plx:initialize>
							<plx:assign>
								<plx:left>
									<plx:callThis name="range" type="field"/>
								</plx:left>
								<plx:right>
									<plx:callNew dataTypeName="Range" dataTypeQualifier="CommonRules">
										<plx:passTypeParam dataTypeName="T"/>
										<plx:passParam>
											<plx:nameRef name="minValue" type="parameter"/>
										</plx:passParam>
										<plx:passParam>
											<plx:nameRef name="maxValue" type="parameter"/>
										</plx:passParam>
									</plx:callNew>
								</plx:right>
							</plx:assign>
						</plx:function>
						<plx:function name=".construct" visibility="public">
							<plx:param name="propertyName" dataTypeName=".string"/>
							<plx:param name="range" dataTypeName="Range" dataTypeQualifier="CommonRules">
								<plx:passTypeParam dataTypeName="T"/>
							</plx:param>
							<plx:initialize>
								<plx:callThis name=".implied" accessor="base">
									<plx:passParam>
										<plx:nameRef name="propertyName" type="parameter"/>
									</plx:passParam>
								</plx:callThis>
							</plx:initialize>
							<plx:assign>
								<plx:left>
									<plx:callThis name="range" type="field"/>
								</plx:left>
								<plx:right>
									<plx:nameRef name="range" type="parameter"/>
								</plx:right>
							</plx:assign>
						</plx:function>
						<plx:function name=".construct" visibility="public">
							<plx:param name="propertyName" dataTypeName=".string"/>
							<plx:param name="friendlyName" dataTypeName=".string"/>
							<plx:param name="range" dataTypeName="Range" dataTypeQualifier="CommonRules">
								<plx:passTypeParam dataTypeName="T"/>
							</plx:param>
							<plx:initialize>
								<plx:callThis name=".implied" accessor="base">
									<plx:passParam>
										<plx:nameRef name="propertyName" type="parameter"/>
									</plx:passParam>
									<plx:passParam>
										<plx:nameRef name="friendlyName" type="parameter"/>
									</plx:passParam>
								</plx:callThis>
							</plx:initialize>
							<plx:assign>
								<plx:left>
									<plx:callThis name="range" type="field"/>
								</plx:left>
								<plx:right>
									<plx:nameRef name="range" type="parameter"/>
								</plx:right>
							</plx:assign>
						</plx:function>
						<plx:function name="ToString" visibility="public" modifier="override">
							<plx:returns dataTypeName=".string"/>
							<plx:return>
								<plx:callStatic name="Concat" dataTypeName=".string">
									<plx:passParam>
										<plx:callThis name="ToString" accessor="base"/>
									</plx:passParam>
									<plx:passParam>
										<plx:string>!</plx:string>
									</plx:passParam>
									<plx:passParam>
										<plx:callInstance name="ToString">
											<plx:callObject>
												<plx:callThis name="range" type="field"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:passParam>
								</plx:callStatic>
							</plx:return>
						</plx:function>
					</plx:class>
				</plx:class>
				<plx:pragma type="closeRegion" data="CommonRules Class"/>
				<!-- END Entities.Validation.CommonRules.cst -->

				<!-- START Entities.Validation.ValidationRuleArgs.cst -->
				<plx:pragma type="region" data="ValidationRuleArgs Class"/>
				<plx:class name="ValidationRuleArgs" visibility="public">
					<plx:field name="_propertyName" visibility="private" dataTypeName=".string"/>
					<plx:field name="_description" visibility="private" dataTypeName=".string"/>
					<plx:field name="_tag" visibility="private" dataTypeName=".object"/>
					<plx:field name="_friendlyName" visibility="private" dataTypeName=".string"/>
					<plx:property name="Tag" visibility="public">
						<plx:attribute dataTypeName="XmlIgnoreAttribute" dataTypeQualifier="System.Xml.Serialization"/>
						<plx:returns dataTypeName=".object"/>
						<plx:get>
							<plx:return>
								<plx:callThis name="_tag" type="field"/>
							</plx:return>
						</plx:get>
						<plx:set>
							<plx:assign>
								<plx:left>
									<plx:callThis name="_tag" type="field"/>
								</plx:left>
								<plx:right>
									<plx:nameRef name="value" type="parameter"/>
								</plx:right>
							</plx:assign>
						</plx:set>
					</plx:property>
					<plx:property name="PropertyName" visibility="public">
						<plx:returns dataTypeName=".string"/>
						<plx:get>
							<plx:return>
								<plx:callThis name="_propertyName" type="field"/>
							</plx:return>
						</plx:get>
					</plx:property>
					<plx:property name="Description" visibility="public">
						<plx:returns dataTypeName=".string"/>
						<plx:get>
							<plx:return>
								<plx:callThis name="_description" type="field"/>
							</plx:return>
						</plx:get>
						<plx:set>
							<plx:assign>
								<plx:left>
									<plx:callThis name="_description" type="field"/>
								</plx:left>
								<plx:right>
									<plx:nameRef name="value" type="parameter"/>
								</plx:right>
							</plx:assign>
						</plx:set>
					</plx:property>
					<plx:property name="FriendlyName" visibility="public">
						<plx:returns dataTypeName=".string"/>
						<plx:get>
							<plx:return>
								<plx:callThis name="_friendlyName" type="field"/>
							</plx:return>
						</plx:get>
						<plx:set>
							<plx:assign>
								<plx:left>
									<plx:callThis name="_friendlyName" type="field"/>
								</plx:left>
								<plx:right>
									<plx:nameRef name="value" type="parameter"/>
								</plx:right>
							</plx:assign>
						</plx:set>
					</plx:property>
					<plx:function name=".construct" visibility="public">
						<plx:param name="propertyName" dataTypeName=".string"/>
						<plx:assign>
							<plx:left>
								<plx:callThis name="_propertyName" type="field"/>
							</plx:left>
							<plx:right>
								<plx:nameRef name="propertyName" type="parameter"/>
							</plx:right>
						</plx:assign>
						<plx:assign>
							<plx:left>
								<plx:callThis name="_friendlyName" type="field"/>
							</plx:left>
							<plx:right>
								<plx:nameRef name="propertyName" type="parameter"/>
							</plx:right>
						</plx:assign>
					</plx:function>
					<plx:function name=".construct" visibility="public">
						<plx:param name="propertyName" dataTypeName=".string"/>
						<plx:param name="friendlyName" dataTypeName=".string"/>
						<plx:assign>
							<plx:left>
								<plx:callThis name="_propertyName" type="field"/>
							</plx:left>
							<plx:right>
								<plx:nameRef name="propertyName" type="parameter"/>
							</plx:right>
						</plx:assign>
						<plx:assign>
							<plx:left>
								<plx:callThis name="_friendlyName" type="field"/>
							</plx:left>
							<plx:right>
								<plx:nameRef name="friendlyName" type="parameter"/>
							</plx:right>
						</plx:assign>
					</plx:function>
					<plx:function name="ToString" visibility="public" modifier="override">
						<plx:returns dataTypeName=".string"/>
						<plx:return>
							<plx:callThis name="_propertyName" type="field"/>
						</plx:return>
					</plx:function>
				</plx:class>
				<plx:pragma type="closeRegion" data="ValidationRuleArgs Class"/>
				<!-- END Entities.Validation.ValidationRuleArgs.cst -->

				<!-- START Entities.Validation.ValidationRuleHandler.cst -->
				<plx:pragma type="region" data="ValidationRuleHandler Class"/>
				<plx:delegate name="ValidationRuleHandler" visibility="public">
					<plx:param name="target" dataTypeName=".object"/>
					<plx:param name="e" dataTypeName="ValidationRuleArgs"/>
					<plx:returns dataTypeName=".boolean"/>
				</plx:delegate>
				<plx:pragma type="closeRegion" data="ValidationRuleHandler Class"/>
				<!-- END Entities.Validation.ValidationRuleHandler.cst -->

				<!-- START Entities.Validation.ValidationRuleInfo.cst -->
				<plx:pragma type="region" data="ValidationRuleInfo Class"/>
				<plx:class name="ValidationRuleInfo" visibility="internal">
					<plx:field name="_target" visibility="private" dataTypeName=".object"/>
					<plx:field name="_handler" visibility="private" dataTypeName="ValidationRuleHandler"/>
					<plx:field name="_ruleName" visibility="private" dataTypeName=".string"/>
					<plx:field name="_args" visibility="private" dataTypeName="ValidationRuleArgs"/>
					<plx:property name="RuleName" visibility="public">
						<plx:returns dataTypeName=".string"/>
						<plx:get>
							<plx:return>
								<plx:callThis name="_ruleName" type="field"/>
							</plx:return>
						</plx:get>
					</plx:property>
					<plx:property name="ValidationRuleArgs" visibility="public">
						<plx:returns dataTypeName="ValidationRuleArgs"/>
						<plx:get>
							<plx:return>
								<plx:callThis name="_args" type="field"/>
							</plx:return>
						</plx:get>
					</plx:property>
					<plx:function name="ToString" visibility="public" modifier="override">
						<plx:returns dataTypeName=".string"/>
						<plx:return>
							<plx:callThis name="_ruleName" type="field"/>
						</plx:return>
					</plx:function>
					<plx:function name=".construct" visibility="public">
						<plx:param name="target" dataTypeName=".object"/>
						<plx:param name="handler" dataTypeName="ValidationRuleHandler"/>
						<plx:param name="propertyName" dataTypeName=".string"/>
						<plx:initialize>
							<plx:callThis name=".implied">
								<plx:passParam>
									<plx:nameRef name="target" type="parameter"/>
								</plx:passParam>
								<plx:passParam>
									<plx:nameRef name="handler" type="parameter"/>
								</plx:passParam>
								<plx:passParam>
									<plx:callNew dataTypeName="ValidationRuleArgs">
										<plx:passParam>
											<plx:nameRef name="propertyName" type="parameter"/>
										</plx:passParam>
									</plx:callNew>
								</plx:passParam>
							</plx:callThis>
						</plx:initialize>
					</plx:function>
					<plx:function name=".construct" visibility="public">
						<plx:param name="target" dataTypeName=".object"/>
						<plx:param name="handler" dataTypeName="ValidationRuleHandler"/>
						<plx:param name="args" dataTypeName="ValidationRuleArgs"/>
						<plx:assign>
							<plx:left>
								<plx:callThis name="_ruleName" type="field"/>
							</plx:left>
							<plx:right>
								<plx:callStatic name="Empty" type="field" dataTypeName=".string"/>
							</plx:right>
						</plx:assign>
						<plx:assign>
							<plx:left>
								<plx:callThis name="_target" type="field"/>
							</plx:left>
							<plx:right>
								<plx:nameRef name="target" type="parameter"/>
							</plx:right>
						</plx:assign>
						<plx:assign>
							<plx:left>
								<plx:callThis name="_handler" type="field"/>
							</plx:left>
							<plx:right>
								<plx:nameRef name="handler" type="parameter"/>
							</plx:right>
						</plx:assign>
						<plx:assign>
							<plx:left>
								<plx:callThis name="_args" type="field"/>
							</plx:left>
							<plx:right>
								<plx:nameRef name="args" type="parameter"/>
							</plx:right>
						</plx:assign>
						<plx:assign>
							<plx:left>
								<plx:callThis name="_ruleName" type="field"/>
							</plx:left>
							<plx:right>
								<plx:callStatic name="Concat" dataTypeName=".string">
									<plx:passParam>
										<plx:callInstance name="Name" type="property">
											<plx:callObject>
												<plx:callInstance name="Method" type="property">
													<plx:callObject>
														<plx:callThis name="_handler" type="field"/>
													</plx:callObject>
												</plx:callInstance>
											</plx:callObject>
										</plx:callInstance>
									</plx:passParam>
									<plx:passParam>
										<plx:string>!</plx:string>
									</plx:passParam>
									<plx:passParam>
										<plx:callInstance name="ToString">
											<plx:callObject>
												<plx:callThis name="_args" type="field"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:passParam>
								</plx:callStatic>
							</plx:right>
						</plx:assign>
					</plx:function>
					<plx:function name="Invoke" visibility="public">
						<plx:returns dataTypeName=".boolean"/>
						<plx:return>
							<plx:callInstance name=".implied" type="delegateCall">
								<plx:callObject>
									<plx:callThis name="_handler" type="field"/>
								</plx:callObject>
								<plx:passParam>
									<plx:callThis name="_target" type="field"/>
								</plx:passParam>
								<plx:passParam>
									<plx:callThis name="_args" type="field"/>
								</plx:passParam>
							</plx:callInstance>
						</plx:return>
					</plx:function>
				</plx:class>
				<plx:pragma type="closeRegion" data="ValidationRuleInfo Class"/>
				<!-- END Entities.Validation.ValidationRuleInfo.cst -->

				<!-- START Entities.Validation.ValidationRules.cst -->
				<plx:pragma type="region" data="ValidationRules Class"/>
				<plx:class name="ValidationRules" visibility="public">
					<plx:attribute dataTypeName="SerializableAttribute" dataTypeQualifier="System"/>
					<plx:field name="_brokenRules" visibility="private" dataTypeName="BrokenRulesList"/>
					<plx:field name="_target" visibility="private" dataTypeName=".object">
						<plx:attribute dataTypeName="NonSerializedAttribute" dataTypeQualifier="System"/>
					</plx:field>
					<plx:field name="_rulesList" visibility="private" dataTypeName="Dictionary" dataTypeQualifier="System.Collections.Generic">
						<plx:passTypeParam dataTypeName=".string"/>
						<plx:passTypeParam dataTypeName="List" dataTypeQualifier="System.Collections.Generic">
							<plx:passTypeParam dataTypeName="ValidationRuleInfo"/>
						</plx:passTypeParam>
						<plx:attribute dataTypeName="NonSerializedAttribute" dataTypeQualifier="System"/>
					</plx:field>
					<plx:property name="Target" visibility="internal">
						<plx:returns dataTypeName=".object"/>
						<plx:get>
							<plx:return>
								<plx:callThis name="_target" type="field"/>
							</plx:return>
						</plx:get>
						<plx:set>
							<plx:assign>
								<plx:left>
									<plx:callThis name="_target" type="field"/>
								</plx:left>
								<plx:right>
									<plx:nameRef name="value" type="parameter"/>
								</plx:right>
							</plx:assign>
						</plx:set>
					</plx:property>
					<plx:property name="BrokenRulesList" visibility="private">
						<plx:returns dataTypeName="BrokenRulesList"/>
						<plx:get>
							<plx:branch>
								<plx:condition>
									<plx:binaryOperator type="identityEquality">
										<plx:left>
											<plx:callThis name="_brokenRules" type="field"/>
										</plx:left>
										<plx:right>
											<plx:nullKeyword/>
										</plx:right>
									</plx:binaryOperator>
								</plx:condition>
								<plx:assign>
									<plx:left>
										<plx:callThis name="_brokenRules" type="field"/>
									</plx:left>
									<plx:right>
										<plx:callNew dataTypeName="BrokenRulesList"/>
									</plx:right>
								</plx:assign>
							</plx:branch>
							<plx:return>
								<plx:callThis name="_brokenRules" type="field"/>
							</plx:return>
						</plx:get>
					</plx:property>
					<plx:property name="RulesList" visibility="private">
						<plx:returns dataTypeName="Dictionary" dataTypeQualifier="System.Collections.Generic">
							<plx:passTypeParam dataTypeName=".string"/>
							<plx:passTypeParam dataTypeName="List" dataTypeQualifier="System.Collections.Generic">
								<plx:passTypeParam dataTypeName="ValidationRuleInfo"/>
							</plx:passTypeParam>
						</plx:returns>
						<plx:get>
							<plx:branch>
								<plx:condition>
									<plx:binaryOperator type="identityEquality">
										<plx:left>
											<plx:callThis name="_rulesList" type="field"/>
										</plx:left>
										<plx:right>
											<plx:nullKeyword/>
										</plx:right>
									</plx:binaryOperator>
								</plx:condition>
								<plx:assign>
									<plx:left>
										<plx:callThis name="_rulesList" type="field"/>
									</plx:left>
									<plx:right>
										<plx:callNew dataTypeName="Dictionary" dataTypeQualifier="System.Collections.Generic">
											<plx:passTypeParam dataTypeName=".string"/>
											<plx:passTypeParam dataTypeName="List" dataTypeQualifier="System.Collections.Generic">
												<plx:passTypeParam dataTypeName="ValidationRuleInfo"/>
											</plx:passTypeParam>
										</plx:callNew>
									</plx:right>
								</plx:assign>
							</plx:branch>
							<plx:return>
								<plx:callThis name="_rulesList" type="field"/>
							</plx:return>
						</plx:get>
					</plx:property>
					<plx:property name="IsValid" visibility="internal">
						<plx:returns dataTypeName=".boolean"/>
						<plx:get>
							<plx:return>
								<plx:binaryOperator type="equality">
									<plx:left>
										<plx:callInstance name="Count" type="property">
											<plx:callObject>
												<plx:callThis name="BrokenRulesList" type="property"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:left>
									<plx:right>
										<plx:value data="0" type="i4"/>
									</plx:right>
								</plx:binaryOperator>
							</plx:return>
						</plx:get>
					</plx:property>
					<plx:function name=".construct" visibility="internal">
						<plx:param name="businessEntity" dataTypeName=".object"/>
						<plx:assign>
							<plx:left>
								<plx:callThis name="Target" type="property"/>
							</plx:left>
							<plx:right>
								<plx:nameRef name="businessEntity" type="parameter"/>
							</plx:right>
						</plx:assign>
					</plx:function>
					<plx:function name="GetPropertyRules" visibility="private">
						<plx:param name="propertyName" dataTypeName=".string"/>
						<plx:returns dataTypeName="List" dataTypeQualifier="System.Collections.Generic">
							<plx:passTypeParam dataTypeName="ValidationRuleInfo"/>
						</plx:returns>
						<plx:local name="list" dataTypeName="List" dataTypeQualifier="System.Collections.Generic">
							<plx:passTypeParam dataTypeName="ValidationRuleInfo"/>
							<plx:initialize>
								<plx:nullKeyword/>
							</plx:initialize>
						</plx:local>
						<plx:branch>
							<plx:condition>
								<plx:callInstance name="ContainsKey">
									<plx:callObject>
										<plx:callThis name="RulesList" type="property"/>
									</plx:callObject>
									<plx:passParam>
										<plx:nameRef name="propertyName" type="parameter"/>
									</plx:passParam>
								</plx:callInstance>
							</plx:condition>
							<plx:assign>
								<plx:left>
									<plx:nameRef name="list"/>
								</plx:left>
								<plx:right>
									<plx:callInstance name=".implied" type="indexerCall">
										<plx:callObject>
											<plx:callThis name="RulesList" type="property"/>
										</plx:callObject>
										<plx:passParam>
											<plx:nameRef name="propertyName" type="parameter"/>
										</plx:passParam>
									</plx:callInstance>
								</plx:right>
							</plx:assign>
						</plx:branch>
						<plx:branch>
							<plx:condition>
								<plx:binaryOperator type="identityEquality">
									<plx:left>
										<plx:nameRef name="list"/>
									</plx:left>
									<plx:right>
										<plx:nullKeyword/>
									</plx:right>
								</plx:binaryOperator>
							</plx:condition>
							<plx:assign>
								<plx:left>
									<plx:nameRef name="list"/>
								</plx:left>
								<plx:right>
									<plx:callNew dataTypeName="List" dataTypeQualifier="System.Collections.Generic">
										<plx:passTypeParam dataTypeName="ValidationRuleInfo"/>
									</plx:callNew>
								</plx:right>
							</plx:assign>
							<plx:callInstance name="Add">
								<plx:callObject>
									<plx:callThis name="RulesList" type="property"/>
								</plx:callObject>
								<plx:passParam>
									<plx:nameRef name="propertyName" type="parameter"/>
								</plx:passParam>
								<plx:passParam>
									<plx:nameRef name="list"/>
								</plx:passParam>
							</plx:callInstance>
						</plx:branch>
						<plx:return>
							<plx:nameRef name="list"/>
						</plx:return>
					</plx:function>
					<plx:function name="AddRule" visibility="public">
						<plx:param name="handler" dataTypeName="ValidationRuleHandler"/>
						<plx:param name="propertyName" dataTypeName=".string"/>
						<plx:callThis name="AddRule">
							<plx:passParam>
								<plx:nameRef name="handler" type="parameter"/>
							</plx:passParam>
							<plx:passParam>
								<plx:callNew dataTypeName="ValidationRuleArgs">
									<plx:passParam>
										<plx:nameRef name="propertyName" type="parameter"/>
									</plx:passParam>
								</plx:callNew>
							</plx:passParam>
						</plx:callThis>
					</plx:function>
					<plx:function name="AddRule" visibility="public">
						<plx:param name="handler" dataTypeName="ValidationRuleHandler"/>
						<plx:param name="args" dataTypeName="ValidationRuleArgs"/>
						<plx:callInstance name="Add">
							<plx:callObject>
								<plx:callThis name="GetPropertyRules">
									<plx:passParam>
										<plx:callInstance name="PropertyName" type="property">
											<plx:callObject>
												<plx:nameRef name="args" type="parameter"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:passParam>
								</plx:callThis>
							</plx:callObject>
							<plx:passParam>
								<plx:callNew dataTypeName="ValidationRuleInfo">
									<plx:passParam>
										<plx:callThis name="_target" type="field"/>
									</plx:passParam>
									<plx:passParam>
										<plx:nameRef name="handler" type="parameter"/>
									</plx:passParam>
									<plx:passParam>
										<plx:nameRef name="args" type="parameter"/>
									</plx:passParam>
								</plx:callNew>
							</plx:passParam>
						</plx:callInstance>
					</plx:function>
					<plx:function name="ValidateRuleList" visibility="private">
						<plx:param name="ruleList" dataTypeName="List" dataTypeQualifier="System.Collections.Generic">
							<plx:passTypeParam dataTypeName="ValidationRuleInfo"/>
						</plx:param>
						<plx:iterator localName="rule" dataTypeName="ValidationRuleInfo">
							<plx:initialize>
								<plx:nameRef name="ruleList" type="parameter"/>
							</plx:initialize>
							<plx:branch>
								<plx:condition>
									<plx:callInstance name="Invoke">
										<plx:callObject>
											<plx:nameRef name="rule"/>
										</plx:callObject>
									</plx:callInstance>
								</plx:condition>
								<plx:callInstance name="Remove">
									<plx:callObject>
										<plx:callThis name="BrokenRulesList" type="property"/>
									</plx:callObject>
									<plx:passParam>
										<plx:nameRef name="rule"/>
									</plx:passParam>
								</plx:callInstance>
							</plx:branch>
							<plx:fallbackBranch>
								<plx:callInstance name="Add">
									<plx:callObject>
										<plx:callThis name="BrokenRulesList" type="property"/>
									</plx:callObject>
									<plx:passParam>
										<plx:nameRef name="rule"/>
									</plx:passParam>
								</plx:callInstance>
							</plx:fallbackBranch>
						</plx:iterator>
					</plx:function>
					<plx:function name="ValidateRules" visibility="public">
						<plx:param name="propertyName" dataTypeName=".string"/>
						<plx:branch>
							<plx:condition>
								<plx:callInstance name="ContainsKey">
									<plx:callObject>
										<plx:callThis name="RulesList" type="property"/>
									</plx:callObject>
									<plx:passParam>
										<plx:nameRef name="propertyName" type="parameter"/>
									</plx:passParam>
								</plx:callInstance>
							</plx:condition>
							<plx:local name="list" dataTypeName="List" dataTypeQualifier="System.Collections.Generic">
								<plx:passTypeParam dataTypeName="ValidationRuleInfo"/>
								<plx:initialize>
									<plx:callInstance name=".implied" type="indexerCall">
										<plx:callObject>
											<plx:callThis name="RulesList" type="property"/>
										</plx:callObject>
										<plx:passParam>
											<plx:nameRef name="propertyName" type="parameter"/>
										</plx:passParam>
									</plx:callInstance>
								</plx:initialize>
							</plx:local>
							<plx:branch>
								<plx:condition>
									<plx:binaryOperator type="identityInequality">
										<plx:left>
											<plx:nameRef name="list"/>
										</plx:left>
										<plx:right>
											<plx:nullKeyword/>
										</plx:right>
									</plx:binaryOperator>
								</plx:condition>
								<plx:callThis name="ValidateRuleList">
									<plx:passParam>
										<plx:nameRef name="list"/>
									</plx:passParam>
								</plx:callThis>
							</plx:branch>
						</plx:branch>
					</plx:function>
					<plx:function name="ValidateRules" visibility="public">
						<plx:iterator localName="rulePair" dataTypeName="KeyValuePair" dataTypeQualifier="System.Collections.Generic">
							<plx:passTypeParam dataTypeName=".string"/>
							<plx:passTypeParam dataTypeName="List" dataTypeQualifier="System.Collections.Generic">
								<plx:passTypeParam dataTypeName="ValidationRuleInfo"/>
							</plx:passTypeParam>
							<plx:initialize>
								<plx:callThis name="RulesList" type="property"/>
							</plx:initialize>
							<plx:callThis name="ValidateRuleList">
								<plx:passParam>
									<plx:callInstance name="Value" type="property">
										<plx:callObject>
											<plx:nameRef name="rulePair"/>
										</plx:callObject>
									</plx:callInstance>
								</plx:passParam>
							</plx:callThis>
						</plx:iterator>
					</plx:function>
					<plx:function name="GetBrokenRules" visibility="public">
						<plx:returns dataTypeName="BrokenRulesList"/>
						<plx:return>
							<plx:callThis name="BrokenRulesList" type="property"/>
						</plx:return>
					</plx:function>
					<plx:function name="Clear" visibility="public">
						<plx:callInstance name="Clear">
							<plx:callObject>
								<plx:callThis name="_rulesList" type="field"/>
							</plx:callObject>
						</plx:callInstance>
					</plx:function>
				</plx:class>
				<plx:pragma type="closeRegion" data="ValidationRules Class"/>
				<!-- END Entities.Validation.ValidationRules.cst -->
			</plx:namespace>
			<!-- END Validation Namespace -->

			<!-- START {$BLLNamespace} -->
			<plx:namespace name="{$BLLNamespace}">
				<xsl:apply-templates select="child::*"/>
				<xsl:call-template name="VList"/>
				<xsl:call-template name="TList"/>
				<xsl:call-template name="ListBase"/>
				<xsl:call-template name="EntityInterfaces"/>
				<xsl:call-template name="GenericTypeConverter"/>
				<xsl:call-template name="Filter"/>

				<xsl:call-template name="Enum">
					<!-- TODO: Need to finish this one -->
				</xsl:call-template>

				<xsl:call-template name="EntityUtil"/>
				<xsl:call-template name="EntityPropertyComparer"/>
				<xsl:call-template name="EntityManager"/>
				<xsl:call-template name="EntityLocator"/>
				<xsl:call-template name="EntityKeyBaseCore.generated"/>
				<xsl:call-template name="EntityKeyBase"/>
				<xsl:call-template name="EntityInstanceBase.generated">
					<!-- TODO: Need to finish this one -->
				</xsl:call-template>
				<xsl:call-template name="EntityInstance"/>
				<xsl:call-template name="EntityHelper"/>
				<xsl:call-template name="EntityFactoryBase"/>
				<xsl:call-template name="EntityFactory"/>

				<xsl:call-template name="EntityData">
					<!-- TODO: Need to finish this one -->
				</xsl:call-template>

				<xsl:call-template name="EntityCache"/>
				<xsl:call-template name="EntityBaseCore.generated"/>
				<xsl:call-template name="EntityBase"/>
			</plx:namespace>
			<!-- END {$BLLNamespace} -->
		</plx:root>
	</xsl:template>

	<xsl:template name="allTables" match="se:table">
		<xsl:variable name="allTables" select="../se:table"/>
		<xsl:variable name="currentTable" select="."/>
		<xsl:variable name="currentClass" select="$currentTable/@name"/>
		<xsl:variable name="currentTableColumns" select="se:columns/se:column"/>
		<xsl:variable name="currentTableIndexes" select="se:indexes/se:index"/>
		<xsl:variable name="currentTablePrimaryKey" select="$currentTableIndexes[@isPrimary='true' or @isPrimary='1']"/>
		<xsl:variable name="currentTableForeignKeys" select="se:keys/se:key"/>
		<xsl:variable name="rowVersionColumn" select="$currentTable/se:columns/se:column[@nativeType='timestamp'][1]"/>
		<xsl:variable name="fullColumnParamsFragment">
			<xsl:call-template name="GetColumnParams">
				<xsl:with-param name="table" select="$currentTable"/>
				<xsl:with-param name="columnNames" select="$currentTableColumns/@name"/>
				<xsl:with-param name="columnTypes" select="$currentTableColumns/@nativeType"/>
				<xsl:with-param name="getPropertyNames" select="true()" />
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="fullColumnParams" select="exsl:node-set($fullColumnParamsFragment)/child::*"/>
		<xsl:variable name="columnParamsFragment">
			<xsl:for-each select="$fullColumnParams">
				<xsl:copy>
					<xsl:copy-of select="@*[not(namespace-uri())]|*"/>
				</xsl:copy>
			</xsl:for-each>
		</xsl:variable>
		<xsl:variable name="docCommentColumnParamsFragment">
			<xsl:for-each select="$fullColumnParams">
				<param name="{@name}">
					<xsl:value-of select="child::comment()"/>
				</param>
			</xsl:for-each>
		</xsl:variable>
		<xsl:variable name="classPrivateFieldsFragment">
			<xsl:for-each select="$fullColumnParams">
				<plx:field name="{@name}" visibility="private" dataTypeName="{@dataTypeName}"/>
			</xsl:for-each>
		</xsl:variable>
		<xsl:variable name="constructorInitializersFragment">
			<xsl:for-each select="$fullColumnParams">
				<plx:param name="{@name}" dataTypeName="{@dataTypeName}"/>
				<plx:assign>
					<plx:left>
						<plx:callThis name="{@name}" type="field"/>
					</plx:left>
					<plx:right>
						<plx:nameRef name="{@name}" type="parameter"/>
					</plx:right>
				</plx:assign>
			</xsl:for-each>
		</xsl:variable>
		<xsl:variable name="factoryInitializersFragment">
			<xsl:for-each select="$fullColumnParams">
				<plx:assign>
					<plx:left>
						<plx:callInstance name="{@tmp:propertyName}" type="property">
							<plx:callObject>
								<plx:nameRef name="new{@currentClass}"/>
							</plx:callObject>
						</plx:callInstance>
					</plx:left>
					<plx:right>
						<plx:nameRef name="{@name}" type="parameter"/>
					</plx:right>
				</plx:assign>
			</xsl:for-each>
		</xsl:variable>
		<xsl:variable name="allPropertiesFragment">
			<xsl:for-each select="$fullColumnParams">
				<plx:property name="{@tmp:propertyName}" visibility="public">
					<plx:attribute dataTypeName="XmlElementAttribute" dataTypeQualifier="System.Xml.Serialization">
						<plx:passParam>
							<plx:binaryOperator type="assignNamed">
								<plx:left>
									<plx:nameRef name="IsNullable" type="namedParameter"/>
								</plx:left>
								<plx:right>
									<plx:trueKeyword/>
								</plx:right>
							</plx:binaryOperator>
						</plx:passParam>
					</plx:attribute>
					<plx:returns dataTypeName="{@dataTypeName}"/>
					<plx:get>
						<plx:return>
							<plx:callThis name="{@name}" type="field"/>
						</plx:return>
					</plx:get>
					<plx:set>
						<plx:assign>
							<plx:left>
								<plx:callThis name="{@name}" type="field"/>
							</plx:left>
							<plx:right>
								<plx:nameRef name="value" type="parameter"/>
							</plx:right>
						</plx:assign>
					</plx:set>
				</plx:property>
			</xsl:for-each>
		</xsl:variable>
		<xsl:variable name="entityDataPKFragment">
			<xsl:call-template name="GetInstanceVariables">
				<xsl:with-param name="table" select="$currentTable"/>
				<xsl:with-param name="columnNames" select="$currentTableColumns/@name"/>
				<xsl:with-param name="columnTypes" select="$currentTableColumns/@nativeType"/>
				<xsl:with-param name="getPrimaryKeys" select="true()"/>
				<xsl:with-param name="getForeignKeys" select="false()"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="entityDataPK" select="exsl:node-set($entityDataPKFragment)/child::*"/>

		<xsl:variable name="entityDataNPKFragment">
			<xsl:call-template name="GetInstanceVariables">
				<xsl:with-param name="table" select="$currentTable"/>
				<xsl:with-param name="columnNames" select="$currentTableColumns/@name"/>
				<xsl:with-param name="columnTypes" select="$currentTableColumns/@nativeType"/>
				<xsl:with-param name="getPrimaryKeys" select="false()"/>
				<xsl:with-param name="getForeignKeys" select="false()"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="entityDataNPK" select="exsl:node-set($entityDataNPKFragment)/child::*"/>

		<xsl:variable name="entityDataFKFragment">
			<xsl:call-template name="GetInstanceVariables">
				<xsl:with-param name="table" select="$currentTable"/>
				<xsl:with-param name="columnNames" select="$currentTableColumns/@name"/>
				<xsl:with-param name="columnTypes" select="$currentTableColumns/@nativeType"/>
				<xsl:with-param name="getPrimaryKeys" select="false()"/>
				<xsl:with-param name="getForeignKeys" select="true()"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="entityDataFK" select="exsl:node-set($entityDataFKFragment)/child::*"/>

		<xsl:variable name="childCollectionFragment">
			<xsl:call-template name="GetChildCollection">
				<xsl:with-param name="table" select="$currentTable"/>
				<xsl:with-param name="allTables" select="$allTables"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="childCollection" select="exsl:node-set($childCollectionFragment)/child::*"/>

		<!-- START Entities.EntityView.cst -->
		<plx:pragma type="region" data="{@name} Class"/>
		<plx:class name="{@name}" visibility="public" partial="true">
			<plx:attribute dataTypeName="SerializableAttribute" dataTypeQualifier="System"/>
			<plx:attribute dataTypeName="CLSCompliantAttribute" dataTypeQualifier="System">
				<plx:passParam>
					<plx:trueKeyword/>
				</plx:passParam>
			</plx:attribute>
			<plx:derivesFromClass dataTypeName="{@name}Base"/>
			<plx:function name=".construct" visibility="public">
				<plx:initialize>
					<plx:callThis accessor="base" name=".implied" type="methodCall" />
				</plx:initialize>
			</plx:function>
		</plx:class>
		<plx:pragma type="closeRegion" data="{@name} Class"/>
		<!-- END Entities.EntityView.cst -->

		<!-- START Entities.Views.EntityViewBase.generated.cst -->
		<plx:class name="{@name}Base" visibility="public" modifier="abstract" partial="true">
			<plx:leadingInfo>
				<plx:docComment>
					<summary>
An object representation of the &lt;see cref="<xsl:value-of select="$currentClass"/>Base"&gt; view.
</summary>
				</plx:docComment>
			</plx:leadingInfo>
			<xsl:if test="$settings[@name='IncludeWCFDataAttributes']">
				<plx:attribute dataTypeName="DataContract"/>
			</xsl:if>
			<plx:attribute dataTypeName="SerializableAttribute" dataTypeQualifier="System"/>
			<plx:attribute dataTypeName="CLSCompliantAttribute" dataTypeQualifier="System">
				<plx:passParam>
					<plx:trueKeyword/>
				</plx:passParam>
			</plx:attribute>
			<plx:attribute dataTypeName="ToolboxItemAttribute" dataTypeQualifier="System.ComponentModel">
				<plx:passParam>
					<plx:string data="{$currentClass}Base"/>
				</plx:passParam>
			</plx:attribute>
			<plx:implementsInterface dataTypeName="IComparable" dataTypeQualifier="System"/>
			<plx:implementsInterface dataTypeName="ICloneable" dataTypeQualifier="System"/>
			<plx:implementsInterface dataTypeName="INotifyPropertyChanged"/>

			<plx:pragma type="region" data="Variable Declatrations"/>
			<plx:pragma type="closeRegion" data="Variable Declatrations"/>

			<plx:pragma type="region" data="Constructors"/>
			<plx:pragma type="closeRegion" data="Constructors"/>

			<plx:pragma type="region" data="Properties"/>
			<plx:pragma type="closeRegion" data="Properties"/>

			<plx:pragma type="region" data="Methods"/>
			<plx:pragma type="closeRegion" data="Methods"/>

			<!-- START Entities.EntityData.cst -->
			<plx:class name="{@name}EntityData" visibility="protectedAndInternal">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
The data structure representation of the &lt;see cref="<xsl:value-of select="@name"/>"&gt;
</summary>
						<remarks>
This struct is generated by a tool and should never be modified.
</remarks>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:attribute dataTypeName="EditorBrowsable" >
					<plx:passParam>
						<plx:callStatic name="Never" type="field" dataTypeName="EditorBrowsableState"/>
					</plx:passParam>
				</plx:attribute>
				<plx:attribute dataTypeName="Serializable"/>
				<plx:implementsInterface dataTypeName="ICloneable"/>
				<plx:field name="currentEntityState" visibility="private" dataTypeName="EntityState">
					<plx:initialize>
						<plx:callStatic name="Added" type="field" dataTypeName="EntityState"/>
					</plx:initialize>
				</plx:field>
				<plx:pragma type="region" data="Primary key(s)"/>
				<xsl:copy-of select="$entityDataPK"/>
				<plx:pragma type="closeRegion" data="Primary key(s)"/>
				<plx:pragma type="region" data="Non Primary key(s)"/>
				<xsl:copy-of select="$entityDataNPK"/>
				<plx:pragma type="closeRegion" data="Non Primary key(s)"/>
				<xsl:if test="$settings[@name='IncludeGetListByFK']">
					<plx:pragma type="region" data="Source Foreign Key Property"/>
					<xsl:copy-of select="$entityDataFK"/>
					<plx:pragma type="closeRegion" data="Source Foreign Key Property"/>
				</xsl:if>
				<plx:pragma type="region" data="Clone Method"/>
				<plx:function name="Clone" visibility="public">
					<plx:local name="_tmp" dataTypeName="{@name}EntityData">
						<plx:initialize>
							<plx:callNew dataTypeName="{@name}EntityData"/>
						</plx:initialize>
					</plx:local>

					<!-- START Primary key fields -->
					<!-- END Primary key fields -->

					<!-- START Non primary key fields -->
					<xsl:for-each select="se:columns/se:column[not(@name = current()/se:indexes/se:index/se:column/@ref)]">
						<plx:assign>
							<plx:left>
								<plx:callInstance name="{@name}" type="property">
									<plx:callObject>
										<plx:nameRef name="_tmp"/>
									</plx:callObject>
								</plx:callInstance>
							</plx:left>
							<plx:right>
								<plx:callThis name="{@name}" type="property"/>
							</plx:right>
						</plx:assign>
					</xsl:for-each>
					<!-- END Non primary key fields -->
					<plx:pragma type="region" data="Source Parent Composite Entities"/>
					<xsl:for-each select="se:keys/se:key">
						<plx:branch>
							<plx:condition>
								<plx:binaryOperator type="identityInequality">
									<plx:left>
										<plx:callThis name="{se:columnReference/@column}Source" type="property"/>
									</plx:left>
									<plx:right>
										<plx:nullKeyword/>
									</plx:right>
								</plx:binaryOperator>
							</plx:condition>
							<plx:assign>
								<plx:left>
									<plx:callInstance name="{se:columnReference/@column}Source" type="property">
										<plx:callObject>
											<plx:nameRef name="_tmp"/>
										</plx:callObject>
									</plx:callInstance>
								</plx:left>
								<plx:right>
									<plx:cast type="testCast" dataTypeName="{@targetTable}">
										<plx:callStatic name="MakeCopyOf" dataTypeName="this">
											<plx:passParam>
												<plx:callThis name="{se:columnReference/@column}Source" type="property"/>
											</plx:passParam>
										</plx:callStatic>
									</plx:cast>
								</plx:right>
							</plx:assign>
						</plx:branch>
					</xsl:for-each>
					<plx:pragma type="closeRegion" data="Source Parent Composite Entities"/>

					<plx:pragma type="region" data="Child Collections"/>
					<xsl:if test="$settings[@name='IncludeRelations']">
						<xsl:copy-of select="$childCollection"/>
					</xsl:if>
					<plx:pragma type="closeRegion" data="Child Collections"/>
					<plx:assign>
						<plx:left>
							<plx:callInstance name="EntityState" type="property">
								<plx:callObject>
									<plx:nameRef name="_tmp"/>
								</plx:callObject>
							</plx:callInstance>
						</plx:left>
						<plx:right>
							<plx:callThis name="EntityState" type="property"/>
						</plx:right>
					</plx:assign>
					<plx:return>
						<plx:nameRef name="_tmp" type="parameter"/>
					</plx:return>
				</plx:function>
				<plx:pragma type="closeRegion" data="Clone Method"/>
				<plx:property name="EntityState" visibility="public">
					<xsl:if test="$settings[@name='SerializeEntityState']">
						<plx:attribute dataTypeName="XmlIgnore"/>
					</xsl:if>
					<plx:attribute dataTypeName="Browsable">
						<plx:passParam>
							<plx:falseKeyword/>
						</plx:passParam>
					</plx:attribute>
					<plx:returns dataTypeName="EntityState"/>
					<plx:get>
						<plx:return>
							<plx:callThis name="currentEntityState" type="field"/>
						</plx:return>
					</plx:get>
					<plx:set>
						<plx:assign>
							<plx:left>
								<plx:callThis name="currentEntityState" type="field"/>
							</plx:left>
							<plx:right>
								<plx:nameRef name="value" type="parameter"/>
							</plx:right>
						</plx:assign>
					</plx:set>
				</plx:property>
			</plx:class>
			<!-- END Entities.EntityData.cst -->
		</plx:class>
		<!-- END Entities.Views.EntityViewBase.generated.cst -->
	</xsl:template>

	<xsl:template name="VList">
		<plx:class name="VList" visibility="public" xmlns:plx="http://schemas.neumont.edu/CodeGeneration/PLiX">
			<plx:attribute dataTypeName="SerializableAttribute" dataTypeQualifier="System"/>
			<plx:typeParam name="T"/>
			<plx:derivesFromClass dataTypeName="ListBase">
				<plx:passTypeParam dataTypeName="T"/>
			</plx:derivesFromClass>
			<plx:function name=".construct" visibility="public"/>
			<plx:function name=".construct" visibility="public">
				<plx:param name="existingList" dataTypeName="IList" dataTypeQualifier="System.Collections"/>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="identityInequality">
							<plx:left>
								<plx:nameRef name="existingList" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:nullKeyword/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:iterator localName="item" dataTypeName="T">
						<plx:initialize>
							<plx:nameRef name="existingList" type="parameter"/>
						</plx:initialize>
						<plx:branch>
							<plx:condition>
								<plx:binaryOperator type="identityInequality">
									<plx:left>
										<plx:nameRef name="item"/>
									</plx:left>
									<plx:right>
										<plx:nullKeyword/>
									</plx:right>
								</plx:binaryOperator>
							</plx:condition>
							<plx:callInstance name="Add">
								<plx:callObject>
									<plx:callThis name="Items" type="property" accessor="base"/>
								</plx:callObject>
								<plx:passParam>
									<plx:nameRef name="item"/>
								</plx:passParam>
							</plx:callInstance>
						</plx:branch>
					</plx:iterator>
				</plx:branch>
			</plx:function>
			<plx:function name="InsertItem" visibility="protected" modifier="override">
				<plx:param name="index" dataTypeName=".i4"/>
				<plx:param name="item" dataTypeName="T"/>
				<plx:callThis name="InsertItem" accessor="base">
					<plx:passParam>
						<plx:nameRef name="index" type="parameter"/>
					</plx:passParam>
					<plx:passParam>
						<plx:nameRef name="item" type="parameter"/>
					</plx:passParam>
				</plx:callThis>
			</plx:function>
			<plx:function name="RemoveItem" visibility="protected" modifier="override">
				<plx:param name="index" dataTypeName=".i4"/>
				<plx:callThis name="RemoveItem" accessor="base">
					<plx:passParam>
						<plx:nameRef name="index" type="parameter"/>
					</plx:passParam>
				</plx:callThis>
			</plx:function>
			<plx:function name="Clone" visibility="public" modifier="override">
				<plx:returns dataTypeName=".object"/>
				<plx:return>
					<plx:callThis name="Copy"/>
				</plx:return>
			</plx:function>
			<plx:function name="Copy" visibility="public" modifier="virtual">
				<plx:returns dataTypeName="VList">
					<plx:passTypeParam dataTypeName="T"/>
				</plx:returns>
				<plx:local name="copy" dataTypeName="VList">
					<plx:passTypeParam dataTypeName="T"/>
					<plx:initialize>
						<plx:callNew dataTypeName="VList">
							<plx:passTypeParam dataTypeName="T"/>
						</plx:callNew>
					</plx:initialize>
				</plx:local>
				<plx:iterator localName="item" dataTypeName="T">
					<plx:initialize>
						<plx:thisKeyword/>
					</plx:initialize>
					<plx:local name="itemCopy" dataTypeName="T">
						<plx:initialize>
							<plx:cast dataTypeName="T">
								<plx:callStatic name="MakeCopyOf" dataTypeName="ListBase">
									<plx:passTypeParam dataTypeName="T"/>
									<plx:passParam>
										<plx:nameRef name="item"/>
									</plx:passParam>
								</plx:callStatic>
							</plx:cast>
						</plx:initialize>
					</plx:local>
					<plx:callInstance name="Add">
						<plx:callObject>
							<plx:nameRef name="copy"/>
						</plx:callObject>
						<plx:passParam>
							<plx:nameRef name="itemCopy"/>
						</plx:passParam>
					</plx:callInstance>
				</plx:iterator>
				<plx:return>
					<plx:nameRef name="copy"/>
				</plx:return>
			</plx:function>
			<plx:function name="ForEach" visibility="public" modifier="static">
				<plx:typeParam name="U"/>
				<plx:param name="list" dataTypeName="VList">
					<plx:passTypeParam dataTypeName="U"/>
				</plx:param>
				<plx:param name="action" dataTypeName="Action" dataTypeQualifier="System">
					<plx:passTypeParam dataTypeName="U"/>
				</plx:param>
				<plx:callInstance name="ForEach">
					<plx:callObject>
						<plx:nameRef name="list" type="parameter"/>
					</plx:callObject>
					<plx:passParam>
						<plx:nameRef name="action" type="parameter"/>
					</plx:passParam>
				</plx:callInstance>
			</plx:function>
			<plx:function name="FindAll" visibility="public" modifier="virtual">
				<plx:param name="column" dataTypeName="Enum" dataTypeQualifier="System"/>
				<plx:param name="value" dataTypeName=".object"/>
				<plx:returns dataTypeName="VList">
					<plx:passTypeParam dataTypeName="T"/>
				</plx:returns>
				<plx:return>
					<plx:callThis name="FindAll">
						<plx:passParam>
							<plx:callInstance name="ToString">
								<plx:callObject>
									<plx:nameRef name="column" type="parameter"/>
								</plx:callObject>
							</plx:callInstance>
						</plx:passParam>
						<plx:passParam>
							<plx:nameRef name="value" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:trueKeyword/>
						</plx:passParam>
					</plx:callThis>
				</plx:return>
			</plx:function>
			<plx:function name="FindAll" visibility="public" modifier="virtual">
				<plx:param name="column" dataTypeName="Enum" dataTypeQualifier="System"/>
				<plx:param name="value" dataTypeName=".object"/>
				<plx:param name="ignoreCase" dataTypeName=".boolean"/>
				<plx:returns dataTypeName="VList">
					<plx:passTypeParam dataTypeName="T"/>
				</plx:returns>
				<plx:return>
					<plx:callThis name="FindAll">
						<plx:passParam>
							<plx:callInstance name="ToString">
								<plx:callObject>
									<plx:nameRef name="column" type="parameter"/>
								</plx:callObject>
							</plx:callInstance>
						</plx:passParam>
						<plx:passParam>
							<plx:nameRef name="value" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:nameRef name="ignoreCase" type="parameter"/>
						</plx:passParam>
					</plx:callThis>
				</plx:return>
			</plx:function>
			<plx:function name="FindAll" visibility="public" modifier="virtual">
				<plx:param name="propertyName" dataTypeName=".string"/>
				<plx:param name="value" dataTypeName=".object"/>
				<plx:returns dataTypeName="VList">
					<plx:passTypeParam dataTypeName="T"/>
				</plx:returns>
				<plx:return>
					<plx:callThis name="FindAll">
						<plx:passParam>
							<plx:nameRef name="propertyName" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:nameRef name="value" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:trueKeyword/>
						</plx:passParam>
					</plx:callThis>
				</plx:return>
			</plx:function>
			<plx:function name="FindAll" visibility="public" modifier="virtual">
				<plx:param name="propertyName" dataTypeName=".string"/>
				<plx:param name="value" dataTypeName=".object"/>
				<plx:param name="ignoreCase" dataTypeName=".boolean"/>
				<plx:returns dataTypeName="VList">
					<plx:passTypeParam dataTypeName="T"/>
				</plx:returns>
				<plx:local name="searchBy" dataTypeName="PropertyDescriptor" dataTypeQualifier="System.ComponentModel">
					<plx:initialize>
						<plx:callInstance name="Find">
							<plx:callObject>
								<plx:callStatic name="GetProperties" dataTypeName="TypeDescriptor" dataTypeQualifier="System.ComponentModel">
									<plx:passParam>
										<plx:typeOf dataTypeName="T"/>
									</plx:passParam>
								</plx:callStatic>
							</plx:callObject>
							<plx:passParam>
								<plx:nameRef name="propertyName" type="parameter"/>
							</plx:passParam>
							<plx:passParam>
								<plx:trueKeyword/>
							</plx:passParam>
						</plx:callInstance>
					</plx:initialize>
				</plx:local>
				<plx:local name="result" dataTypeName="VList">
					<plx:passTypeParam dataTypeName="T"/>
					<plx:initialize>
						<plx:callNew dataTypeName="VList">
							<plx:passTypeParam dataTypeName="T"/>
						</plx:callNew>
					</plx:initialize>
				</plx:local>
				<plx:local name="index" dataTypeName=".i4">
					<plx:initialize>
						<plx:value data="0" type="i4"/>
					</plx:initialize>
				</plx:local>
				<plx:loop>
					<plx:condition>
						<plx:binaryOperator type="greaterThan">
							<plx:left>
								<plx:nameRef name="index"/>
							</plx:left>
							<plx:right>
								<plx:value data="-1" type="i4"/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:assign>
						<plx:left>
							<plx:nameRef name="index"/>
						</plx:left>
						<plx:right>
							<plx:callThis name="FindCore">
								<plx:passParam>
									<plx:nameRef name="searchBy"/>
								</plx:passParam>
								<plx:passParam>
									<plx:nameRef name="value" type="parameter"/>
								</plx:passParam>
								<plx:passParam>
									<plx:nameRef name="index"/>
								</plx:passParam>
								<plx:passParam>
									<plx:nameRef name="ignoreCase" type="parameter"/>
								</plx:passParam>
							</plx:callThis>
						</plx:right>
					</plx:assign>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="greaterThan">
								<plx:left>
									<plx:nameRef name="index"/>
								</plx:left>
								<plx:right>
									<plx:value data="-1" type="i4"/>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:callInstance name="Add">
							<plx:callObject>
								<plx:nameRef name="result"/>
							</plx:callObject>
							<plx:passParam>
								<plx:callThis name=".implied" type="indexerCall" accessor="base">
									<plx:passParam>
										<plx:nameRef name="index"/>
									</plx:passParam>
								</plx:callThis>
							</plx:passParam>
						</plx:callInstance>
						<plx:increment>
							<plx:nameRef name="index"/>
						</plx:increment>
					</plx:branch>
				</plx:loop>
				<plx:return>
					<plx:nameRef name="result"/>
				</plx:return>
			</plx:function>
			<plx:function name="FindAllBy" visibility="public" modifier="virtual">
				<plx:param name="findAllByType" dataTypeName="FindAllByType" dataTypeQualifier="VList"/>
				<plx:param name="column" dataTypeName="Enum" dataTypeQualifier="System"/>
				<plx:param name="value" dataTypeName=".object"/>
				<plx:returns dataTypeName="VList">
					<plx:passTypeParam dataTypeName="T"/>
				</plx:returns>
				<plx:return>
					<plx:callThis name="FindAllBy">
						<plx:passParam>
							<plx:nameRef name="findAllByType" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:callInstance name="ToString">
								<plx:callObject>
									<plx:nameRef name="column" type="parameter"/>
								</plx:callObject>
							</plx:callInstance>
						</plx:passParam>
						<plx:passParam>
							<plx:nameRef name="value" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:trueKeyword/>
						</plx:passParam>
					</plx:callThis>
				</plx:return>
			</plx:function>
			<plx:function name="FindAllBy" visibility="public" modifier="virtual">
				<plx:param name="findAllByType" dataTypeName="FindAllByType" dataTypeQualifier="VList"/>
				<plx:param name="column" dataTypeName="Enum" dataTypeQualifier="System"/>
				<plx:param name="value" dataTypeName=".object"/>
				<plx:param name="ignoreCase" dataTypeName=".boolean"/>
				<plx:returns dataTypeName="VList">
					<plx:passTypeParam dataTypeName="T"/>
				</plx:returns>
				<plx:return>
					<plx:callThis name="FindAllBy">
						<plx:passParam>
							<plx:nameRef name="findAllByType" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:callInstance name="ToString">
								<plx:callObject>
									<plx:nameRef name="column" type="parameter"/>
								</plx:callObject>
							</plx:callInstance>
						</plx:passParam>
						<plx:passParam>
							<plx:nameRef name="value" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:nameRef name="ignoreCase" type="parameter"/>
						</plx:passParam>
					</plx:callThis>
				</plx:return>
			</plx:function>
			<plx:function name="FindAllBy" visibility="public" modifier="virtual">
				<plx:param name="findAllByType" dataTypeName="FindAllByType" dataTypeQualifier="VList"/>
				<plx:param name="propertyName" dataTypeName=".string"/>
				<plx:param name="value" dataTypeName=".object"/>
				<plx:returns dataTypeName="VList">
					<plx:passTypeParam dataTypeName="T"/>
				</plx:returns>
				<plx:return>
					<plx:callThis name="FindAllBy">
						<plx:passParam>
							<plx:nameRef name="findAllByType" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:nameRef name="propertyName" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:nameRef name="value" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:trueKeyword/>
						</plx:passParam>
					</plx:callThis>
				</plx:return>
			</plx:function>
			<plx:function name="FindAllBy" visibility="public" modifier="virtual">
				<plx:param name="findAllByType" dataTypeName="FindAllByType" dataTypeQualifier="VList"/>
				<plx:param name="propertyName" dataTypeName=".string"/>
				<plx:param name="value" dataTypeName=".object"/>
				<plx:param name="ignoreCase" dataTypeName=".boolean"/>
				<plx:returns dataTypeName="VList">
					<plx:passTypeParam dataTypeName="T"/>
				</plx:returns>
				<plx:local name="searchBy" dataTypeName="PropertyDescriptor" dataTypeQualifier="System.ComponentModel">
					<plx:initialize>
						<plx:callInstance name="Find">
							<plx:callObject>
								<plx:callThis name="PropertyCollection" type="property" accessor="base"/>
							</plx:callObject>
							<plx:passParam>
								<plx:nameRef name="propertyName" type="parameter"/>
							</plx:passParam>
							<plx:passParam>
								<plx:trueKeyword/>
							</plx:passParam>
						</plx:callInstance>
					</plx:initialize>
				</plx:local>
				<plx:local name="result" dataTypeName="VList">
					<plx:passTypeParam dataTypeName="T"/>
					<plx:initialize>
						<plx:callNew dataTypeName="VList">
							<plx:passTypeParam dataTypeName="T"/>
						</plx:callNew>
					</plx:initialize>
				</plx:local>
				<plx:local name="index" dataTypeName=".i4">
					<plx:initialize>
						<plx:value data="0" type="i4"/>
					</plx:initialize>
				</plx:local>
				<plx:loop>
					<plx:condition>
						<plx:binaryOperator type="greaterThan">
							<plx:left>
								<plx:nameRef name="index"/>
							</plx:left>
							<plx:right>
								<plx:value data="-1" type="i4"/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:assign>
						<plx:left>
							<plx:nameRef name="index"/>
						</plx:left>
						<plx:right>
							<plx:callThis name="FindAllBy">
								<plx:passParam>
									<plx:nameRef name="findAllByType" type="parameter"/>
								</plx:passParam>
								<plx:passParam>
									<plx:nameRef name="searchBy"/>
								</plx:passParam>
								<plx:passParam>
									<plx:nameRef name="value" type="parameter"/>
								</plx:passParam>
								<plx:passParam>
									<plx:nameRef name="index"/>
								</plx:passParam>
								<plx:passParam>
									<plx:nameRef name="ignoreCase" type="parameter"/>
								</plx:passParam>
							</plx:callThis>
						</plx:right>
					</plx:assign>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="greaterThan">
								<plx:left>
									<plx:nameRef name="index"/>
								</plx:left>
								<plx:right>
									<plx:value data="-1" type="i4"/>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:callInstance name="Add">
							<plx:callObject>
								<plx:nameRef name="result"/>
							</plx:callObject>
							<plx:passParam>
								<plx:callThis name=".implied" type="indexerCall" accessor="base">
									<plx:passParam>
										<plx:nameRef name="index"/>
									</plx:passParam>
								</plx:callThis>
							</plx:passParam>
						</plx:callInstance>
						<plx:increment>
							<plx:nameRef name="index"/>
						</plx:increment>
					</plx:branch>
				</plx:loop>
				<plx:return>
					<plx:nameRef name="result"/>
				</plx:return>
			</plx:function>
			<plx:function name="FindAllBy" visibility="protected" modifier="virtual">
				<plx:param name="findAllByType" dataTypeName="FindAllByType" dataTypeQualifier="VList"/>
				<plx:param name="prop" dataTypeName="PropertyDescriptor" dataTypeQualifier="System.ComponentModel"/>
				<plx:param name="key" dataTypeName=".object"/>
				<plx:param name="start" dataTypeName=".i4"/>
				<plx:param name="ignoreCase" dataTypeName=".boolean"/>
				<plx:returns dataTypeName=".i4"/>
				<plx:loop>
					<plx:initializeLoop>
						<plx:local name="i" dataTypeName=".i4">
							<plx:initialize>
								<plx:nameRef name="start" type="parameter"/>
							</plx:initialize>
						</plx:local>
					</plx:initializeLoop>
					<plx:condition>
						<plx:binaryOperator type="lessThan">
							<plx:left>
								<plx:nameRef name="i"/>
							</plx:left>
							<plx:right>
								<plx:callThis name="Count" type="property" accessor="base"/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:beforeLoop>
						<plx:increment>
							<plx:nameRef name="i"/>
						</plx:increment>
					</plx:beforeLoop>
					<plx:local name="item" dataTypeName="T">
						<plx:initialize>
							<plx:callThis name=".implied" type="indexerCall" accessor="base">
								<plx:passParam>
									<plx:nameRef name="i"/>
								</plx:passParam>
							</plx:callThis>
						</plx:initialize>
					</plx:local>
					<plx:local name="temp" dataTypeName=".object">
						<plx:initialize>
							<plx:callInstance name="GetValue">
								<plx:callObject>
									<plx:nameRef name="prop" type="parameter"/>
								</plx:callObject>
								<plx:passParam>
									<plx:nameRef name="item"/>
								</plx:passParam>
							</plx:callInstance>
						</plx:initialize>
					</plx:local>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="booleanAnd">
								<plx:left>
									<plx:binaryOperator type="identityEquality">
										<plx:left>
											<plx:nameRef name="key" type="parameter"/>
										</plx:left>
										<plx:right>
											<plx:nullKeyword/>
										</plx:right>
									</plx:binaryOperator>
								</plx:left>
								<plx:right>
									<plx:binaryOperator type="identityEquality">
										<plx:left>
											<plx:nameRef name="temp"/>
										</plx:left>
										<plx:right>
											<plx:nullKeyword/>
										</plx:right>
									</plx:binaryOperator>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:return>
							<plx:nameRef name="i"/>
						</plx:return>
					</plx:branch>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="typeEquality">
								<plx:left>
									<plx:nameRef name="temp"/>
								</plx:left>
								<plx:right>
									<plx:directTypeReference dataTypeName=".string"/>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:switch>
							<plx:condition>
								<plx:nameRef name="findAllByType" type="parameter"/>
							</plx:condition>
							<plx:case>
								<plx:condition>
									<plx:callStatic name="StartsWith" type="field" dataTypeName="FindAllByType" dataTypeQualifier="VList"/>
								</plx:condition>
								<plx:branch>
									<plx:condition>
										<plx:unaryOperator type="booleanNot">
											<plx:callInstance name="StartsWith">
												<plx:callObject>
													<plx:callInstance name="ToString">
														<plx:callObject>
															<plx:nameRef name="temp"/>
														</plx:callObject>
													</plx:callInstance>
												</plx:callObject>
												<plx:passParam>
													<plx:callInstance name="ToString">
														<plx:callObject>
															<plx:nameRef name="key" type="parameter"/>
														</plx:callObject>
													</plx:callInstance>
												</plx:passParam>
												<plx:passParam>
													<plx:inlineStatement dataTypeName="StringComparison" dataTypeQualifier="System">
														<plx:conditionalOperator>
															<plx:condition>
																<plx:nameRef name="ignoreCase" type="parameter"/>
															</plx:condition>
															<plx:left>
																<plx:callStatic name="CurrentCultureIgnoreCase" type="field" dataTypeName="StringComparison" dataTypeQualifier="System"/>
															</plx:left>
															<plx:right>
																<plx:callStatic name="CurrentCulture" type="field" dataTypeName="StringComparison" dataTypeQualifier="System"/>
															</plx:right>
														</plx:conditionalOperator>
													</plx:inlineStatement>
												</plx:passParam>
											</plx:callInstance>
										</plx:unaryOperator>
									</plx:condition>
									<plx:break/>
								</plx:branch>
								<plx:return>
									<plx:nameRef name="i"/>
								</plx:return>
							</plx:case>
							<plx:case>
								<plx:condition>
									<plx:callStatic name="EndsWith" type="field" dataTypeName="FindAllByType" dataTypeQualifier="VList"/>
								</plx:condition>
								<plx:branch>
									<plx:condition>
										<plx:unaryOperator type="booleanNot">
											<plx:callInstance name="EndsWith">
												<plx:callObject>
													<plx:callInstance name="ToString">
														<plx:callObject>
															<plx:nameRef name="temp"/>
														</plx:callObject>
													</plx:callInstance>
												</plx:callObject>
												<plx:passParam>
													<plx:callInstance name="ToString">
														<plx:callObject>
															<plx:nameRef name="key" type="parameter"/>
														</plx:callObject>
													</plx:callInstance>
												</plx:passParam>
												<plx:passParam>
													<plx:inlineStatement dataTypeName="StringComparison" dataTypeQualifier="System">
														<plx:conditionalOperator>
															<plx:condition>
																<plx:nameRef name="ignoreCase" type="parameter"/>
															</plx:condition>
															<plx:left>
																<plx:callStatic name="CurrentCultureIgnoreCase" type="field" dataTypeName="StringComparison" dataTypeQualifier="System"/>
															</plx:left>
															<plx:right>
																<plx:callStatic name="CurrentCulture" type="field" dataTypeName="StringComparison" dataTypeQualifier="System"/>
															</plx:right>
														</plx:conditionalOperator>
													</plx:inlineStatement>
												</plx:passParam>
											</plx:callInstance>
										</plx:unaryOperator>
									</plx:condition>
									<plx:break/>
								</plx:branch>
								<plx:return>
									<plx:nameRef name="i"/>
								</plx:return>
							</plx:case>
							<plx:case>
								<plx:condition>
									<plx:callStatic name="Contains" type="field" dataTypeName="FindAllByType" dataTypeQualifier="VList"/>
								</plx:condition>
								<plx:branch>
									<plx:condition>
										<plx:unaryOperator type="booleanNot">
											<plx:callInstance name="Contains">
												<plx:callObject>
													<plx:callInstance name="ToString">
														<plx:callObject>
															<plx:nameRef name="temp"/>
														</plx:callObject>
													</plx:callInstance>
												</plx:callObject>
												<plx:passParam>
													<plx:callInstance name="ToString">
														<plx:callObject>
															<plx:nameRef name="key" type="parameter"/>
														</plx:callObject>
													</plx:callInstance>
												</plx:passParam>
											</plx:callInstance>
										</plx:unaryOperator>
									</plx:condition>
									<plx:break/>
								</plx:branch>
								<plx:return>
									<plx:nameRef name="i"/>
								</plx:return>
							</plx:case>
						</plx:switch>
					</plx:branch>
					<plx:alternateBranch>
						<plx:condition>
							<plx:binaryOperator type="booleanAnd">
								<plx:left>
									<plx:binaryOperator type="identityInequality">
										<plx:left>
											<plx:nameRef name="temp"/>
										</plx:left>
										<plx:right>
											<plx:nullKeyword/>
										</plx:right>
									</plx:binaryOperator>
								</plx:left>
								<plx:right>
									<plx:callInstance name="Equals">
										<plx:callObject>
											<plx:nameRef name="temp"/>
										</plx:callObject>
										<plx:passParam>
											<plx:nameRef name="key" type="parameter"/>
										</plx:passParam>
									</plx:callInstance>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:return>
							<plx:nameRef name="i"/>
						</plx:return>
					</plx:alternateBranch>
				</plx:loop>
				<plx:return>
					<plx:value data="-1" type="i4"/>
				</plx:return>
			</plx:function>
			<plx:enum name="FindAllByType" visibility="public">
				<plx:attribute dataTypeName="SerializableAttribute" dataTypeQualifier="System"/>
				<plx:enumItem name="StartsWith">
					<plx:initialize>
						<plx:value data="0" type="i4"/>
					</plx:initialize>
				</plx:enumItem>
				<plx:enumItem name="EndsWith">
					<plx:initialize>
						<plx:value data="1" type="i4"/>
					</plx:initialize>
				</plx:enumItem>
				<plx:enumItem name="Contains">
					<plx:initialize>
						<plx:value data="2" type="i4"/>
					</plx:initialize>
				</plx:enumItem>
			</plx:enum>
		</plx:class>
	</xsl:template>

	<xsl:template name="GetChildCollection">
		<xsl:param name="table"/>
		<xsl:param name="allTables"/>
		<xsl:for-each select="$allTables/se:keys/se:key[@targetTable=$table/@name] | $table/se:keys/se:key">
			<plx:branch>
				<plx:condition>
					<plx:binaryOperator type="inequality">
						<plx:left>
							<plx:callThis type="field" name="{se:columnReference/@column}" accessor="this"/>
						</plx:left>
						<plx:right>
							<plx:nullKeyword/>
						</plx:right>
					</plx:binaryOperator>
				</plx:condition>
				<plx:assign>
					<xsl:choose>
						<xsl:when test="../../@name != $table/@name">
							<plx:left>
								<plx:callInstance name="{../../@name}Collection" type="property">
									<plx:callObject>
										<plx:nameRef name="_tmp"/>
									</plx:callObject>
								</plx:callInstance>
							</plx:left>
							<plx:right>
								<plx:cast dataTypeName="TList">
									<plx:passTypeParam dataTypeName="{../../@name}"/>
									<plx:callStatic name="MakeCopyOf" dataTypeName="this">
										<plx:passParam>
											<plx:callThis name="{../../@name}Collection" type="property"/>
										</plx:passParam>
									</plx:callStatic>
								</plx:cast>
							</plx:right>
						</xsl:when>
						<xsl:otherwise>
							<plx:left>
								<plx:callInstance name="{@targetTable}Collection" type="property">
									<plx:callObject>
										<plx:nameRef name="_tmp"/>
									</plx:callObject>
								</plx:callInstance>
							</plx:left>
							<plx:right>
								<plx:cast dataTypeName="TList">
									<plx:passTypeParam dataTypeName="{@targetTable}"/>
									<plx:callStatic name="MakeCopyOf" dataTypeName="this">
										<plx:passParam>
											<plx:callThis name="{@targetTable}Collection" type="property"/>
										</plx:passParam>
									</plx:callStatic>
								</plx:cast>
							</plx:right>
						</xsl:otherwise>
					</xsl:choose>
				</plx:assign>
			</plx:branch>
		</xsl:for-each>
	</xsl:template>

	<xsl:template name="GetInstanceVariables">
		<xsl:param name="table"/>
		<xsl:param name="columnNames"/>
		<xsl:param name="columnTypes"/>
		<xsl:param name="getPrimaryKeys" select="false()"/>
		<xsl:param name="getForeignKeys" select="false()"/>
		<xsl:choose>
			<xsl:when test="$getPrimaryKeys='true' or $getPrimaryKeys='1'">
				<xsl:for-each select="$table/se:indexes/se:index[@isPrimary='true' or @isPrimary='1']/se:column">
					<plx:field name="{csc:GetFieldNameForColumn($table/@owner, $table/@name, @ref)}" visibility="public" dataTypeName="{../../../se:columns/se:column[@name=current()/@ref]/@nativeType}"/>
				</xsl:for-each>
			</xsl:when>
			<xsl:when test="$getForeignKeys='true' or $getForeignKeys='1'">
				<xsl:for-each select="$table/se:keys/se:key">
					<plx:field name="_{csc:GetFieldNameForColumn($table/@owner, $table/@name, se:columnReference/@column)}Source" visibility="private" dataTypeName="{@targetTable}"/>
					<plx:property name="{se:columnReference/@column}Source" visibility="public" modifier="virtual">
						<plx:attribute dataTypeName="XmlIgnore"/>
						<plx:attribute dataTypeName="Browsable">
							<plx:passParam>
								<plx:falseKeyword/>
							</plx:passParam>
						</plx:attribute>
						<plx:returns dataTypeName=".boolean"/>
						<plx:get>
							<plx:return>
								<plx:callThis name="_{csc:GetFieldNameForColumn($table/@owner, $table/@name, se:columnReference/@column)}Source" type="field"/>
							</plx:return>
						</plx:get>
						<plx:set>
							<plx:assign>
								<plx:left>
									<plx:callThis name="_{csc:GetFieldNameForColumn($table/@owner, $table/@name, se:columnReference/@column)}Source" type="field"/>
								</plx:left>
								<plx:right>
									<plx:nameRef name="value" type="parameter"/>
								</plx:right>
							</plx:assign>
						</plx:set>
					</plx:property>
				</xsl:for-each>
			</xsl:when>
			<xsl:otherwise>
				<xsl:for-each select="$table/se:columns/se:column[not(@name = $table/se:indexes/se:index/se:column/@ref)]">
					<plx:field name="{csc:GetFieldNameForColumn($table/@owner, $table/@name, @name)}" visibility="public">
						<xsl:call-template name="ApplyPLiXDataType">
							<xsl:with-param name="nativeType" select="@nativeType"/>
							<xsl:with-param name="nullable" select="@nullable='true' or @nullable='1'"/>
						</xsl:call-template>
					</plx:field>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="GetColumnParams">
		<xsl:param name="table"/>
		<xsl:param name="columnNames"/>
		<xsl:param name="columnTypes"/>
		<xsl:param name="getPropertyNames" select="false()"/>
		<!-- Corresponds to GetFunctionHeaderParameters in .NETTiers source -->
		<xsl:variable name="tableColumns" select="$table/se:columns/se:column"/>
		<xsl:for-each select="$columnNames">
			<xsl:for-each select="$tableColumns[@name=current()]">
				<plx:param name="{csc:GetFieldNameForColumn($table/@owner, $table/@name, @name)}">
					<xsl:if test="$getPropertyNames='true' or $getPropertyNames='1'">
						<xsl:attribute name="tmp:propertyName">
							<xsl:value-of select="csc:GetPropertyNameForColumn($table/@owner, $table/@name, @name)"/>
						</xsl:attribute>
					</xsl:if>
					<xsl:call-template name="ApplyPLiXDataType">
						<xsl:with-param name="nativeType" select="@nativeType"/>
						<xsl:with-param name="nullable" select="@nullable='true' or @nullable='1'"/>
					</xsl:call-template>
					<xsl:comment>
						<xsl:value-of select="se:description"/>
					</xsl:comment>
				</plx:param>
			</xsl:for-each>
		</xsl:for-each>
	</xsl:template>

	<xsl:template name="ApplyPLiXDataType">
		<xsl:param name="nativeType"/>
		<xsl:param name="nullable" select="false()"/>
		<xsl:choose>
			<xsl:when test="$nullable">
				<xsl:variable name="passTypeParamFragment">
					<plx:passTypeParam>
						<xsl:call-template name="ApplyPLiXDataType">
							<xsl:with-param name="nativeType" select="$nativeType"/>
						</xsl:call-template>
					</plx:passTypeParam>
				</xsl:variable>
				<xsl:for-each select="exsl:node-set($passTypeParamFragment)/child::*">
					<xsl:choose>
						<xsl:when test="@dataTypeIsSimpleArray='1' or @dataTypeIsSimpleArray='true' or plx:arrayDescriptor or @dataTypeName='.string' or @dataTypeName='.object'">
							<xsl:copy-of select="@*"/>
							<xsl:copy-of select="child::*"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:attribute name="dataTypeName">
								<xsl:text>Nullable</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="dataTypeQualifier">
								<xsl:text>System</xsl:text>
							</xsl:attribute>
							<xsl:copy-of select="."/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="testType" select="string(@nativeType)"/>
				<xsl:choose>
					<xsl:when test="$testType='bigint'">
						<xsl:attribute name="dataTypeName">.i8</xsl:attribute>
					</xsl:when>
					<xsl:when test="$testType='binary'">
						<xsl:attribute name="dataTypeName">.object</xsl:attribute>
					</xsl:when>
					<xsl:when test="$testType='bit'">
						<xsl:attribute name="dataTypeName">.boolean</xsl:attribute>
					</xsl:when>
					<xsl:when test="$testType='char'">
						<xsl:attribute name="dataTypeName">.string</xsl:attribute>
					</xsl:when>
					<xsl:when test="$testType='character varying'">
						<xsl:attribute name="dataTypeName">.string</xsl:attribute>
					</xsl:when>
					<xsl:when test="$testType='datetime'">
						<xsl:attribute name="dataTypeName">.date</xsl:attribute>
					</xsl:when>
					<xsl:when test="$testType='decimal'">
						<xsl:attribute name="dataTypeName">.decimal</xsl:attribute>
					</xsl:when>
					<xsl:when test="$testType='double precision'">
						<xsl:attribute name="dataTypeName">.r8</xsl:attribute>
					</xsl:when>
					<xsl:when test="$testType='float'">
						<xsl:attribute name="dataTypeName">.r8</xsl:attribute>
					</xsl:when>
					<xsl:when test="$testType='image'">
						<xsl:attribute name="dataTypeName">.u1</xsl:attribute>
						<xsl:attribute name="dataTypeIsSimpleArray">true</xsl:attribute>
					</xsl:when>
					<xsl:when test="$testType='int'">
						<xsl:attribute name="dataTypeName">.i4</xsl:attribute>
					</xsl:when>
					<xsl:when test="$testType='integer'">
						<xsl:attribute name="dataTypeName">.i4</xsl:attribute>
					</xsl:when>
					<xsl:when test="$testType='interval'">
						<xsl:attribute name="dataTypeName">.date</xsl:attribute>
					</xsl:when>
					<xsl:when test="$testType='money'">
						<xsl:attribute name="dataTypeName">.decimal</xsl:attribute>
					</xsl:when>
					<xsl:when test="$testType='nchar'">
						<xsl:attribute name="dataTypeName">.string</xsl:attribute>
					</xsl:when>
					<xsl:when test="$testType='ntext'">
						<xsl:attribute name="dataTypeName">.string</xsl:attribute>
					</xsl:when>
					<xsl:when test="$testType='numeric'">
						<xsl:attribute name="dataTypeName">.decimal</xsl:attribute>
					</xsl:when>
					<xsl:when test="$testType='nvarchar'">
						<xsl:attribute name="dataTypeName">.string</xsl:attribute>
					</xsl:when>
					<xsl:when test="$testType='real'">
						<xsl:attribute name="dataTypeName">.r4</xsl:attribute>
					</xsl:when>
					<xsl:when test="$testType='smalldatetime'">
						<xsl:attribute name="dataTypeName">.date</xsl:attribute>
					</xsl:when>
					<xsl:when test="$testType='smallint'">
						<xsl:attribute name="dataTypeName">.i2</xsl:attribute>
					</xsl:when>
					<xsl:when test="$testType='smallmoney'">
						<xsl:attribute name="dataTypeName">.decimal</xsl:attribute>
					</xsl:when>
					<xsl:when test="$testType='text'">
						<xsl:attribute name="dataTypeName">.string</xsl:attribute>
					</xsl:when>
					<xsl:when test="$testType='timestamp'">
						<xsl:attribute name="dataTypeName">.u1</xsl:attribute>
						<xsl:attribute name="dataTypeIsSimpleArray">true</xsl:attribute>
					</xsl:when>
					<xsl:when test="$testType='tinyint'">
						<xsl:attribute name="dataTypeName">.i1</xsl:attribute>
					</xsl:when>
					<xsl:when test="$testType='uniqueidentifier'">
						<xsl:attribute name="dataTypeName">Guid</xsl:attribute>
						<xsl:attribute name="dataTypeQualifier">System</xsl:attribute>
					</xsl:when>
					<xsl:when test="$testType='varbinary'">
						<xsl:attribute name="dataTypeName">.u1</xsl:attribute>
						<xsl:attribute name="dataTypeIsSimpleArray">true</xsl:attribute>
					</xsl:when>
					<xsl:when test="$testType='varchar'">
						<xsl:attribute name="dataTypeName">.string</xsl:attribute>
					</xsl:when>
					<xsl:when test="$testType='xml'">
						<xsl:attribute name="dataTypeName">.string</xsl:attribute>
					</xsl:when>
					<xsl:when test="$testType='sql_variant'">
						<xsl:attribute name="dataTypeName">.object</xsl:attribute>
					</xsl:when>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="TList">
		<plx:class name="TList" visibility="public">
			<plx:leadingInfo>
				<plx:docComment>
					<summary>
Represents a strongly typed list of .netTiers table entity that can be accessed by index. 
Provides methods to search, sort, and manipulate lists.
</summary>
				</plx:docComment>
			</plx:leadingInfo>
			<plx:attribute dataTypeName="SerializableAttribute" dataTypeQualifier="System"/>
			<plx:typeParam name="T" requireDefaultConstructor="true">
				<plx:typeConstraint dataTypeName="IEntity"/>
			</plx:typeParam>
			<plx:derivesFromClass dataTypeName="ListBase">
				<plx:passTypeParam dataTypeName="T"/>
			</plx:derivesFromClass>
			<plx:field name="deletedItems" visibility="private" dataTypeName="List" dataTypeQualifier="System.Collections.Generic">
				<plx:passTypeParam dataTypeName="T"/>
			</plx:field>
			<plx:property name="IsDirty" visibility="public" modifier="virtual">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Indicates whether the collection was modified or not, and thus if it needs to be saved.
</summary>
						<returns>true is the collection needs to be saved; otherwise false.</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:returns dataTypeName=".boolean"/>
				<plx:get>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="greaterThan">
								<plx:left>
									<plx:callInstance name="Count" type="property">
										<plx:callObject>
											<plx:callThis name="DeletedItems" type="property"/>
										</plx:callObject>
									</plx:callInstance>
								</plx:left>
								<plx:right>
									<plx:value data="0" type="i4"/>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:return>
							<plx:trueKeyword/>
						</plx:return>
					</plx:branch>
					<plx:iterator localName="item" dataTypeName="T">
						<plx:initialize>
							<plx:thisKeyword/>
						</plx:initialize>
						<plx:branch>
							<plx:condition>
								<plx:binaryOperator type="inequality">
									<plx:left>
										<plx:callInstance name="EntityState" type="property">
											<plx:callObject>
												<plx:nameRef name="item"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:left>
									<plx:right>
										<plx:callStatic name="Unchanged" type="field" dataTypeName="EntityState"/>
									</plx:right>
								</plx:binaryOperator>
							</plx:condition>
							<plx:return>
								<plx:trueKeyword/>
							</plx:return>
						</plx:branch>
					</plx:iterator>
					<plx:return>
						<plx:falseKeyword/>
					</plx:return>
				</plx:get>
			</plx:property>
			<plx:property name="IsNewCount" visibility="public" modifier="virtual">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Returns the number of items that have been marked new in the collection.
</summary>
						<returns>the number of items that have been marked new in the collection</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:returns dataTypeName=".i4"/>
				<plx:get>
					<plx:local name="count" dataTypeName=".i4">
						<plx:initialize>
							<plx:value data="0" type="i4"/>
						</plx:initialize>
					</plx:local>
					<plx:iterator localName="item" dataTypeName="T">
						<plx:initialize>
							<plx:thisKeyword/>
						</plx:initialize>
						<plx:branch>
							<plx:condition>
								<plx:binaryOperator type="equality">
									<plx:left>
										<plx:callInstance name="EntityState" type="property">
											<plx:callObject>
												<plx:nameRef name="item"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:left>
									<plx:right>
										<plx:callStatic name="Added" type="field" dataTypeName="EntityState"/>
									</plx:right>
								</plx:binaryOperator>
							</plx:condition>
							<plx:increment>
								<plx:nameRef name="count"/>
							</plx:increment>
						</plx:branch>
					</plx:iterator>
					<plx:return>
						<plx:nameRef name="count"/>
					</plx:return>
				</plx:get>
			</plx:property>
			<plx:property name="IsDeletedCount" visibility="public" modifier="virtual">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Returns the number of items that have been marked to delete in the collection.
</summary>
						<returns>the number of items that have been marked for deletation in the collection</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:returns dataTypeName=".i4"/>
				<plx:get>
					<plx:return>
						<plx:callInstance name="Count" type="property">
							<plx:callObject>
								<plx:callThis name="DeletedItems" type="property"/>
							</plx:callObject>
						</plx:callInstance>
					</plx:return>
				</plx:get>
			</plx:property>
			<plx:property name="IsDirtyCount" visibility="public" modifier="virtual">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Returns the number of items that have been marked as modified in the collection.
</summary>
						<returns>the number of items that have been marked as modified in the collection</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:returns dataTypeName=".i4"/>
				<plx:get>
					<plx:local name="count" dataTypeName=".i4">
						<plx:initialize>
							<plx:value data="0" type="i4"/>
						</plx:initialize>
					</plx:local>
					<plx:iterator localName="item" dataTypeName="T">
						<plx:initialize>
							<plx:thisKeyword/>
						</plx:initialize>
						<plx:branch>
							<plx:condition>
								<plx:binaryOperator type="inequality">
									<plx:left>
										<plx:callInstance name="EntityState" type="property">
											<plx:callObject>
												<plx:nameRef name="item"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:left>
									<plx:right>
										<plx:callStatic name="Unchanged" type="field" dataTypeName="EntityState"/>
									</plx:right>
								</plx:binaryOperator>
							</plx:condition>
							<plx:increment>
								<plx:nameRef name="count"/>
							</plx:increment>
						</plx:branch>
					</plx:iterator>
					<plx:return>
						<plx:nameRef name="count"/>
					</plx:return>
				</plx:get>
			</plx:property>
			<plx:property name="IsValid" visibility="public" modifier="virtual">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Returns whether all items contained in the list.
</summary>
						<value>True if all items are valid; otherwise False.</value>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:returns dataTypeName=".boolean"/>
				<plx:get>
					<plx:iterator localName="item" dataTypeName="T">
						<plx:initialize>
							<plx:thisKeyword/>
						</plx:initialize>
						<plx:branch>
							<plx:condition>
								<plx:unaryOperator type="booleanNot">
									<plx:callInstance name="IsValid" type="property">
										<plx:callObject>
											<plx:nameRef name="item"/>
										</plx:callObject>
									</plx:callInstance>
								</plx:unaryOperator>
							</plx:condition>
							<plx:return>
								<plx:falseKeyword/>
							</plx:return>
						</plx:branch>
					</plx:iterator>
					<plx:return>
						<plx:trueKeyword/>
					</plx:return>
				</plx:get>
			</plx:property>
			<plx:property name="InvalidItems" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Returns a <see cref="T:System.Collections.Generic.List`1" /> object of invalid items.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:returns dataTypeName="List" dataTypeQualifier="System.Collections.Generic">
					<plx:passTypeParam dataTypeName="T"/>
				</plx:returns>
				<plx:get>
					<plx:local name="invalidItems" dataTypeName="List" dataTypeQualifier="System.Collections.Generic">
						<plx:passTypeParam dataTypeName="T"/>
						<plx:initialize>
							<plx:callNew dataTypeName="List" dataTypeQualifier="System.Collections.Generic">
								<plx:passTypeParam dataTypeName="T"/>
							</plx:callNew>
						</plx:initialize>
					</plx:local>
					<plx:iterator localName="item" dataTypeName="T">
						<plx:initialize>
							<plx:thisKeyword/>
						</plx:initialize>
						<plx:branch>
							<plx:condition>
								<plx:unaryOperator type="booleanNot">
									<plx:callInstance name="IsValid" type="property">
										<plx:callObject>
											<plx:nameRef name="item"/>
										</plx:callObject>
									</plx:callInstance>
								</plx:unaryOperator>
							</plx:condition>
							<plx:callInstance name="Add">
								<plx:callObject>
									<plx:nameRef name="invalidItems"/>
								</plx:callObject>
								<plx:passParam>
									<plx:nameRef name="item"/>
								</plx:passParam>
							</plx:callInstance>
						</plx:branch>
					</plx:iterator>
					<plx:return>
						<plx:nameRef name="invalidItems"/>
					</plx:return>
				</plx:get>
			</plx:property>
			<plx:property name="DeletedItems" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Hold a collection of item that we want to delete. they are removed from the main collection, so the databinding is working.
</summary>
						<remark>The save method will loop on this collection to delete item from the datasource.</remark>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:returns dataTypeName="List" dataTypeQualifier="System.Collections.Generic">
					<plx:passTypeParam dataTypeName="T"/>
				</plx:returns>
				<plx:get>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="identityEquality">
								<plx:left>
									<plx:callThis name="deletedItems" type="field"/>
								</plx:left>
								<plx:right>
									<plx:nullKeyword/>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:assign>
							<plx:left>
								<plx:callThis name="deletedItems" type="field"/>
							</plx:left>
							<plx:right>
								<plx:callNew dataTypeName="List" dataTypeQualifier="System.Collections.Generic">
									<plx:passTypeParam dataTypeName="T"/>
								</plx:callNew>
							</plx:right>
						</plx:assign>
					</plx:branch>
					<plx:return>
						<plx:callThis name="deletedItems" type="field"/>
					</plx:return>
				</plx:get>
			</plx:property>
			<plx:function name=".construct" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Initializes a new instance of the <see cref="T:TList{T}" /> class.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
			</plx:function>
			<plx:function name=".construct" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Initializes a new instance of the <see cref="T:TList{T}" /> class based on another list.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="existingList" dataTypeName="IList" dataTypeQualifier="System.Collections"/>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="identityInequality">
							<plx:left>
								<plx:nameRef name="existingList" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:nullKeyword/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:iterator localName="item" dataTypeName="T">
						<plx:initialize>
							<plx:nameRef name="existingList" type="parameter"/>
						</plx:initialize>
						<plx:branch>
							<plx:condition>
								<plx:binaryOperator type="identityInequality">
									<plx:left>
										<plx:nameRef name="item"/>
									</plx:left>
									<plx:right>
										<plx:nullKeyword/>
									</plx:right>
								</plx:binaryOperator>
							</plx:condition>
							<plx:callInstance name="Add">
								<plx:callObject>
									<plx:callThis name="Items" type="property"/>
								</plx:callObject>
								<plx:passParam>
									<plx:nameRef name="item"/>
								</plx:passParam>
							</plx:callInstance>
						</plx:branch>
					</plx:iterator>
				</plx:branch>
			</plx:function>
			<plx:function name="RemoveEntity" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Removes the entity item at the specified index and places it in the DeletedItems collection.
If this list were to be persisted, it would delete the entity from the repository.
</summary>
						<param name="index">The zero-based index of the item to remove.</param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="index" dataTypeName=".i4"/>
				<plx:callThis name="RemoveItem">
					<plx:passParam>
						<plx:nameRef name="index" type="parameter"/>
					</plx:passParam>
				</plx:callThis>
			</plx:function>
			<plx:function name="RemoveEntity" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Removes the entity item and places it in the DeletedItems collection.
If this list were to be persisted, it would delete the entity from the repository.
</summary>
						<param name="item">The entity to delete and place in DeletedItems collection.</param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="item" dataTypeName="T"/>
				<plx:callThis name="RemoveEntity">
					<plx:passParam>
						<plx:callInstance name="IndexOf">
							<plx:callObject>
								<plx:callThis name="Items" type="property"/>
							</plx:callObject>
							<plx:passParam>
								<plx:nameRef name="item" type="parameter"/>
							</plx:passParam>
						</plx:callInstance>
					</plx:passParam>
				</plx:callThis>
			</plx:function>
			<plx:function name="InsertItem" visibility="protected" modifier="override">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Inserts the specified item in the list at the specified index.
</summary>
						<param name="index">The zero-based index where the item is to be inserted.</param>
						<param name="item">The item to insert in the list.</param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="index" dataTypeName=".i4"/>
				<plx:param name="item" dataTypeName="T"/>
				<plx:assign>
					<plx:left>
						<plx:callInstance name="ParentCollection" type="property">
							<plx:callObject>
								<plx:nameRef name="item" type="parameter"/>
							</plx:callObject>
						</plx:callInstance>
					</plx:left>
					<plx:right>
						<plx:thisKeyword/>
					</plx:right>
				</plx:assign>
				<plx:callThis name="InsertItem" accessor="base">
					<plx:passParam>
						<plx:nameRef name="index" type="parameter"/>
					</plx:passParam>
					<plx:passParam>
						<plx:nameRef name="item" type="parameter"/>
					</plx:passParam>
				</plx:callThis>
			</plx:function>
			<plx:function name="RemoveItem" visibility="protected" modifier="override">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Removes the item at the specified index.
</summary>
						<param name="index">The zero-based index of the item to remove.</param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="index" dataTypeName=".i4"/>
				<plx:local name="item" dataTypeName="T">
					<plx:initialize>
						<plx:callInstance name=".implied" type="indexerCall">
							<plx:callObject>
								<plx:callThis name="Items" type="property"/>
							</plx:callObject>
							<plx:passParam>
								<plx:nameRef name="index" type="parameter"/>
							</plx:passParam>
						</plx:callInstance>
					</plx:initialize>
				</plx:local>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="identityInequality">
							<plx:left>
								<plx:nameRef name="item"/>
							</plx:left>
							<plx:right>
								<plx:nullKeyword/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="inequality">
								<plx:left>
									<plx:callInstance name="EntityState" type="property">
										<plx:callObject>
											<plx:nameRef name="item"/>
										</plx:callObject>
									</plx:callInstance>
								</plx:left>
								<plx:right>
									<plx:callStatic name="Added" type="field" dataTypeName="EntityState"/>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:callInstance name="MarkToDelete">
							<plx:callObject>
								<plx:nameRef name="item"/>
							</plx:callObject>
						</plx:callInstance>
						<plx:callInstance name="Add">
							<plx:callObject>
								<plx:callThis name="DeletedItems" type="property"/>
							</plx:callObject>
							<plx:passParam>
								<plx:nameRef name="item"/>
							</plx:passParam>
						</plx:callInstance>
					</plx:branch>
					<plx:callThis name="RemoveItem" accessor="base">
						<plx:passParam>
							<plx:nameRef name="index" type="parameter"/>
						</plx:passParam>
					</plx:callThis>
				</plx:branch>
			</plx:function>
			<plx:function name="Clone" visibility="public" modifier="override">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Creates an exact copy of this TList{T} instance.
</summary>
						<returns>The TList{T} object this method creates, cast as an object.</returns>
						<implements>&lt;see cref="M:System.ICloneable.Clone" /&gt;</implements>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:returns dataTypeName=".object"/>
				<plx:return>
					<plx:callThis name="Copy"/>
				</plx:return>
			</plx:function>
			<plx:function name="Copy" visibility="public" modifier="virtual">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Creates an exact copy of this TList{T} object.
</summary>
						<returns>A new, identical copy of the TList{T}.</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:returns dataTypeName="TList">
					<plx:passTypeParam dataTypeName="T"/>
				</plx:returns>
				<plx:local name="copy" dataTypeName="TList">
					<plx:passTypeParam dataTypeName="T"/>
					<plx:initialize>
						<plx:callNew dataTypeName="TList">
							<plx:passTypeParam dataTypeName="T"/>
						</plx:callNew>
					</plx:initialize>
				</plx:local>
				<plx:iterator localName="item" dataTypeName="T">
					<plx:initialize>
						<plx:thisKeyword/>
					</plx:initialize>
					<plx:local name="itemCopy" dataTypeName="T">
						<plx:initialize>
							<plx:cast dataTypeName="T">
								<plx:callStatic name="MakeCopyOf" dataTypeName="ListBase">
									<plx:passTypeParam dataTypeName="T"/>
									<plx:passParam>
										<plx:nameRef name="item"/>
									</plx:passParam>
								</plx:callStatic>
							</plx:cast>
						</plx:initialize>
					</plx:local>
					<plx:callInstance name="Add">
						<plx:callObject>
							<plx:nameRef name="copy"/>
						</plx:callObject>
						<plx:passParam>
							<plx:nameRef name="itemCopy"/>
						</plx:passParam>
					</plx:callInstance>
				</plx:iterator>
				<plx:return>
					<plx:nameRef name="copy"/>
				</plx:return>
			</plx:function>
			<plx:function name="AcceptChanges" visibility="public" modifier="virtual">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Accepts the changes made to underlyting entities.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:loop>
					<plx:initializeLoop>
						<plx:local name="i" dataTypeName=".i4">
							<plx:initialize>
								<plx:value data="0" type="i4"/>
							</plx:initialize>
						</plx:local>
					</plx:initializeLoop>
					<plx:condition>
						<plx:binaryOperator type="lessThan">
							<plx:left>
								<plx:nameRef name="i"/>
							</plx:left>
							<plx:right>
								<plx:callThis name="Count" type="property"/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:beforeLoop>
						<plx:increment>
							<plx:nameRef name="i"/>
						</plx:increment>
					</plx:beforeLoop>
					<plx:callInstance name="AcceptChanges">
						<plx:callObject>
							<plx:callThis name=".implied" type="indexerCall">
								<plx:passParam>
									<plx:nameRef name="i"/>
								</plx:passParam>
							</plx:callThis>
						</plx:callObject>
					</plx:callInstance>
				</plx:loop>
			</plx:function>
			<plx:function name="CopyTo" visibility="public" modifier="virtual">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Adds the data in this collection to another collection
</summary>
						<param name="copyTo"></param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="copyTo" dataTypeName="TList">
					<plx:passTypeParam dataTypeName="T"/>
				</plx:param>
				<plx:local name="alreadySeenItem" dataTypeName="ArrayList" dataTypeQualifier="System.Collections">
					<plx:initialize>
						<plx:callNew dataTypeName="ArrayList" dataTypeQualifier="System.Collections"/>
					</plx:initialize>
				</plx:local>
				<plx:iterator localName="item" dataTypeName="T">
					<plx:initialize>
						<plx:nameRef name="copyTo"/>
					</plx:initialize>
					<plx:callInstance name="Add">
						<plx:callObject>
							<plx:nameRef name="alreadySeenItem"/>
						</plx:callObject>
						<plx:passParam>
							<plx:callInstance name="ToString">
								<plx:callObject>
									<plx:nameRef name="item"/>
								</plx:callObject>
							</plx:callInstance>
						</plx:passParam>
					</plx:callInstance>
				</plx:iterator>
				<plx:iterator localName="item" dataTypeName="T">
					<plx:initialize>
						<plx:thisKeyword/>
					</plx:initialize>
					<plx:local name="itemCopy" dataTypeName="T">
						<plx:initialize>
							<plx:cast dataTypeName="T">
								<plx:callStatic name="MakeCopyOf" dataTypeName="ListBase">
									<plx:passTypeParam dataTypeName="T"/>
									<plx:passParam>
										<plx:nameRef name="item"/>
									</plx:passParam>
								</plx:callStatic>
							</plx:cast>
						</plx:initialize>
					</plx:local>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="lessThan">
								<plx:left>
									<plx:callInstance name="IndexOf">
										<plx:callObject>
											<plx:nameRef name="alreadySeenItem"/>
										</plx:callObject>
										<plx:passParam>
											<plx:callInstance name="ToString">
												<plx:callObject>
													<plx:nameRef name="itemCopy"/>
												</plx:callObject>
											</plx:callInstance>
										</plx:passParam>
									</plx:callInstance>
								</plx:left>
								<plx:right>
									<plx:value data="0" type="i4"/>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:callInstance name="Add">
							<plx:callObject>
								<plx:nameRef name="copyTo" type="parameter"/>
							</plx:callObject>
							<plx:passParam>
								<plx:nameRef name="itemCopy"/>
							</plx:passParam>
						</plx:callInstance>
					</plx:branch>
				</plx:iterator>
			</plx:function>
			<plx:function name="ForEach" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Performs the specified action on each element of the specified array.
</summary>
						<param name="list">The list.</param>
						<param name="action">The action.</param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:typeParam name="U" requireDefaultConstructor="true">
					<plx:typeConstraint dataTypeName="IEntity"/>
				</plx:typeParam>
				<plx:param name="list" dataTypeName="TList">
					<plx:passTypeParam dataTypeName="U"/>
				</plx:param>
				<plx:param name="action" dataTypeName="Action" dataTypeQualifier="System">
					<plx:passTypeParam dataTypeName="U"/>
				</plx:param>
				<plx:callInstance name="ForEach">
					<plx:callObject>
						<plx:nameRef name="list" type="parameter"/>
					</plx:callObject>
					<plx:passParam>
						<plx:nameRef name="action" type="parameter"/>
					</plx:passParam>
				</plx:callInstance>
			</plx:function>
			<plx:function name="GetRange" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Gets the range
</summary>
						<param name="index">The index.</param>
						<param name="count">The count.</param>
						<returns></returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="index" dataTypeName=".i4"/>
				<plx:param name="count" dataTypeName=".i4"/>
				<plx:returns dataTypeName="TList">
					<plx:passTypeParam dataTypeName="T"/>
				</plx:returns>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="booleanOr">
							<plx:left>
								<plx:binaryOperator type="lessThan">
									<plx:left>
										<plx:nameRef name="index" type="parameter"/>
									</plx:left>
									<plx:right>
										<plx:value data="0" type="i4"/>
									</plx:right>
								</plx:binaryOperator>
							</plx:left>
							<plx:right>
								<plx:binaryOperator type="lessThan">
									<plx:left>
										<plx:nameRef name="count" type="parameter"/>
									</plx:left>
									<plx:right>
										<plx:value data="0" type="i4"/>
									</plx:right>
								</plx:binaryOperator>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:throw>
						<plx:callNew dataTypeName="ArgumentOutOfRangeException" dataTypeQualifier="System">
							<plx:passParam>
								<plx:inlineStatement dataTypeName=".string">
									<plx:conditionalOperator>
										<plx:condition>
											<plx:binaryOperator type="lessThan">
												<plx:left>
													<plx:nameRef name="index" type="parameter"/>
												</plx:left>
												<plx:right>
													<plx:value data="0" type="i4"/>
												</plx:right>
											</plx:binaryOperator>
										</plx:condition>
										<plx:left>
											<plx:string>index</plx:string>
										</plx:left>
										<plx:right>
											<plx:string>count</plx:string>
										</plx:right>
									</plx:conditionalOperator>
								</plx:inlineStatement>
							</plx:passParam>
							<plx:passParam>
								<plx:string>ArgumentOutOfRange_NeedNonNegNum</plx:string>
							</plx:passParam>
						</plx:callNew>
					</plx:throw>
				</plx:branch>
				<plx:local name="list1" dataTypeName="TList">
					<plx:passTypeParam dataTypeName="T"/>
					<plx:initialize>
						<plx:callNew dataTypeName="TList">
							<plx:passTypeParam dataTypeName="T"/>
						</plx:callNew>
					</plx:initialize>
				</plx:local>
				<plx:loop>
					<plx:initializeLoop>
						<plx:local name="i" dataTypeName=".i4">
							<plx:initialize>
								<plx:nameRef name="index" type="parameter"/>
							</plx:initialize>
						</plx:local>
					</plx:initializeLoop>
					<plx:condition>
						<plx:binaryOperator type="booleanAnd">
							<plx:left>
								<plx:binaryOperator type="lessThan">
									<plx:left>
										<plx:nameRef name="i"/>
									</plx:left>
									<plx:right>
										<plx:binaryOperator type="add">
											<plx:left>
												<plx:nameRef name="index" type="parameter"/>
											</plx:left>
											<plx:right>
												<plx:nameRef name="count" type="parameter"/>
											</plx:right>
										</plx:binaryOperator>
									</plx:right>
								</plx:binaryOperator>
							</plx:left>
							<plx:right>
								<plx:binaryOperator type="lessThan">
									<plx:left>
										<plx:nameRef name="i"/>
									</plx:left>
									<plx:right>
										<plx:callThis name="Count" type="property"/>
									</plx:right>
								</plx:binaryOperator>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:beforeLoop>
						<plx:increment>
							<plx:nameRef name="i"/>
						</plx:increment>
					</plx:beforeLoop>
					<plx:callInstance name="Add">
						<plx:callObject>
							<plx:nameRef name="list1"/>
						</plx:callObject>
						<plx:passParam>
							<plx:callInstance name=".implied" type="indexerCall">
								<plx:callObject>
									<plx:callThis name="Items" type="property"/>
								</plx:callObject>
								<plx:passParam>
									<plx:nameRef name="i"/>
								</plx:passParam>
							</plx:callInstance>
						</plx:passParam>
					</plx:callInstance>
				</plx:loop>
				<plx:return>
					<plx:nameRef name="list1"/>
				</plx:return>
			</plx:function>
			<plx:function name="FindAll" visibility="public" modifier="virtual">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Finds a collection of <see cref="T:Tiers.AdventureWorks.Entities.IEntity" /> objects in the current list matching the search criteria.
</summary>
						<param name="column">Property of the object to search, given as a value of the 'Entity'Columns enum.</param>
						<param name="value">Value to find.</param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="column" dataTypeName="Enum" dataTypeQualifier="System"/>
				<plx:param name="value" dataTypeName=".object"/>
				<plx:returns dataTypeName="TList">
					<plx:passTypeParam dataTypeName="T"/>
				</plx:returns>
				<plx:return>
					<plx:callThis name="FindAll">
						<plx:passParam>
							<plx:callInstance name="ToString">
								<plx:callObject>
									<plx:nameRef name="column" type="parameter"/>
								</plx:callObject>
							</plx:callInstance>
						</plx:passParam>
						<plx:passParam>
							<plx:nameRef name="value" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:trueKeyword/>
						</plx:passParam>
					</plx:callThis>
				</plx:return>
			</plx:function>
			<plx:function name="FindAll" visibility="public" modifier="virtual">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Finds a collection of <see cref="T:Tiers.AdventureWorks.Entities.IEntity" /> objects in the current list matching the search criteria.
</summary>
						<param name="column">Property of the object to search, given as a value of the 'Entity'Columns enum.</param>
						<param name="value">Value to find.</param>
						<param name="ignoreCase">A Boolean indicating a case-sensitive or insensitive comparison (true indicates a case-insensitive comparison).  String properties only.</param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="column" dataTypeName="Enum" dataTypeQualifier="System"/>
				<plx:param name="value" dataTypeName=".object"/>
				<plx:param name="ignoreCase" dataTypeName=".boolean"/>
				<plx:returns dataTypeName="TList">
					<plx:passTypeParam dataTypeName="T"/>
				</plx:returns>
				<plx:return>
					<plx:callThis name="FindAll">
						<plx:passParam>
							<plx:callInstance name="ToString">
								<plx:callObject>
									<plx:nameRef name="column" type="parameter"/>
								</plx:callObject>
							</plx:callInstance>
						</plx:passParam>
						<plx:passParam>
							<plx:nameRef name="value" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:nameRef name="ignoreCase" type="parameter"/>
						</plx:passParam>
					</plx:callThis>
				</plx:return>
			</plx:function>
			<plx:function name="FindAll" visibility="public" modifier="virtual">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Finds a collection of <see cref="T:Tiers.AdventureWorks.Entities.IEntity" /> objects in the current list matching the search criteria.
</summary>
						<param name="propertyName">Property of the object to search.</param>
						<param name="value">Value to find.</param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="propertyName" dataTypeName=".string"/>
				<plx:param name="value" dataTypeName=".object"/>
				<plx:returns dataTypeName="TList">
					<plx:passTypeParam dataTypeName="T"/>
				</plx:returns>
				<plx:return>
					<plx:callThis name="FindAll">
						<plx:passParam>
							<plx:nameRef name="propertyName" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:nameRef name="value" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:trueKeyword/>
						</plx:passParam>
					</plx:callThis>
				</plx:return>
			</plx:function>
			<plx:function name="FindAll" visibility="public" modifier="virtual">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Finds a collection of <see cref="T:Tiers.AdventureWorks.Entities.IEntity" /> objects in the current list matching the search criteria.
</summary>
						<param name="propertyName">Property of the object to search.</param>
						<param name="value">Value to find.</param>
						<param name="ignoreCase">A Boolean indicating a case-sensitive or insensitive comparison (true indicates a case-insensitive comparison).  String properties only.</param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="propertyName" dataTypeName=".string"/>
				<plx:param name="value" dataTypeName=".object"/>
				<plx:param name="ignoreCase" dataTypeName=".boolean"/>
				<plx:returns dataTypeName="TList">
					<plx:passTypeParam dataTypeName="T"/>
				</plx:returns>
				<plx:local name="searchBy" dataTypeName="PropertyDescriptor" dataTypeQualifier="System.ComponentModel">
					<plx:initialize>
						<plx:callInstance name="Find">
							<plx:callObject>
								<plx:callStatic name="GetProperties" dataTypeName="TypeDescriptor" dataTypeQualifier="System.ComponentModel">
									<plx:passParam>
										<plx:typeOf dataTypeName="T"/>
									</plx:passParam>
								</plx:callStatic>
							</plx:callObject>
							<plx:passParam>
								<plx:nameRef name="propertyName" type="parameter"/>
							</plx:passParam>
							<plx:passParam>
								<plx:trueKeyword/>
							</plx:passParam>
						</plx:callInstance>
					</plx:initialize>
				</plx:local>
				<plx:local name="result" dataTypeName="TList">
					<plx:passTypeParam dataTypeName="T"/>
					<plx:initialize>
						<plx:callNew dataTypeName="TList">
							<plx:passTypeParam dataTypeName="T"/>
						</plx:callNew>
					</plx:initialize>
				</plx:local>
				<plx:local name="index" dataTypeName=".i4">
					<plx:initialize>
						<plx:value data="0" type="i4"/>
					</plx:initialize>
				</plx:local>
				<plx:loop>
					<plx:condition>
						<plx:binaryOperator type="greaterThan">
							<plx:left>
								<plx:nameRef name="index"/>
							</plx:left>
							<plx:right>
								<plx:value data="-1" type="i4"/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:assign>
						<plx:left>
							<plx:nameRef name="index"/>
						</plx:left>
						<plx:right>
							<plx:callThis name="FindCore">
								<plx:passParam>
									<plx:nameRef name="searchBy"/>
								</plx:passParam>
								<plx:passParam>
									<plx:nameRef name="value" type="parameter"/>
								</plx:passParam>
								<plx:passParam>
									<plx:nameRef name="index"/>
								</plx:passParam>
								<plx:passParam>
									<plx:nameRef name="ignoreCase" type="parameter"/>
								</plx:passParam>
							</plx:callThis>
						</plx:right>
					</plx:assign>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="greaterThan">
								<plx:left>
									<plx:nameRef name="index"/>
								</plx:left>
								<plx:right>
									<plx:value data="-1" type="i4"/>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:callInstance name="Add">
							<plx:callObject>
								<plx:nameRef name="result"/>
							</plx:callObject>
							<plx:passParam>
								<plx:callThis name=".implied" type="indexerCall">
									<plx:passParam>
										<plx:nameRef name="index"/>
									</plx:passParam>
								</plx:callThis>
							</plx:passParam>
						</plx:callInstance>
						<plx:increment>
							<plx:nameRef name="index"/>
						</plx:increment>
					</plx:branch>
				</plx:loop>
				<plx:return>
					<plx:nameRef name="result"/>
				</plx:return>
			</plx:function>
			<plx:function name="FindAll" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Retrieves the all the elements that match the conditions defined by the specified predicate.
</summary>
						<param name="match">The <see cref="T:System.Predicate`1"></see> delegate that defines the conditions of the elements to search for.</param>
						<returns>
A <see cref="T:TList{T}"></see> containing all the elements that match the conditions defined by the specified predicate, if found; otherwise, an empty <see cref="T:TList{T}"></see>.
</returns>
						<exception cref="T:System.ArgumentNullException">match is null.</exception>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="match" dataTypeName="Predicate" dataTypeQualifier="System">
					<plx:passTypeParam dataTypeName="T"/>
				</plx:param>
				<plx:returns dataTypeName="TList">
					<plx:passTypeParam dataTypeName="T"/>
				</plx:returns>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="identityEquality">
							<plx:left>
								<plx:nameRef name="match" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:nullKeyword/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:throw>
						<plx:callNew dataTypeName="ArgumentNullException" dataTypeQualifier="System">
							<plx:passParam>
								<plx:string>match</plx:string>
							</plx:passParam>
						</plx:callNew>
					</plx:throw>
				</plx:branch>
				<plx:local name="result" dataTypeName="TList">
					<plx:passTypeParam dataTypeName="T"/>
					<plx:initialize>
						<plx:callNew dataTypeName="TList">
							<plx:passTypeParam dataTypeName="T"/>
						</plx:callNew>
					</plx:initialize>
				</plx:local>
				<plx:iterator localName="item" dataTypeName="T">
					<plx:initialize>
						<plx:callThis name="Items" type="property"/>
					</plx:initialize>
					<plx:branch>
						<plx:condition>
							<plx:callInstance name=".implied" type="delegateCall">
								<plx:callObject>
									<plx:nameRef name="match" type="parameter"/>
								</plx:callObject>
								<plx:passParam>
									<plx:nameRef name="item"/>
								</plx:passParam>
							</plx:callInstance>
						</plx:condition>
						<plx:callInstance name="Add">
							<plx:callObject>
								<plx:nameRef name="result"/>
							</plx:callObject>
							<plx:passParam>
								<plx:nameRef name="item"/>
							</plx:passParam>
						</plx:callInstance>
					</plx:branch>
				</plx:iterator>
				<plx:return>
					<plx:nameRef name="result"/>
				</plx:return>
			</plx:function>
			<plx:function name="Exists" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Determines whether the <see cref="T:TList{T}"></see> contains elements that match the conditions defined by the specified predicate.
</summary>
						<param name="match">The <see cref="T:System.Predicate`1"></see> delegate that defines the conditions of the elements to search for.</param>
						<returns>
true if the <see cref="T:TList{T}"></see> contains one or more elements that match the conditions defined by the specified predicate; otherwise, false.
</returns>
						<exception cref="T:System.ArgumentNullException">match is null.</exception>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="match" dataTypeName="Predicate" dataTypeQualifier="System">
					<plx:passTypeParam dataTypeName="T"/>
				</plx:param>
				<plx:returns dataTypeName=".boolean"/>
				<plx:return>
					<plx:binaryOperator type="inequality">
						<plx:left>
							<plx:callThis name="FindIndex">
								<plx:passParam>
									<plx:nameRef name="match" type="parameter"/>
								</plx:passParam>
							</plx:callThis>
						</plx:left>
						<plx:right>
							<plx:value data="-1" type="i4"/>
						</plx:right>
					</plx:binaryOperator>
				</plx:return>
			</plx:function>
			<plx:function name="FindIndex" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Searches for an element that matches the conditions defined by the specified predicate, and returns the zero-based index of the first occurrence within the entire <see cref="T:TList{T}"></see>.
</summary>
						<param name="match">The <see cref="T:System.Predicate`1"></see> delegate that defines the conditions of the element to search for.</param>
						<returns>
The zero-based index of the first occurrence of an element that matches the conditions defined by match, if found; otherwise, 1.
</returns>
						<exception cref="T:System.ArgumentNullException">match is null.</exception>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="match" dataTypeName="Predicate" dataTypeQualifier="System">
					<plx:passTypeParam dataTypeName="T"/>
				</plx:param>
				<plx:returns dataTypeName=".i4"/>
				<plx:return>
					<plx:callThis name="FindIndex">
						<plx:passParam>
							<plx:value data="0" type="i4"/>
						</plx:passParam>
						<plx:passParam>
							<plx:callThis name="Count" type="property"/>
						</plx:passParam>
						<plx:passParam>
							<plx:nameRef name="match" type="parameter"/>
						</plx:passParam>
					</plx:callThis>
				</plx:return>
			</plx:function>
			<plx:function name="FindIndex" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Searches for an element that matches the conditions defined by the specified predicate, and returns the zero-based index of the first occurrence within the range of elements in the <see cref="T:TList{T}"></see> that extends from the specified index to the last element.
</summary>
						<param name="startIndex">The zero-based starting index of the search.</param>
						<param name="match">The <see cref="T:System.Predicate`1"></see> delegate that defines the conditions of the element to search for.</param>
						<returns>
The zero-based index of the first occurrence of an element that matches the conditions defined by match, if found; otherwise, 1.
</returns>
						<exception cref="T:System.ArgumentOutOfRangeException">startIndex is outside the range of valid indexes for the <see cref="T:TList{T}"></see>.</exception>
						<exception cref="T:System.ArgumentNullException">match is null.</exception>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="startIndex" dataTypeName=".i4"/>
				<plx:param name="match" dataTypeName="Predicate" dataTypeQualifier="System">
					<plx:passTypeParam dataTypeName="T"/>
				</plx:param>
				<plx:returns dataTypeName=".i4"/>
				<plx:return>
					<plx:callThis name="FindIndex">
						<plx:passParam>
							<plx:nameRef name="startIndex" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:binaryOperator type="subtract">
								<plx:left>
									<plx:callThis name="Count" type="property"/>
								</plx:left>
								<plx:right>
									<plx:nameRef name="startIndex" type="parameter"/>
								</plx:right>
							</plx:binaryOperator>
						</plx:passParam>
						<plx:passParam>
							<plx:nameRef name="match" type="parameter"/>
						</plx:passParam>
					</plx:callThis>
				</plx:return>
			</plx:function>
			<plx:function name="FindIndex" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Searches for an element that matches the conditions defined by the specified predicate, and returns the zero-based index of the first occurrence within the range of elements in the <see cref="T:TList{T}"></see> that starts at the specified index and contains the specified number of elements.
</summary>
						<param name="startIndex">The zero-based starting index of the search.</param>
						<param name="count">The number of elements in the section to search.</param>
						<param name="match">The <see cref="T:System.Predicate`1"></see> delegate that defines the conditions of the element to search for.</param>
						<returns>
The zero-based index of the first occurrence of an element that matches the conditions defined by match, if found; otherwise, 1.
</returns>
						<exception cref="T:System.ArgumentOutOfRangeException">startIndex is outside the range of valid indexes for the <see cref="T:TList{T}"></see>.-or-count is less than 0.-or-startIndex and count do not specify a valid section in the <see cref="T:TList{T}"></see>.</exception>
						<exception cref="T:System.ArgumentNullException">match is null.</exception>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="startIndex" dataTypeName=".i4"/>
				<plx:param name="count" dataTypeName=".i4"/>
				<plx:param name="match" dataTypeName="Predicate" dataTypeQualifier="System">
					<plx:passTypeParam dataTypeName="T"/>
				</plx:param>
				<plx:returns dataTypeName=".i4"/>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="greaterThan">
							<plx:left>
								<plx:nameRef name="startIndex" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:callThis name="Count" type="property"/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:throw>
						<plx:callNew dataTypeName="ArgumentOutOfRangeException" dataTypeQualifier="System">
							<plx:passParam>
								<plx:string>startIndex</plx:string>
							</plx:passParam>
							<plx:passParam>
								<plx:string>index is out of range</plx:string>
							</plx:passParam>
						</plx:callNew>
					</plx:throw>
				</plx:branch>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="booleanOr">
							<plx:left>
								<plx:binaryOperator type="lessThan">
									<plx:left>
										<plx:nameRef name="count" type="parameter"/>
									</plx:left>
									<plx:right>
										<plx:value data="0" type="i4"/>
									</plx:right>
								</plx:binaryOperator>
							</plx:left>
							<plx:right>
								<plx:binaryOperator type="greaterThan">
									<plx:left>
										<plx:nameRef name="startIndex" type="parameter"/>
									</plx:left>
									<plx:right>
										<plx:binaryOperator type="subtract">
											<plx:left>
												<plx:callThis name="Count" type="property"/>
											</plx:left>
											<plx:right>
												<plx:nameRef name="count" type="parameter"/>
											</plx:right>
										</plx:binaryOperator>
									</plx:right>
								</plx:binaryOperator>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:throw>
						<plx:callNew dataTypeName="ArgumentOutOfRangeException" dataTypeQualifier="System">
							<plx:passParam>
								<plx:string>count</plx:string>
							</plx:passParam>
							<plx:passParam>
								<plx:string>count is out of range</plx:string>
							</plx:passParam>
						</plx:callNew>
					</plx:throw>
				</plx:branch>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="identityEquality">
							<plx:left>
								<plx:nameRef name="match" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:nullKeyword/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:throw>
						<plx:callNew dataTypeName="ArgumentNullException" dataTypeQualifier="System">
							<plx:passParam>
								<plx:string>match</plx:string>
							</plx:passParam>
						</plx:callNew>
					</plx:throw>
				</plx:branch>
				<plx:local name="num1" dataTypeName=".i4">
					<plx:initialize>
						<plx:binaryOperator type="add">
							<plx:left>
								<plx:nameRef name="startIndex" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:nameRef name="count" type="parameter"/>
							</plx:right>
						</plx:binaryOperator>
					</plx:initialize>
				</plx:local>
				<plx:loop>
					<plx:initializeLoop>
						<plx:local name="num2" dataTypeName=".i4">
							<plx:initialize>
								<plx:nameRef name="startIndex" type="parameter"/>
							</plx:initialize>
						</plx:local>
					</plx:initializeLoop>
					<plx:condition>
						<plx:binaryOperator type="lessThan">
							<plx:left>
								<plx:nameRef name="num2"/>
							</plx:left>
							<plx:right>
								<plx:nameRef name="num1"/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:beforeLoop>
						<plx:increment>
							<plx:nameRef name="num2"/>
						</plx:increment>
					</plx:beforeLoop>
					<plx:branch>
						<plx:condition>
							<plx:callInstance name=".implied" type="delegateCall">
								<plx:callObject>
									<plx:nameRef name="match" type="parameter"/>
								</plx:callObject>
								<plx:passParam>
									<plx:callThis name=".implied" type="indexerCall">
										<plx:passParam>
											<plx:nameRef name="num2"/>
										</plx:passParam>
									</plx:callThis>
								</plx:passParam>
							</plx:callInstance>
						</plx:condition>
						<plx:return>
							<plx:nameRef name="num2"/>
						</plx:return>
					</plx:branch>
				</plx:loop>
				<plx:return>
					<plx:value data="-1" type="i4"/>
				</plx:return>
			</plx:function>
			<plx:function name="FindAllBy" visibility="public" modifier="virtual">
				<plx:param name="findAllByType" dataTypeName="FindAllByType" dataTypeQualifier="TList"/>
				<plx:param name="column" dataTypeName="Enum" dataTypeQualifier="System"/>
				<plx:param name="value" dataTypeName=".object"/>
				<plx:returns dataTypeName="TList">
					<plx:passTypeParam dataTypeName="T"/>
				</plx:returns>
				<plx:return>
					<plx:callThis name="FindAllBy">
						<plx:passParam>
							<plx:nameRef name="findAllByType" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:callInstance name="ToString">
								<plx:callObject>
									<plx:nameRef name="column" type="parameter"/>
								</plx:callObject>
							</plx:callInstance>
						</plx:passParam>
						<plx:passParam>
							<plx:nameRef name="value" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:trueKeyword/>
						</plx:passParam>
					</plx:callThis>
				</plx:return>
			</plx:function>
			<plx:function name="FindAllBy" visibility="public" modifier="virtual">
				<plx:param name="findAllByType" dataTypeName="FindAllByType" dataTypeQualifier="TList"/>
				<plx:param name="column" dataTypeName="Enum" dataTypeQualifier="System"/>
				<plx:param name="value" dataTypeName=".object"/>
				<plx:param name="ignoreCase" dataTypeName=".boolean"/>
				<plx:returns dataTypeName="TList">
					<plx:passTypeParam dataTypeName="T"/>
				</plx:returns>
				<plx:return>
					<plx:callThis name="FindAllBy">
						<plx:passParam>
							<plx:nameRef name="findAllByType" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:callInstance name="ToString">
								<plx:callObject>
									<plx:nameRef name="column" type="parameter"/>
								</plx:callObject>
							</plx:callInstance>
						</plx:passParam>
						<plx:passParam>
							<plx:nameRef name="value" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:nameRef name="ignoreCase" type="parameter"/>
						</plx:passParam>
					</plx:callThis>
				</plx:return>
			</plx:function>
			<plx:function name="FindAllBy" visibility="public" modifier="virtual">
				<plx:param name="findAllByType" dataTypeName="FindAllByType" dataTypeQualifier="TList"/>
				<plx:param name="propertyName" dataTypeName=".string"/>
				<plx:param name="value" dataTypeName=".object"/>
				<plx:returns dataTypeName="TList">
					<plx:passTypeParam dataTypeName="T"/>
				</plx:returns>
				<plx:return>
					<plx:callThis name="FindAllBy">
						<plx:passParam>
							<plx:nameRef name="findAllByType" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:nameRef name="propertyName" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:nameRef name="value" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:trueKeyword/>
						</plx:passParam>
					</plx:callThis>
				</plx:return>
			</plx:function>
			<plx:function name="FindAllBy" visibility="public" modifier="virtual">
				<plx:param name="findAllByType" dataTypeName="FindAllByType" dataTypeQualifier="TList"/>
				<plx:param name="propertyName" dataTypeName=".string"/>
				<plx:param name="value" dataTypeName=".object"/>
				<plx:param name="ignoreCase" dataTypeName=".boolean"/>
				<plx:returns dataTypeName="TList">
					<plx:passTypeParam dataTypeName="T"/>
				</plx:returns>
				<plx:local name="searchBy" dataTypeName="PropertyDescriptor" dataTypeQualifier="System.ComponentModel">
					<plx:initialize>
						<plx:callInstance name="Find">
							<plx:callObject>
								<plx:callThis name="PropertyCollection" type="property" accessor="base"/>
							</plx:callObject>
							<plx:passParam>
								<plx:nameRef name="propertyName" type="parameter"/>
							</plx:passParam>
							<plx:passParam>
								<plx:trueKeyword/>
							</plx:passParam>
						</plx:callInstance>
					</plx:initialize>
				</plx:local>
				<plx:local name="result" dataTypeName="TList">
					<plx:passTypeParam dataTypeName="T"/>
					<plx:initialize>
						<plx:callNew dataTypeName="TList">
							<plx:passTypeParam dataTypeName="T"/>
						</plx:callNew>
					</plx:initialize>
				</plx:local>
				<plx:local name="index" dataTypeName=".i4">
					<plx:initialize>
						<plx:value data="0" type="i4"/>
					</plx:initialize>
				</plx:local>
				<plx:loop>
					<plx:condition>
						<plx:binaryOperator type="greaterThan">
							<plx:left>
								<plx:nameRef name="index"/>
							</plx:left>
							<plx:right>
								<plx:value data="-1" type="i4"/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:assign>
						<plx:left>
							<plx:nameRef name="index"/>
						</plx:left>
						<plx:right>
							<plx:callThis name="FindAllBy">
								<plx:passParam>
									<plx:nameRef name="findAllByType" type="parameter"/>
								</plx:passParam>
								<plx:passParam>
									<plx:nameRef name="searchBy"/>
								</plx:passParam>
								<plx:passParam>
									<plx:nameRef name="value" type="parameter"/>
								</plx:passParam>
								<plx:passParam>
									<plx:nameRef name="index"/>
								</plx:passParam>
								<plx:passParam>
									<plx:nameRef name="ignoreCase" type="parameter"/>
								</plx:passParam>
							</plx:callThis>
						</plx:right>
					</plx:assign>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="greaterThan">
								<plx:left>
									<plx:nameRef name="index"/>
								</plx:left>
								<plx:right>
									<plx:value data="-1" type="i4"/>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:callInstance name="Add">
							<plx:callObject>
								<plx:nameRef name="result"/>
							</plx:callObject>
							<plx:passParam>
								<plx:callThis name=".implied" type="indexerCall">
									<plx:passParam>
										<plx:nameRef name="index"/>
									</plx:passParam>
								</plx:callThis>
							</plx:passParam>
						</plx:callInstance>
						<plx:increment>
							<plx:nameRef name="index"/>
						</plx:increment>
					</plx:branch>
				</plx:loop>
				<plx:return>
					<plx:nameRef name="result"/>
				</plx:return>
			</plx:function>
			<plx:function name="FindAllBy" visibility="protected" modifier="virtual">
				<plx:param name="findAllByType" dataTypeName="FindAllByType" dataTypeQualifier="TList"/>
				<plx:param name="prop" dataTypeName="PropertyDescriptor" dataTypeQualifier="System.ComponentModel"/>
				<plx:param name="key" dataTypeName=".object"/>
				<plx:param name="start" dataTypeName=".i4"/>
				<plx:param name="ignoreCase" dataTypeName=".boolean"/>
				<plx:returns dataTypeName=".i4"/>
				<plx:loop>
					<plx:initializeLoop>
						<plx:local name="i" dataTypeName=".i4">
							<plx:initialize>
								<plx:nameRef name="start" type="parameter"/>
							</plx:initialize>
						</plx:local>
					</plx:initializeLoop>
					<plx:condition>
						<plx:binaryOperator type="lessThan">
							<plx:left>
								<plx:nameRef name="i"/>
							</plx:left>
							<plx:right>
								<plx:callThis name="Count" type="property"/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:beforeLoop>
						<plx:increment>
							<plx:nameRef name="i"/>
						</plx:increment>
					</plx:beforeLoop>
					<plx:local name="item" dataTypeName="T">
						<plx:initialize>
							<plx:callThis name=".implied" type="indexerCall">
								<plx:passParam>
									<plx:nameRef name="i"/>
								</plx:passParam>
							</plx:callThis>
						</plx:initialize>
					</plx:local>
					<plx:local name="temp" dataTypeName=".object">
						<plx:initialize>
							<plx:callInstance name="GetValue">
								<plx:callObject>
									<plx:nameRef name="prop" type="parameter"/>
								</plx:callObject>
								<plx:passParam>
									<plx:nameRef name="item"/>
								</plx:passParam>
							</plx:callInstance>
						</plx:initialize>
					</plx:local>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="booleanAnd">
								<plx:left>
									<plx:binaryOperator type="identityEquality">
										<plx:left>
											<plx:nameRef name="key" type="parameter"/>
										</plx:left>
										<plx:right>
											<plx:nullKeyword/>
										</plx:right>
									</plx:binaryOperator>
								</plx:left>
								<plx:right>
									<plx:binaryOperator type="identityEquality">
										<plx:left>
											<plx:nameRef name="temp"/>
										</plx:left>
										<plx:right>
											<plx:nullKeyword/>
										</plx:right>
									</plx:binaryOperator>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:return>
							<plx:nameRef name="i"/>
						</plx:return>
					</plx:branch>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="typeEquality">
								<plx:left>
									<plx:nameRef name="temp"/>
								</plx:left>
								<plx:right>
									<plx:directTypeReference dataTypeName=".string"/>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:switch>
							<plx:condition>
								<plx:nameRef name="findAllByType" type="parameter"/>
							</plx:condition>
							<plx:case>
								<plx:condition>
									<plx:callStatic name="StartsWith" type="field" dataTypeName="FindAllByType" dataTypeQualifier="TList"/>
								</plx:condition>
								<plx:branch>
									<plx:condition>
										<plx:unaryOperator type="booleanNot">
											<plx:callInstance name="StartsWith">
												<plx:callObject>
													<plx:callInstance name="ToString">
														<plx:callObject>
															<plx:nameRef name="temp"/>
														</plx:callObject>
													</plx:callInstance>
												</plx:callObject>
												<plx:passParam>
													<plx:callInstance name="ToString">
														<plx:callObject>
															<plx:nameRef name="key" type="parameter"/>
														</plx:callObject>
													</plx:callInstance>
												</plx:passParam>
												<plx:passParam>
													<plx:inlineStatement dataTypeName="StringComparison" dataTypeQualifier="System">
														<plx:conditionalOperator>
															<plx:condition>
																<plx:nameRef name="ignoreCase" type="parameter"/>
															</plx:condition>
															<plx:left>
																<plx:callStatic name="CurrentCultureIgnoreCase" type="field" dataTypeName="StringComparison" dataTypeQualifier="System"/>
															</plx:left>
															<plx:right>
																<plx:callStatic name="CurrentCulture" type="field" dataTypeName="StringComparison" dataTypeQualifier="System"/>
															</plx:right>
														</plx:conditionalOperator>
													</plx:inlineStatement>
												</plx:passParam>
											</plx:callInstance>
										</plx:unaryOperator>
									</plx:condition>
									<plx:break/>
								</plx:branch>
								<plx:return>
									<plx:nameRef name="i"/>
								</plx:return>
							</plx:case>
							<plx:case>
								<plx:condition>
									<plx:callStatic name="EndsWith" type="field" dataTypeName="FindAllByType" dataTypeQualifier="TList"/>
								</plx:condition>
								<plx:branch>
									<plx:condition>
										<plx:unaryOperator type="booleanNot">
											<plx:callInstance name="EndsWith">
												<plx:callObject>
													<plx:callInstance name="ToString">
														<plx:callObject>
															<plx:nameRef name="temp"/>
														</plx:callObject>
													</plx:callInstance>
												</plx:callObject>
												<plx:passParam>
													<plx:callInstance name="ToString">
														<plx:callObject>
															<plx:nameRef name="key" type="parameter"/>
														</plx:callObject>
													</plx:callInstance>
												</plx:passParam>
												<plx:passParam>
													<plx:inlineStatement dataTypeName="StringComparison" dataTypeQualifier="System">
														<plx:conditionalOperator>
															<plx:condition>
																<plx:nameRef name="ignoreCase" type="parameter"/>
															</plx:condition>
															<plx:left>
																<plx:callStatic name="CurrentCultureIgnoreCase" type="field" dataTypeName="StringComparison" dataTypeQualifier="System"/>
															</plx:left>
															<plx:right>
																<plx:callStatic name="CurrentCulture" type="field" dataTypeName="StringComparison" dataTypeQualifier="System"/>
															</plx:right>
														</plx:conditionalOperator>
													</plx:inlineStatement>
												</plx:passParam>
											</plx:callInstance>
										</plx:unaryOperator>
									</plx:condition>
									<plx:break/>
								</plx:branch>
								<plx:return>
									<plx:nameRef name="i"/>
								</plx:return>
							</plx:case>
							<plx:case>
								<plx:condition>
									<plx:callStatic name="Contains" type="field" dataTypeName="FindAllByType" dataTypeQualifier="TList"/>
								</plx:condition>
								<plx:branch>
									<plx:condition>
										<plx:binaryOperator type="lessThan">
											<plx:left>
												<plx:callInstance name="IndexOf">
													<plx:callObject>
														<plx:callInstance name="ToString">
															<plx:callObject>
																<plx:nameRef name="temp"/>
															</plx:callObject>
														</plx:callInstance>
													</plx:callObject>
													<plx:passParam>
														<plx:callInstance name="ToString">
															<plx:callObject>
																<plx:nameRef name="key" type="parameter"/>
															</plx:callObject>
														</plx:callInstance>
													</plx:passParam>
													<plx:passParam>
														<plx:inlineStatement dataTypeName="StringComparison" dataTypeQualifier="System">
															<plx:conditionalOperator>
																<plx:condition>
																	<plx:nameRef name="ignoreCase" type="parameter"/>
																</plx:condition>
																<plx:left>
																	<plx:callStatic name="CurrentCultureIgnoreCase" type="field" dataTypeName="StringComparison" dataTypeQualifier="System"/>
																</plx:left>
																<plx:right>
																	<plx:callStatic name="CurrentCulture" type="field" dataTypeName="StringComparison" dataTypeQualifier="System"/>
																</plx:right>
															</plx:conditionalOperator>
														</plx:inlineStatement>
													</plx:passParam>
												</plx:callInstance>
											</plx:left>
											<plx:right>
												<plx:value data="0" type="i4"/>
											</plx:right>
										</plx:binaryOperator>
									</plx:condition>
									<plx:break/>
								</plx:branch>
								<plx:return>
									<plx:nameRef name="i"/>
								</plx:return>
							</plx:case>
						</plx:switch>
					</plx:branch>
					<plx:alternateBranch>
						<plx:condition>
							<plx:binaryOperator type="booleanAnd">
								<plx:left>
									<plx:binaryOperator type="identityInequality">
										<plx:left>
											<plx:nameRef name="temp"/>
										</plx:left>
										<plx:right>
											<plx:nullKeyword/>
										</plx:right>
									</plx:binaryOperator>
								</plx:left>
								<plx:right>
									<plx:callInstance name="Equals">
										<plx:callObject>
											<plx:nameRef name="temp"/>
										</plx:callObject>
										<plx:passParam>
											<plx:nameRef name="key" type="parameter"/>
										</plx:passParam>
									</plx:callInstance>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:return>
							<plx:nameRef name="i"/>
						</plx:return>
					</plx:alternateBranch>
				</plx:loop>
				<plx:return>
					<plx:value data="-1" type="i4"/>
				</plx:return>
			</plx:function>
			<plx:enum name="FindAllByType" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Used by FindAllBy method for easy searching.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:attribute dataTypeName="SerializableAttribute" dataTypeQualifier="System"/>
				<plx:enumItem name="StartsWith">
					<plx:leadingInfo>
						<plx:docComment>
							<summary>
Starts with Value in List
</summary>
						</plx:docComment>
					</plx:leadingInfo>
					<plx:initialize>
						<plx:value data="0" type="i4"/>
					</plx:initialize>
				</plx:enumItem>
				<plx:enumItem name="EndsWith">
					<plx:leadingInfo>
						<plx:docComment>
							<summary>
Ends with Value in List
</summary>
						</plx:docComment>
					</plx:leadingInfo>
					<plx:initialize>
						<plx:value data="1" type="i4"/>
					</plx:initialize>
				</plx:enumItem>
				<plx:enumItem name="Contains">
					<plx:leadingInfo>
						<plx:docComment>
							<summary>
Contains Value in List
</summary>
						</plx:docComment>
					</plx:leadingInfo>
					<plx:initialize>
						<plx:value data="2" type="i4"/>
					</plx:initialize>
				</plx:enumItem>
			</plx:enum>
		</plx:class>
	</xsl:template>
	<xsl:template name="ListBase">
		<plx:class name="ListBase" visibility="public" modifier="abstract">
			<plx:leadingInfo>
				<plx:docComment>
					<summary>
A abstract generic base class for the nettiers entities that are generated from tables and views. 
Supports filtering, databinding, searching and sorting.
</summary>
				</plx:docComment>
			</plx:leadingInfo>
			<plx:attribute dataTypeName="SerializableAttribute" dataTypeQualifier="System"/>
			<plx:typeParam name="T"/>
			<plx:derivesFromClass dataTypeName="BindingList" dataTypeQualifier="System.ComponentModel">
				<plx:passTypeParam dataTypeName="T"/>
			</plx:derivesFromClass>
			<plx:implementsInterface dataTypeName="IBindingListView" dataTypeQualifier="System.ComponentModel"/>
			<plx:implementsInterface dataTypeName="IBindingList" dataTypeQualifier="System.ComponentModel"/>
			<plx:implementsInterface dataTypeName="IList" dataTypeQualifier="System.Collections"/>
			<plx:implementsInterface dataTypeName="ICollection" dataTypeQualifier="System.Collections"/>
			<plx:implementsInterface dataTypeName="IEnumerable" dataTypeQualifier="System.Collections"/>
			<plx:implementsInterface dataTypeName="ICloneable" dataTypeQualifier="System"/>
			<plx:implementsInterface dataTypeName="IListSource" dataTypeQualifier="System.ComponentModel"/>
			<plx:implementsInterface dataTypeName="ITypedList" dataTypeQualifier="System.ComponentModel"/>
			<plx:implementsInterface dataTypeName="IComponent" dataTypeQualifier="System.ComponentModel"/>
			<plx:implementsInterface dataTypeName="IDisposable" dataTypeQualifier="System"/>
			<plx:implementsInterface dataTypeName="IRaiseItemChangedEvents" dataTypeQualifier="System.ComponentModel"/>
			<plx:implementsInterface dataTypeName="IDeserializationCallback" dataTypeQualifier="System.Runtime.Serialization"/>
			<plx:function name=".construct" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Initializes a new instance of the <see cref="T:TList{T}" /> class.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:initialize>
					<plx:callThis name=".implied" accessor="base"/>
				</plx:initialize>
				<plx:callThis name="InitializeList"/>
			</plx:function>
			<plx:field name="_OriginalList" visibility="private" dataTypeName="List" dataTypeQualifier="System.Collections.Generic">
				<plx:passTypeParam dataTypeName="T"/>
				<plx:initialize>
					<plx:callNew dataTypeName="List" dataTypeQualifier="System.Collections.Generic">
						<plx:passTypeParam dataTypeName="T"/>
					</plx:callNew>
				</plx:initialize>
			</plx:field>
			<plx:field name="_isSorted" visibility="private" dataTypeName=".boolean">
				<plx:initialize>
					<plx:falseKeyword/>
				</plx:initialize>
			</plx:field>
			<plx:field name="_sortProperty" visibility="private" dataTypeName="PropertyDescriptor" dataTypeQualifier="System.ComponentModel">
				<plx:attribute dataTypeName="NonSerializedAttribute" dataTypeQualifier="System"/>
			</plx:field>
			<plx:field name="_sortDirection" visibility="private" dataTypeName="ListSortDirection" dataTypeQualifier="System.ComponentModel">
				<plx:initialize>
					<plx:callStatic dataTypeName="ListSortDirection" type="field" name="Descending"/>
				</plx:initialize>
			</plx:field>
			<plx:field name="_sortDescriptions" visibility="private" dataTypeName="ListSortDescriptionCollection" dataTypeQualifier="System.ComponentModel">
				<plx:attribute dataTypeName="NonSerializedAttribute" dataTypeQualifier="System"/>
				<plx:initialize>
					<plx:callNew dataTypeName="ListSortDescriptionCollection" dataTypeQualifier="System.ComponentModel"/>
				</plx:initialize>
			</plx:field>
			<plx:field name="_filterString" visibility="private" dataTypeName=".string">
				<plx:initialize>
					<plx:nullKeyword/>
				</plx:initialize>
			</plx:field>
			<plx:field name="excludedItems" visibility="private" dataTypeName="List" dataTypeQualifier="System.Collections.Generic">
				<plx:passTypeParam dataTypeName="T"/>
				<plx:initialize>
					<plx:callNew dataTypeName="List" dataTypeQualifier="System.Collections.Generic">
						<plx:passTypeParam dataTypeName="T"/>
					</plx:callNew>
				</plx:initialize>
			</plx:field>
			<plx:field name="_listName" visibility="private" dataTypeName=".string"/>
			<plx:field name="_containsListCollection" visibility="private" dataTypeName=".boolean">
				<plx:initialize>
					<plx:falseKeyword/>
				</plx:initialize>
			</plx:field>
			<plx:field name="_propertyCollection" visibility="private" dataTypeName="PropertyDescriptorCollection" dataTypeQualifier="System.ComponentModel">
				<plx:attribute dataTypeName="NonSerializedAttribute" dataTypeQualifier="System"/>
			</plx:field>
			<plx:field name="_childCollectionProperties" visibility="private" dataTypeName="Dictionary" dataTypeQualifier="System.Collections.Generic">
				<plx:passTypeParam dataTypeName=".string"/>
				<plx:passTypeParam dataTypeName="PropertyDescriptorCollection" dataTypeQualifier="System.ComponentModel"/>
				<plx:attribute dataTypeName="NonSerializedAttribute" dataTypeQualifier="System"/>
			</plx:field>
			<plx:field name="_site" visibility="private" dataTypeName="ISite" dataTypeQualifier="System.ComponentModel">
				<plx:initialize>
					<plx:nullKeyword/>
				</plx:initialize>
			</plx:field>
			<plx:property name="SupportsSearchingCore" visibility="protected" modifier="override">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Gets a value indicating whether the list supports searching. 
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:returns dataTypeName=".boolean"/>
				<plx:get>
					<plx:return>
						<plx:trueKeyword/>
					</plx:return>
				</plx:get>
			</plx:property>
			<plx:property name="SupportsSortingCore" visibility="protected" modifier="override">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Gets a value indicating whether the list supports sorting. 
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:returns dataTypeName=".boolean"/>
				<plx:get>
					<plx:return>
						<plx:trueKeyword/>
					</plx:return>
				</plx:get>
			</plx:property>
			<plx:property name="IsSortedCore" visibility="protected" modifier="override">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Gets a value indicating whether the list is sorted. 
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:returns dataTypeName=".boolean"/>
				<plx:get>
					<plx:return>
						<plx:callThis name="_isSorted" type="field"/>
					</plx:return>
				</plx:get>
			</plx:property>
			<plx:property name="SortDirectionCore" visibility="protected" modifier="override">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Gets the direction the list is sorted.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:returns dataTypeName="ListSortDirection" dataTypeQualifier="System.ComponentModel"/>
				<plx:get>
					<plx:return>
						<plx:callThis name="_sortDirection" type="field"/>
					</plx:return>
				</plx:get>
			</plx:property>
			<plx:property name="SortPropertyCore" visibility="protected" modifier="override">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Gets the property descriptor that is used for sorting
</summary>
						<returns>The <see cref="T:System.ComponentModel.PropertyDescriptor" /> used for sorting the list.</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:returns dataTypeName="PropertyDescriptor" dataTypeQualifier="System.ComponentModel"/>
				<plx:get>
					<plx:return>
						<plx:callThis name="_sortProperty" type="field"/>
					</plx:return>
				</plx:get>
			</plx:property>
			<plx:property name="Filter" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Gets or sets the filter to be used to exclude items from the collection of items returned by the data source.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:returns dataTypeName=".string"/>
				<plx:get>
					<plx:return>
						<plx:callThis name="_filterString" type="field"/>
					</plx:return>
				</plx:get>
				<plx:set>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="inequality">
								<plx:left>
									<plx:nameRef name="value" type="parameter"/>
								</plx:left>
								<plx:right>
									<plx:callThis name="_filterString" type="field"/>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:assign>
							<plx:left>
								<plx:callThis name="_filterString" type="field"/>
							</plx:left>
							<plx:right>
								<plx:nameRef name="value" type="parameter"/>
							</plx:right>
						</plx:assign>
						<plx:callThis name="ApplyFilter"/>
					</plx:branch>
				</plx:set>
			</plx:property>
			<plx:property name="SortDescriptions" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Gets the collection of sort descriptions currently applied to the data source.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:returns dataTypeName="ListSortDescriptionCollection" dataTypeQualifier="System.ComponentModel"/>
				<plx:get>
					<plx:return>
						<plx:callThis name="_sortDescriptions" type="field"/>
					</plx:return>
				</plx:get>
			</plx:property>
			<plx:property name="SupportsAdvancedSorting" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Gets a value indicating whether the data source supports advanced sorting.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:returns dataTypeName=".boolean"/>
				<plx:get>
					<plx:return>
						<plx:trueKeyword/>
					</plx:return>
				</plx:get>
			</plx:property>
			<plx:property name="SupportsFiltering" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Gets a value indicating whether the data source supports filtering.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:returns dataTypeName=".boolean"/>
				<plx:get>
					<plx:return>
						<plx:trueKeyword/>
					</plx:return>
				</plx:get>
			</plx:property>
			<plx:property name="IsFiltering" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Indicates whether a filter is currently applied to the collection.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:returns dataTypeName=".boolean"/>
				<plx:get>
					<plx:return>
						<plx:binaryOperator type="greaterThan">
							<plx:left>
								<plx:callInstance name="Count" type="property">
									<plx:callObject>
										<plx:callThis name="excludedItems" type="field"/>
									</plx:callObject>
								</plx:callInstance>
							</plx:left>
							<plx:right>
								<plx:value data="0" type="i4"/>
							</plx:right>
						</plx:binaryOperator>
					</plx:return>
				</plx:get>
			</plx:property>
			<plx:property name="ExcludedItems" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Get the list of items that are excluded by the current filter.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:returns dataTypeName="List" dataTypeQualifier="System.Collections.Generic">
					<plx:passTypeParam dataTypeName="T"/>
				</plx:returns>
				<plx:get>
					<plx:return>
						<plx:callThis name="excludedItems" type="field"/>
					</plx:return>
				</plx:get>
			</plx:property>
			<plx:property name="RaisesItemChangedEvents" visibility="private">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Gets a value indicating whether the object raises <see cref="E:System.ComponentModel.IBindingList.ListChanged" /> events.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:returns dataTypeName=".boolean"/>
				<plx:get>
					<plx:return>
						<plx:trueKeyword/>
					</plx:return>
				</plx:get>
			</plx:property>
			<plx:property name="PropertyCollection" visibility="protected" modifier="virtual">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Gets or sets the property descriptor collection for T.  
</summary>
						<value>The property collection.</value>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:returns dataTypeName="PropertyDescriptorCollection" dataTypeQualifier="System.ComponentModel"/>
				<plx:get>
					<plx:return>
						<plx:callThis name="_propertyCollection" type="field"/>
					</plx:return>
				</plx:get>
				<plx:set>
					<plx:assign>
						<plx:left>
							<plx:callThis name="_propertyCollection" type="field"/>
						</plx:left>
						<plx:right>
							<plx:nameRef name="value" type="parameter"/>
						</plx:right>
					</plx:assign>
				</plx:set>
			</plx:property>
			<plx:property name="ContainsListCollection" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Return TRUE if our list contains additional/child lists.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:returns dataTypeName=".boolean"/>
				<plx:get>
					<plx:return>
						<plx:callThis name="_containsListCollection" type="field"/>
					</plx:return>
				</plx:get>
				<plx:set>
					<plx:assign>
						<plx:left>
							<plx:callThis name="_containsListCollection" type="field"/>
						</plx:left>
						<plx:right>
							<plx:nameRef name="value" type="parameter"/>
						</plx:right>
					</plx:assign>
				</plx:set>
			</plx:property>
			<plx:property name="Site" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Get / Set the site where this data is located.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:returns dataTypeName="ISite" dataTypeQualifier="System.ComponentModel"/>
				<plx:get>
					<plx:return>
						<plx:callThis name="_site" type="field"/>
					</plx:return>
				</plx:get>
				<plx:set>
					<plx:assign>
						<plx:left>
							<plx:callThis name="_site" type="field"/>
						</plx:left>
						<plx:right>
							<plx:nameRef name="value" type="parameter"/>
						</plx:right>
					</plx:assign>
				</plx:set>
			</plx:property>
			<plx:event name="Disposed" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Notify those that care when we dispose.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
			</plx:event>
			<plx:function name="InitializeList" visibility="private">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Initialize any member variables when the list is created
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:assign>
					<plx:left>
						<plx:callThis name="_propertyCollection" type="field"/>
					</plx:left>
					<plx:right>
						<plx:callStatic name="GetBindableProperties" dataTypeName="EntityHelper">
							<plx:passParam>
								<plx:typeOf dataTypeName="T"/>
							</plx:passParam>
						</plx:callStatic>
					</plx:right>
				</plx:assign>
				<plx:assign>
					<plx:left>
						<plx:callThis name="_listName" type="field"/>
					</plx:left>
					<plx:right>
						<plx:callInstance name="Name" type="property">
							<plx:callObject>
								<plx:typeOf dataTypeName="T"/>
							</plx:callObject>
						</plx:callInstance>
					</plx:right>
				</plx:assign>
			</plx:function>
			<plx:function name="FindCore" visibility="protected" modifier="override">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Searches for the index of the item that has the specified property descriptor with the specified value.
</summary>
						<param name="prop">The <see cref="T:System.ComponentModel.PropertyDescriptor" /> to search for.</param>
						<param name="key">The value of <i>property</i> to match.</param>
						<returns>The zero-based index of the item that matches the property descriptor and contains the specified value. </returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="prop" dataTypeName="PropertyDescriptor" dataTypeQualifier="System.ComponentModel"/>
				<plx:param name="key" dataTypeName=".object"/>
				<plx:returns dataTypeName=".i4"/>
				<plx:return>
					<plx:callThis name="FindCore">
						<plx:passParam>
							<plx:nameRef name="prop" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:nameRef name="key" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:value data="0" type="i4"/>
						</plx:passParam>
						<plx:passParam>
							<plx:trueKeyword/>
						</plx:passParam>
					</plx:callThis>
				</plx:return>
			</plx:function>
			<plx:function name="FindCore" visibility="protected" modifier="virtual">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Searches for the index of the item that has the specified property descriptor with the specified value.
</summary>
						<param name="prop">The <see cref="T:System.ComponentModel.PropertyDescriptor" /> to search for.</param>
						<param name="key">The value of <i>property</i> to match.</param>
						<param name="ignoreCase">A Boolean indicating a case-sensitive or insensitive comparison (true indicates a case-insensitive comparison).  String properties only.</param>
						<returns>The zero-based index of the item that matches the property descriptor and contains the specified value. </returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="prop" dataTypeName="PropertyDescriptor" dataTypeQualifier="System.ComponentModel"/>
				<plx:param name="key" dataTypeName=".object"/>
				<plx:param name="ignoreCase" dataTypeName=".boolean"/>
				<plx:returns dataTypeName=".i4"/>
				<plx:return>
					<plx:callThis name="FindCore">
						<plx:passParam>
							<plx:nameRef name="prop" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:nameRef name="key" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:value data="0" type="i4"/>
						</plx:passParam>
						<plx:passParam>
							<plx:nameRef name="ignoreCase" type="parameter"/>
						</plx:passParam>
					</plx:callThis>
				</plx:return>
			</plx:function>
			<plx:function name="FindCore" visibility="protected" modifier="virtual">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Searches for the index of the item that has the specified property descriptor with the specified value.
</summary>
						<param name="prop">The <see cref="T:System.ComponentModel.PropertyDescriptor"> to search for.</see>
						</param>
						<param name="key">The value of <i>property</i> to match.</param>
						<param name="start">The index in the list at which to start the search.</param>
						<param name="ignoreCase">Indicator of whether to perform a case-sensitive or case insensitive search (string properties only).</param>
						<returns>The zero-based index of the item that matches the property descriptor and contains the specified value. </returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="prop" dataTypeName="PropertyDescriptor" dataTypeQualifier="System.ComponentModel"/>
				<plx:param name="key" dataTypeName=".object"/>
				<plx:param name="start" dataTypeName=".i4"/>
				<plx:param name="ignoreCase" dataTypeName=".boolean"/>
				<plx:returns dataTypeName=".i4"/>
				<plx:loop>
					<plx:initializeLoop>
						<plx:local name="i" dataTypeName=".i4">
							<plx:initialize>
								<plx:nameRef name="start" type="parameter"/>
							</plx:initialize>
						</plx:local>
					</plx:initializeLoop>
					<plx:condition>
						<plx:binaryOperator type="lessThan">
							<plx:left>
								<plx:nameRef name="i"/>
							</plx:left>
							<plx:right>
								<plx:callThis name="Count" type="property"/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:beforeLoop>
						<plx:increment>
							<plx:nameRef name="i"/>
						</plx:increment>
					</plx:beforeLoop>
					<plx:local name="item" dataTypeName="T">
						<plx:initialize>
							<plx:callThis name=".implied" type="indexerCall">
								<plx:passParam>
									<plx:nameRef name="i"/>
								</plx:passParam>
							</plx:callThis>
						</plx:initialize>
					</plx:local>
					<plx:local name="temp" dataTypeName=".object">
						<plx:initialize>
							<plx:callInstance name="GetValue">
								<plx:callObject>
									<plx:nameRef name="prop" type="parameter"/>
								</plx:callObject>
								<plx:passParam>
									<plx:nameRef name="item"/>
								</plx:passParam>
							</plx:callInstance>
						</plx:initialize>
					</plx:local>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="booleanAnd">
								<plx:left>
									<plx:binaryOperator type="identityEquality">
										<plx:left>
											<plx:nameRef name="key" type="parameter"/>
										</plx:left>
										<plx:right>
											<plx:nullKeyword/>
										</plx:right>
									</plx:binaryOperator>
								</plx:left>
								<plx:right>
									<plx:binaryOperator type="identityEquality">
										<plx:left>
											<plx:nameRef name="temp"/>
										</plx:left>
										<plx:right>
											<plx:nullKeyword/>
										</plx:right>
									</plx:binaryOperator>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:return>
							<plx:nameRef name="i"/>
						</plx:return>
					</plx:branch>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="typeEquality">
								<plx:left>
									<plx:nameRef name="temp"/>
								</plx:left>
								<plx:right>
									<plx:directTypeReference dataTypeName=".string"/>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:branch>
							<plx:condition>
								<plx:binaryOperator type="equality">
									<plx:left>
										<plx:callStatic name="Compare" dataTypeName=".string">
											<plx:passParam>
												<plx:callInstance name="ToString">
													<plx:callObject>
														<plx:nameRef name="temp"/>
													</plx:callObject>
												</plx:callInstance>
											</plx:passParam>
											<plx:passParam>
												<plx:callInstance name="ToString">
													<plx:callObject>
														<plx:nameRef name="key" type="parameter"/>
													</plx:callObject>
												</plx:callInstance>
											</plx:passParam>
											<plx:passParam>
												<plx:nameRef name="ignoreCase" type="parameter"/>
											</plx:passParam>
										</plx:callStatic>
									</plx:left>
									<plx:right>
										<plx:value data="0" type="i4"/>
									</plx:right>
								</plx:binaryOperator>
							</plx:condition>
							<plx:return>
								<plx:nameRef name="i"/>
							</plx:return>
						</plx:branch>
					</plx:branch>
					<plx:alternateBranch>
						<plx:condition>
							<plx:binaryOperator type="booleanAnd">
								<plx:left>
									<plx:binaryOperator type="identityInequality">
										<plx:left>
											<plx:nameRef name="temp"/>
										</plx:left>
										<plx:right>
											<plx:nullKeyword/>
										</plx:right>
									</plx:binaryOperator>
								</plx:left>
								<plx:right>
									<plx:callInstance name="Equals">
										<plx:callObject>
											<plx:nameRef name="temp"/>
										</plx:callObject>
										<plx:passParam>
											<plx:nameRef name="key" type="parameter"/>
										</plx:passParam>
									</plx:callInstance>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:return>
							<plx:nameRef name="i"/>
						</plx:return>
					</plx:alternateBranch>
				</plx:loop>
				<plx:return>
					<plx:value data="-1" type="i4"/>
				</plx:return>
			</plx:function>
			<plx:function name="ApplySortCore" visibility="protected" modifier="override">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Sorts the items in the list
</summary>
						<param name="prop">A <see cref="T:System.ComponentModel.PropertyDescriptor" /> that specifies the property to sort on.</param>
						<param name="direction">One of the <see cref="T:System.ComponentModel.ListSortDirection" /> values.</param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="prop" dataTypeName="PropertyDescriptor" dataTypeQualifier="System.ComponentModel"/>
				<plx:param name="direction" dataTypeName="ListSortDirection" dataTypeQualifier="System.ComponentModel"/>
				<plx:assign>
					<plx:left>
						<plx:callThis name="_sortDirection" type="field"/>
					</plx:left>
					<plx:right>
						<plx:nameRef name="direction" type="parameter"/>
					</plx:right>
				</plx:assign>
				<plx:assign>
					<plx:left>
						<plx:callThis name="_sortProperty" type="field"/>
					</plx:left>
					<plx:right>
						<plx:nameRef name="prop" type="parameter"/>
					</plx:right>
				</plx:assign>
				<plx:local name="comparer" dataTypeName="SortComparer">
					<plx:passTypeParam dataTypeName="T"/>
					<plx:initialize>
						<plx:callNew dataTypeName="SortComparer">
							<plx:passTypeParam dataTypeName="T"/>
							<plx:passParam>
								<plx:nameRef name="prop" type="parameter"/>
							</plx:passParam>
							<plx:passParam>
								<plx:nameRef name="direction" type="parameter"/>
							</plx:passParam>
						</plx:callNew>
					</plx:initialize>
				</plx:local>
				<plx:callThis name="ApplySortInternal">
					<plx:passParam>
						<plx:nameRef name="comparer"/>
					</plx:passParam>
				</plx:callThis>
			</plx:function>
			<plx:function name="RemoveSortCore" visibility="protected" modifier="override">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Removes any sort applied to the list.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:branch>
					<plx:condition>
						<plx:callThis name="_isSorted" type="field"/>
					</plx:condition>
					<plx:callThis name="Clear"/>
					<plx:iterator localName="item" dataTypeName="T">
						<plx:initialize>
							<plx:callThis name="_OriginalList" type="field"/>
						</plx:initialize>
						<plx:callThis name="Add">
							<plx:passParam>
								<plx:nameRef name="item"/>
							</plx:passParam>
						</plx:callThis>
					</plx:iterator>
					<plx:callInstance name="Clear">
						<plx:callObject>
							<plx:callThis name="_OriginalList" type="field"/>
						</plx:callObject>
					</plx:callInstance>
					<plx:assign>
						<plx:left>
							<plx:callThis name="_sortProperty" type="field"/>
						</plx:left>
						<plx:right>
							<plx:nullKeyword/>
						</plx:right>
					</plx:assign>
					<plx:assign>
						<plx:left>
							<plx:callThis name="_sortDescriptions" type="field"/>
						</plx:left>
						<plx:right>
							<plx:nullKeyword/>
						</plx:right>
					</plx:assign>
					<plx:assign>
						<plx:left>
							<plx:callThis name="_isSorted" type="field"/>
						</plx:left>
						<plx:right>
							<plx:falseKeyword/>
						</plx:right>
					</plx:assign>
				</plx:branch>
			</plx:function>
			<plx:function name="RemoveFilter" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Removes the current filter applied to the data source..
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:interfaceMember memberName="RemoveFilter" dataTypeName="IBindingListView" dataTypeQualifier="System.ComponentModel"/>
				<plx:assign>
					<plx:left>
						<plx:callThis name="Filter" type="property"/>
					</plx:left>
					<plx:right>
						<plx:callStatic name="Empty" type="field" dataTypeName=".string"/>
					</plx:right>
				</plx:assign>
			</plx:function>
			<plx:function name="ApplySort" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Sorts the data source based on the given <see cref="T:System.ComponentModel.ListSortDescriptionCollection" />.
</summary>
						<param name="sorts">The <see cref="T:System.ComponentModel.ListSortDescriptionCollection" /> containing the sorts to apply to the data source.</param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:interfaceMember memberName="ApplySort" dataTypeName="IBindingListView" dataTypeQualifier="System.ComponentModel"/>
				<plx:param name="sorts" dataTypeName="ListSortDescriptionCollection" dataTypeQualifier="System.ComponentModel"/>
				<plx:assign>
					<plx:left>
						<plx:callThis name="_sortProperty" type="field"/>
					</plx:left>
					<plx:right>
						<plx:nullKeyword/>
					</plx:right>
				</plx:assign>
				<plx:assign>
					<plx:left>
						<plx:callThis name="_sortDescriptions" type="field"/>
					</plx:left>
					<plx:right>
						<plx:nameRef name="sorts" type="parameter"/>
					</plx:right>
				</plx:assign>
				<plx:local name="comparer" dataTypeName="SortComparer">
					<plx:passTypeParam dataTypeName="T"/>
					<plx:initialize>
						<plx:callNew dataTypeName="SortComparer">
							<plx:passTypeParam dataTypeName="T"/>
							<plx:passParam>
								<plx:nameRef name="sorts" type="parameter"/>
							</plx:passParam>
						</plx:callNew>
					</plx:initialize>
				</plx:local>
				<plx:callThis name="ApplySortInternal">
					<plx:passParam>
						<plx:nameRef name="comparer"/>
					</plx:passParam>
				</plx:callThis>
			</plx:function>
			<plx:function name="ApplySort" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Sorts the data source based on a <see cref="T:System.ComponentModel.PropertyDescriptor">PropertyDescriptor</see> and a <see cref="T:System.ComponentModel.ListSortDirection">ListSortDirection</see>.
</summary>
						<param name="property">The <see cref="T:System.ComponentModel.PropertyDescriptor" /> to sort the collection by.</param>
						<param name="direction">The <see cref="T:System.ComponentModel.ListSortDirection" /> in which to sort the collection.</param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:interfaceMember memberName="ApplySort" dataTypeName="IBindingList" dataTypeQualifier="System.ComponentModel"/>
				<plx:param name="property" dataTypeName="PropertyDescriptor" dataTypeQualifier="System.ComponentModel"/>
				<plx:param name="direction" dataTypeName="ListSortDirection" dataTypeQualifier="System.ComponentModel"/>
				<plx:callThis name="ApplySortCore">
					<plx:passParam>
						<plx:nameRef name="property" type="parameter"/>
					</plx:passParam>
					<plx:passParam>
						<plx:nameRef name="direction" type="parameter"/>
					</plx:passParam>
				</plx:callThis>
			</plx:function>
			<plx:function name="ApplySortInternal" visibility="private">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Sorts the elements in the entire list using the specified <see cref="T:System.Comparison`1" />.
</summary>
						<param name="comparison">The <see cref="T:System.Comparison`1" /> to use when comparing elements.</param>
						<exception cref="T:System.ArgumentNullException">comparison is a null reference.</exception>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="comparison" dataTypeName="Comparison" dataTypeQualifier="System">
					<plx:passTypeParam dataTypeName="T"/>
				</plx:param>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="identityEquality">
							<plx:left>
								<plx:nameRef name="comparison" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:nullKeyword/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:throw>
						<plx:callNew dataTypeName="ArgumentNullException" dataTypeQualifier="System">
							<plx:passParam>
								<plx:string>The comparison parameter must be a valid object instance.</plx:string>
							</plx:passParam>
						</plx:callNew>
					</plx:throw>
				</plx:branch>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="equality">
							<plx:left>
								<plx:callInstance name="Count" type="property">
									<plx:callObject>
										<plx:callThis name="_OriginalList" type="field"/>
									</plx:callObject>
								</plx:callInstance>
							</plx:left>
							<plx:right>
								<plx:value data="0" type="i4"/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:callInstance name="AddRange">
						<plx:callObject>
							<plx:callThis name="_OriginalList" type="field"/>
						</plx:callObject>
						<plx:passParam>
							<plx:thisKeyword/>
						</plx:passParam>
					</plx:callInstance>
				</plx:branch>
				<plx:local name="listRef" dataTypeName="List" dataTypeQualifier="System.Collections.Generic">
					<plx:passTypeParam dataTypeName="T"/>
					<plx:initialize>
						<plx:cast type="testCast" dataTypeName="List" dataTypeQualifier="System.Collections.Generic">
							<plx:passTypeParam dataTypeName="T"/>
							<plx:callThis name="Items" type="property"/>
						</plx:cast>
					</plx:initialize>
				</plx:local>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="identityInequality">
							<plx:left>
								<plx:nameRef name="listRef"/>
							</plx:left>
							<plx:right>
								<plx:nullKeyword/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:callInstance name="Sort">
						<plx:callObject>
							<plx:nameRef name="listRef"/>
						</plx:callObject>
						<plx:passParam>
							<plx:nameRef name="comparison" type="parameter"/>
						</plx:passParam>
					</plx:callInstance>
					<plx:assign>
						<plx:left>
							<plx:callThis name="_isSorted" type="field"/>
						</plx:left>
						<plx:right>
							<plx:trueKeyword/>
						</plx:right>
					</plx:assign>
					<plx:callThis name="OnListChanged">
						<plx:passParam>
							<plx:callNew dataTypeName="ListChangedEventArgs" dataTypeQualifier="System.ComponentModel">
								<plx:passParam>
									<plx:callStatic name="Reset" type="field" dataTypeName="ListChangedType" dataTypeQualifier="System.ComponentModel"/>
								</plx:passParam>
								<plx:passParam>
									<plx:value data="-1" type="i4"/>
								</plx:passParam>
							</plx:callNew>
						</plx:passParam>
					</plx:callThis>
				</plx:branch>
			</plx:function>
			<plx:function name="ApplySortInternal" visibility="private">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Sorts the elements in the entire list using the specified comparer. 
</summary>
						<param name="comparer">The <see cref="T:System.Collections.Generic.IComparer`1" /> implementation to use when comparing elements, or a null reference (Nothing in Visual Basic) to use the default comparer <see cref="F:System.Collections.Comparer.Default" />.</param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="comparer" dataTypeName="IComparer" dataTypeQualifier="System.Collections.Generic">
					<plx:passTypeParam dataTypeName="T"/>
				</plx:param>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="identityEquality">
							<plx:left>
								<plx:nameRef name="comparer" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:nullKeyword/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:assign>
						<plx:left>
							<plx:nameRef name="comparer" type="parameter"/>
						</plx:left>
						<plx:right>
							<plx:callStatic name="Default" type="property" dataTypeName="Comparer" dataTypeQualifier="System.Collections.Generic">
								<plx:passTypeParam dataTypeName="T"/>
							</plx:callStatic>
						</plx:right>
					</plx:assign>
				</plx:branch>
				<plx:callThis name="ApplySortInternal">
					<plx:passParam>
						<plx:callInstance name="Compare" type="methodReference">
							<plx:callObject>
								<plx:nameRef name="comparer" type="parameter"/>
							</plx:callObject>
						</plx:callInstance>
					</plx:passParam>
				</plx:callThis>
			</plx:function>
			<plx:function name="Sort" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Sorts the elements in the entire list using the specified comparer. 
</summary>
						<param name="comparer">The <see cref="T:System.Collections.Generic.IComparer`1" /> implementation to use when comparing elements, or a null reference (Nothing in Visual Basic) to use the default comparer <see cref="F:System.Collections.Comparer.Default" />.</param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="comparer" dataTypeName="IComparer" dataTypeQualifier="System.Collections.Generic">
					<plx:passTypeParam dataTypeName="T"/>
				</plx:param>
				<plx:callThis name="ApplySortInternal">
					<plx:passParam>
						<plx:nameRef name="comparer" type="parameter"/>
					</plx:passParam>
				</plx:callThis>
			</plx:function>
			<plx:function name="Sort" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Sorts the elements in the entire list using the specified <see cref="T:System.Comparison`1" />.
</summary>
						<param name="comparison">The <see cref="T:System.Comparison`1" /> to use when comparing elements.</param>
						<exception cref="T:System.ArgumentNullException">comparison is a null reference.</exception>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="comparison" dataTypeName="Comparison" dataTypeQualifier="System">
					<plx:passTypeParam dataTypeName="T"/>
				</plx:param>
				<plx:callThis name="ApplySortInternal">
					<plx:passParam>
						<plx:nameRef name="comparison" type="parameter"/>
					</plx:passParam>
				</plx:callThis>
			</plx:function>
			<plx:function name="Sort" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Sorts the elements in the entire list using the specified Order By statement.
</summary>
						<param name="orderBy">SQL-like string representing the properties to sort the list by.</param>
						<remarks><i>orderBy</i> should be in the following format: 
<para>PropertyName[[ [[ASC]|DESC]][, PropertyName[ [[ASC]|DESC]][,...]]]</para>
</remarks>
						<example>
							<c>list.Sort("Property1, Property2 DESC, Property3 ASC");</c>
						</example>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="orderBy" dataTypeName=".string"/>
				<plx:local name="sortComparer" dataTypeName="SortComparer">
					<plx:passTypeParam dataTypeName="T"/>
					<plx:initialize>
						<plx:callNew dataTypeName="SortComparer">
							<plx:passTypeParam dataTypeName="T"/>
							<plx:passParam>
								<plx:nameRef name="orderBy" type="parameter"/>
							</plx:passParam>
						</plx:callNew>
					</plx:initialize>
				</plx:local>
				<plx:callThis name="ApplySortInternal">
					<plx:passParam>
						<plx:callInstance name="Compare" type="methodReference">
							<plx:callObject>
								<plx:nameRef name="sortComparer"/>
							</plx:callObject>
						</plx:callInstance>
					</plx:passParam>
				</plx:callThis>
			</plx:function>
			<plx:function name="ApplyFilter" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Force the filtering of the collection, based on the filter expression set through the <c cref="Filter" /> property.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:loop>
					<plx:initializeLoop>
						<plx:local name="i" dataTypeName=".i4">
							<plx:initialize>
								<plx:value data="0" type="i4"/>
							</plx:initialize>
						</plx:local>
					</plx:initializeLoop>
					<plx:condition>
						<plx:binaryOperator type="lessThan">
							<plx:left>
								<plx:nameRef name="i"/>
							</plx:left>
							<plx:right>
								<plx:callInstance name="Count" type="property">
									<plx:callObject>
										<plx:callThis name="excludedItems" type="field"/>
									</plx:callObject>
								</plx:callInstance>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:beforeLoop>
						<plx:increment>
							<plx:nameRef name="i"/>
						</plx:increment>
					</plx:beforeLoop>
					<plx:callThis name="Add">
						<plx:passParam>
							<plx:callInstance name=".implied" type="indexerCall">
								<plx:callObject>
									<plx:callThis name="excludedItems" type="field"/>
								</plx:callObject>
								<plx:passParam>
									<plx:nameRef name="i"/>
								</plx:passParam>
							</plx:callInstance>
						</plx:passParam>
					</plx:callThis>
				</plx:loop>
				<plx:callInstance name="Clear">
					<plx:callObject>
						<plx:callThis name="excludedItems" type="field"/>
					</plx:callObject>
				</plx:callInstance>
				<plx:branch>
					<plx:condition>
						<plx:unaryOperator type="booleanNot">
							<plx:callStatic name="IsNullOrEmpty" dataTypeName=".string">
								<plx:passParam>
									<plx:callThis name="_filterString" type="field"/>
								</plx:passParam>
							</plx:callStatic>
						</plx:unaryOperator>
					</plx:condition>
					<plx:local name="MyFilter" dataTypeName="Filter">
						<plx:passTypeParam dataTypeName="ListBase">
							<plx:passTypeParam dataTypeName="T"/>
						</plx:passTypeParam>
						<plx:passTypeParam dataTypeName="T"/>
						<plx:initialize>
							<plx:callNew dataTypeName="Filter">
								<plx:passTypeParam dataTypeName="ListBase">
									<plx:passTypeParam dataTypeName="T"/>
								</plx:passTypeParam>
								<plx:passTypeParam dataTypeName="T"/>
								<plx:passParam>
									<plx:cast dataTypeName="ListBase">
										<plx:passTypeParam dataTypeName="T"/>
										<plx:thisKeyword/>
									</plx:cast>
								</plx:passParam>
								<plx:passParam>
									<plx:callThis name="_filterString" type="field"/>
								</plx:passParam>
							</plx:callNew>
						</plx:initialize>
					</plx:local>
				</plx:branch>
				<plx:callThis name="OnListChanged">
					<plx:passParam>
						<plx:callNew dataTypeName="ListChangedEventArgs" dataTypeQualifier="System.ComponentModel">
							<plx:passParam>
								<plx:callStatic name="Reset" type="field" dataTypeName="ListChangedType" dataTypeQualifier="System.ComponentModel"/>
							</plx:passParam>
							<plx:passParam>
								<plx:value data="0" type="i4"/>
							</plx:passParam>
							<plx:passParam>
								<plx:value data="0" type="i4"/>
							</plx:passParam>
						</plx:callNew>
					</plx:passParam>
				</plx:callThis>
			</plx:function>
			<plx:function name="ApplyFilter" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Force the filtering of the collection, based on the use of the specified Predicate.
</summary>
						<param name="match"></param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="match" dataTypeName="Predicate" dataTypeQualifier="System">
					<plx:passTypeParam dataTypeName="T"/>
				</plx:param>
				<plx:local name="i" dataTypeName=".i4"/>
				<plx:assign>
					<plx:left>
						<plx:callThis name="_filterString" type="field"/>
					</plx:left>
					<plx:right>
						<plx:callStatic name="Empty" type="field" dataTypeName=".string"/>
					</plx:right>
				</plx:assign>
				<plx:loop>
					<plx:initializeLoop>
						<plx:assign>
							<plx:left>
								<plx:nameRef name="i"/>
							</plx:left>
							<plx:right>
								<plx:value data="0" type="i4"/>
							</plx:right>
						</plx:assign>
					</plx:initializeLoop>
					<plx:condition>
						<plx:binaryOperator type="lessThan">
							<plx:left>
								<plx:nameRef name="i"/>
							</plx:left>
							<plx:right>
								<plx:callInstance name="Count" type="property">
									<plx:callObject>
										<plx:callThis name="excludedItems" type="field"/>
									</plx:callObject>
								</plx:callInstance>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:beforeLoop>
						<plx:increment>
							<plx:nameRef name="i"/>
						</plx:increment>
					</plx:beforeLoop>
					<plx:callThis name="Add">
						<plx:passParam>
							<plx:callInstance name=".implied" type="indexerCall">
								<plx:callObject>
									<plx:callThis name="excludedItems" type="field"/>
								</plx:callObject>
								<plx:passParam>
									<plx:nameRef name="i"/>
								</plx:passParam>
							</plx:callInstance>
						</plx:passParam>
					</plx:callThis>
				</plx:loop>
				<plx:callInstance name="Clear">
					<plx:callObject>
						<plx:callThis name="excludedItems" type="field"/>
					</plx:callObject>
				</plx:callInstance>
				<plx:loop>
					<plx:initializeLoop>
						<plx:assign>
							<plx:left>
								<plx:nameRef name="i"/>
							</plx:left>
							<plx:right>
								<plx:binaryOperator type="subtract">
									<plx:left>
										<plx:callInstance name="Count" type="property">
											<plx:callObject>
												<plx:callThis name="Items" type="property"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:left>
									<plx:right>
										<plx:value data="1" type="i4"/>
									</plx:right>
								</plx:binaryOperator>
							</plx:right>
						</plx:assign>
					</plx:initializeLoop>
					<plx:condition>
						<plx:binaryOperator type="greaterThanOrEqual">
							<plx:left>
								<plx:nameRef name="i"/>
							</plx:left>
							<plx:right>
								<plx:value data="0" type="i4"/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:beforeLoop>
						<plx:decrement>
							<plx:nameRef name="i"/>
						</plx:decrement>
					</plx:beforeLoop>
					<plx:branch>
						<plx:condition>
							<plx:unaryOperator type="booleanNot">
								<plx:callInstance name=".implied" type="delegateCall">
									<plx:callObject>
										<plx:nameRef name="match" type="parameter"/>
									</plx:callObject>
									<plx:passParam>
										<plx:callInstance name=".implied" type="indexerCall">
											<plx:callObject>
												<plx:callThis name="Items" type="property"/>
											</plx:callObject>
											<plx:passParam>
												<plx:nameRef name="i"/>
											</plx:passParam>
										</plx:callInstance>
									</plx:passParam>
								</plx:callInstance>
							</plx:unaryOperator>
						</plx:condition>
						<plx:callThis name="RemoveFilteredItem">
							<plx:passParam>
								<plx:nameRef name="i"/>
							</plx:passParam>
						</plx:callThis>
					</plx:branch>
				</plx:loop>
				<plx:callThis name="OnListChanged">
					<plx:passParam>
						<plx:callNew dataTypeName="ListChangedEventArgs" dataTypeQualifier="System.ComponentModel">
							<plx:passParam>
								<plx:callStatic name="Reset" type="field" dataTypeName="ListChangedType" dataTypeQualifier="System.ComponentModel"/>
							</plx:passParam>
							<plx:passParam>
								<plx:value data="0" type="i4"/>
							</plx:passParam>
							<plx:passParam>
								<plx:value data="0" type="i4"/>
							</plx:passParam>
						</plx:callNew>
					</plx:passParam>
				</plx:callThis>
			</plx:function>
			<plx:function name="RemoveFilteredItem" visibility="internal">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Removes the non criteria matching item at the specified index for the current filter set.
Adds the Item to the ExcludedItem  collection without changing EntityState
</summary>
						<param name="index">The zero-based index of non criteria matching item to remove.</param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="index" dataTypeName=".i4"/>
				<plx:local name="item" dataTypeName="T">
					<plx:initialize>
						<plx:callInstance name=".implied" type="indexerCall">
							<plx:callObject>
								<plx:callThis name="Items" type="property"/>
							</plx:callObject>
							<plx:passParam>
								<plx:nameRef name="index" type="parameter"/>
							</plx:passParam>
						</plx:callInstance>
					</plx:initialize>
				</plx:local>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="identityInequality">
							<plx:left>
								<plx:nameRef name="item"/>
							</plx:left>
							<plx:right>
								<plx:nullKeyword/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:callInstance name="Add">
						<plx:callObject>
							<plx:callThis name="ExcludedItems" type="property"/>
						</plx:callObject>
						<plx:passParam>
							<plx:nameRef name="item"/>
						</plx:passParam>
					</plx:callInstance>
					<plx:callThis name="RemoveItem" accessor="base">
						<plx:passParam>
							<plx:nameRef name="index" type="parameter"/>
						</plx:passParam>
					</plx:callThis>
				</plx:branch>
			</plx:function>
			<plx:function name="OnItemChanged" visibility="private">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Represents the method that will handle the ItemChanged event of the CurrencyManager class
</summary>
						<param name="sender">The source of the event.</param>
						<param name="args">An EventArgs that contains the event data.</param>
						<remarks>This raises the ListChanged event of the list.</remarks>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="sender" dataTypeName=".object"/>
				<plx:param name="args" dataTypeName="EventArgs" dataTypeQualifier="System"/>
				<plx:local name="index" dataTypeName=".i4">
					<plx:initialize>
						<plx:callInstance name="IndexOf">
							<plx:callObject>
								<plx:callThis name="Items" type="property"/>
							</plx:callObject>
							<plx:passParam>
								<plx:cast dataTypeName="T">
									<plx:nameRef name="sender" type="parameter"/>
								</plx:cast>
							</plx:passParam>
						</plx:callInstance>
					</plx:initialize>
				</plx:local>
				<plx:callThis name="OnListChanged">
					<plx:passParam>
						<plx:callNew dataTypeName="ListChangedEventArgs" dataTypeQualifier="System.ComponentModel">
							<plx:passParam>
								<plx:callStatic name="ItemChanged" type="field" dataTypeName="ListChangedType" dataTypeQualifier="System.ComponentModel"/>
							</plx:passParam>
							<plx:passParam>
								<plx:nameRef name="index"/>
							</plx:passParam>
						</plx:callNew>
					</plx:passParam>
				</plx:callThis>
			</plx:function>
			<plx:function name="Shuffle" visibility="public" modifier="virtual">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Sorts the collection based on a random shuffle.
</summary>
						<author>Steven Smith</author>
						<url>http://blogs.aspadvice.com/ssmith/archive/2005/01/27/2480.aspx</url>
						<remarks></remarks>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="equality">
							<plx:left>
								<plx:callInstance name="Count" type="property">
									<plx:callObject>
										<plx:callThis name="_OriginalList" type="field"/>
									</plx:callObject>
								</plx:callInstance>
							</plx:left>
							<plx:right>
								<plx:value data="0" type="i4"/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:callInstance name="AddRange">
						<plx:callObject>
							<plx:callThis name="_OriginalList" type="field"/>
						</plx:callObject>
						<plx:passParam>
							<plx:thisKeyword/>
						</plx:passParam>
					</plx:callInstance>
				</plx:branch>
				<plx:local name="rnd" dataTypeName="Random" dataTypeQualifier="System">
					<plx:initialize>
						<plx:callNew dataTypeName="Random" dataTypeQualifier="System"/>
					</plx:initialize>
				</plx:local>
				<plx:loop>
					<plx:initializeLoop>
						<plx:local name="inx" dataTypeName=".i4">
							<plx:initialize>
								<plx:binaryOperator type="subtract">
									<plx:left>
										<plx:callThis name="Count" type="property"/>
									</plx:left>
									<plx:right>
										<plx:value data="1" type="i4"/>
									</plx:right>
								</plx:binaryOperator>
							</plx:initialize>
						</plx:local>
					</plx:initializeLoop>
					<plx:condition>
						<plx:binaryOperator type="greaterThan">
							<plx:left>
								<plx:nameRef name="inx"/>
							</plx:left>
							<plx:right>
								<plx:value data="0" type="i4"/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:beforeLoop>
						<plx:decrement>
							<plx:nameRef name="inx"/>
						</plx:decrement>
					</plx:beforeLoop>
					<plx:local name="position" dataTypeName=".i4">
						<plx:initialize>
							<plx:callInstance name="Next">
								<plx:callObject>
									<plx:nameRef name="rnd"/>
								</plx:callObject>
								<plx:passParam>
									<plx:binaryOperator type="add">
										<plx:left>
											<plx:nameRef name="inx"/>
										</plx:left>
										<plx:right>
											<plx:value data="1" type="i4"/>
										</plx:right>
									</plx:binaryOperator>
								</plx:passParam>
							</plx:callInstance>
						</plx:initialize>
					</plx:local>
					<plx:local name="temp" dataTypeName="T">
						<plx:initialize>
							<plx:callThis name=".implied" type="indexerCall">
								<plx:passParam>
									<plx:nameRef name="inx"/>
								</plx:passParam>
							</plx:callThis>
						</plx:initialize>
					</plx:local>
					<plx:assign>
						<plx:left>
							<plx:callThis name=".implied" type="indexerCall">
								<plx:passParam>
									<plx:nameRef name="inx"/>
								</plx:passParam>
							</plx:callThis>
						</plx:left>
						<plx:right>
							<plx:callThis name=".implied" type="indexerCall">
								<plx:passParam>
									<plx:nameRef name="position"/>
								</plx:passParam>
							</plx:callThis>
						</plx:right>
					</plx:assign>
					<plx:assign>
						<plx:left>
							<plx:callThis name=".implied" type="indexerCall">
								<plx:passParam>
									<plx:nameRef name="position"/>
								</plx:passParam>
							</plx:callThis>
						</plx:left>
						<plx:right>
							<plx:nameRef name="temp"/>
						</plx:right>
					</plx:assign>
				</plx:loop>
			</plx:function>
			<plx:function name="Clone" visibility="public" modifier="virtual">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Creates an exact copy of this instance.
</summary>
						<implements>
							<see cref="M:System.ICloneable.Clone" />
						</implements>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:interfaceMember memberName="Clone" dataTypeName="ICloneable" dataTypeQualifier="System"/>
				<plx:returns dataTypeName=".object"/>
				<plx:throw>
					<plx:callNew dataTypeName="NotImplementedException" dataTypeQualifier="System">
						<plx:passParam>
							<plx:string>Method not implemented.</plx:string>
						</plx:passParam>
					</plx:callNew>
				</plx:throw>
			</plx:function>
			<plx:function name="MakeCopyOf" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Creates an exact copy of this TList{T} object.
</summary>
						<returns>A new, identical copy of the TList{T} casted as object.</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="x" dataTypeName=".object"/>
				<plx:returns dataTypeName=".object"/>
				<plx:branch>
					<plx:condition>
						<plx:unaryOperator type="booleanNot">
							<plx:binaryOperator type="typeEquality">
								<plx:left>
									<plx:nameRef name="x" type="parameter"/>
								</plx:left>
								<plx:right>
									<plx:directTypeReference dataTypeName="ICloneable" dataTypeQualifier="System"/>
								</plx:right>
							</plx:binaryOperator>
						</plx:unaryOperator>
					</plx:condition>
					<plx:throw>
						<plx:callNew dataTypeName="NotSupportedException" dataTypeQualifier="System">
							<plx:passParam>
								<plx:string>object not cloneable</plx:string>
							</plx:passParam>
						</plx:callNew>
					</plx:throw>
				</plx:branch>
				<plx:return>
					<plx:callInstance name="Clone">
						<plx:callObject>
							<plx:cast dataTypeName="ICloneable" dataTypeQualifier="System">
								<plx:nameRef name="x" type="parameter"/>
							</plx:cast>
						</plx:callObject>
					</plx:callInstance>
				</plx:return>
			</plx:function>
			<plx:function name="ToString" visibility="public" modifier="override">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Returns a <see cref="T:System.String"></see> that represents the current <see cref="T:System.Object"></see>.
</summary>
						<returns>
A <see cref="T:System.String"></see> that represents the current <see cref="T:System.Object"></see>.
</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:returns dataTypeName=".string"/>
				<plx:local name="s" dataTypeName=".string">
					<plx:initialize>
						<plx:callStatic name="Concat" dataTypeName=".string">
							<plx:passParam>
								<plx:callInstance name="Name" type="property">
									<plx:callObject>
										<plx:callThis name="GetType"/>
									</plx:callObject>
								</plx:callInstance>
							</plx:passParam>
							<plx:passParam>
								<plx:string> Collection</plx:string>
							</plx:passParam>
							<plx:passParam>
								<plx:callStatic name="NewLine" type="property" dataTypeName="Environment" dataTypeQualifier="System"/>
							</plx:passParam>
						</plx:callStatic>
					</plx:initialize>
				</plx:local>
				<plx:iterator localName="Item" dataTypeName="T">
					<plx:initialize>
						<plx:thisKeyword/>
					</plx:initialize>
					<plx:assign>
						<plx:left>
							<plx:nameRef name="s"/>
						</plx:left>
						<plx:right>
							<plx:callStatic name="Concat" dataTypeName=".string">
								<plx:passParam>
									<plx:nameRef name="s"/>
								</plx:passParam>
								<plx:passParam>
									<plx:callInstance name="ToString">
										<plx:callObject>
											<plx:nameRef name="Item"/>
										</plx:callObject>
									</plx:callInstance>
								</plx:passParam>
								<plx:passParam>
									<plx:callStatic name="NewLine" type="property" dataTypeName="Environment" dataTypeQualifier="System"/>
								</plx:passParam>
							</plx:callStatic>
						</plx:right>
					</plx:assign>
				</plx:iterator>
				<plx:return>
					<plx:nameRef name="s"/>
				</plx:return>
			</plx:function>
			<plx:function name="EntityChanged" visibility="internal">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Raises the ListChanged event indicating that a item in the list has changed.
</summary>
						<param name="entity"></param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="entity" dataTypeName="T"/>
				<plx:callThis name="OnListChanged">
					<plx:passParam>
						<plx:callNew dataTypeName="ListChangedEventArgs" dataTypeQualifier="System.ComponentModel">
							<plx:passParam>
								<plx:callStatic name="ItemChanged" type="field" dataTypeName="ListChangedType" dataTypeQualifier="System.ComponentModel"/>
							</plx:passParam>
							<plx:passParam>
								<plx:callThis name="IndexOf">
									<plx:passParam>
										<plx:nameRef name="entity" type="parameter"/>
									</plx:passParam>
								</plx:callThis>
							</plx:passParam>
						</plx:callNew>
					</plx:passParam>
				</plx:callThis>
			</plx:function>
			<plx:function name="GetItemProperties" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
This member allows binding objects to discover the field/column information.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:interfaceMember memberName="GetItemProperties" dataTypeName="ITypedList" dataTypeQualifier="System.ComponentModel"/>
				<plx:param name="listAccessors" dataTypeIsSimpleArray="true" dataTypeName="PropertyDescriptor" dataTypeQualifier="System.ComponentModel"/>
				<plx:returns dataTypeName="PropertyDescriptorCollection" dataTypeQualifier="System.ComponentModel"/>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="booleanOr">
							<plx:left>
								<plx:binaryOperator type="identityEquality">
									<plx:left>
										<plx:nameRef name="listAccessors" type="parameter"/>
									</plx:left>
									<plx:right>
										<plx:nullKeyword/>
									</plx:right>
								</plx:binaryOperator>
							</plx:left>
							<plx:right>
								<plx:binaryOperator type="equality">
									<plx:left>
										<plx:callInstance name="Length" type="property">
											<plx:callObject>
												<plx:nameRef name="listAccessors" type="parameter"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:left>
									<plx:right>
										<plx:value data="0" type="i4"/>
									</plx:right>
								</plx:binaryOperator>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:return>
						<plx:callThis name="_propertyCollection" type="field"/>
					</plx:return>
				</plx:branch>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="identityEquality">
							<plx:left>
								<plx:callThis name="_childCollectionProperties" type="field"/>
							</plx:left>
							<plx:right>
								<plx:nullKeyword/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:assign>
						<plx:left>
							<plx:callThis name="_childCollectionProperties" type="field"/>
						</plx:left>
						<plx:right>
							<plx:callNew dataTypeName="Dictionary" dataTypeQualifier="System.Collections.Generic">
								<plx:passTypeParam dataTypeName=".string"/>
								<plx:passTypeParam dataTypeName="PropertyDescriptorCollection" dataTypeQualifier="System.ComponentModel"/>
							</plx:callNew>
						</plx:right>
					</plx:assign>
				</plx:branch>
				<plx:local name="relevantType" dataTypeName="Type" dataTypeQualifier="System">
					<plx:initialize>
						<plx:callInstance name="PropertyType" type="property">
							<plx:callObject>
								<plx:callInstance name=".implied" type="arrayIndexer">
									<plx:callObject>
										<plx:nameRef name="listAccessors" type="parameter"/>
									</plx:callObject>
									<plx:passParam>
										<plx:value data="0" type="i4"/>
									</plx:passParam>
								</plx:callInstance>
							</plx:callObject>
						</plx:callInstance>
					</plx:initialize>
				</plx:local>
				<plx:local name="typeName" dataTypeName=".string">
					<plx:initialize>
						<plx:callInstance name="FullName" type="property">
							<plx:callObject>
								<plx:nameRef name="relevantType"/>
							</plx:callObject>
						</plx:callInstance>
					</plx:initialize>
				</plx:local>
				<plx:branch>
					<plx:condition>
						<plx:callInstance name="ContainsKey">
							<plx:callObject>
								<plx:callThis name="_childCollectionProperties" type="field"/>
							</plx:callObject>
							<plx:passParam>
								<plx:nameRef name="typeName"/>
							</plx:passParam>
						</plx:callInstance>
					</plx:condition>
					<plx:return>
						<plx:callInstance name=".implied" type="indexerCall">
							<plx:callObject>
								<plx:callThis name="_childCollectionProperties" type="field"/>
							</plx:callObject>
							<plx:passParam>
								<plx:nameRef name="typeName"/>
							</plx:passParam>
						</plx:callInstance>
					</plx:return>
				</plx:branch>
				<plx:local name="props" dataTypeName="PropertyDescriptorCollection" dataTypeQualifier="System.ComponentModel">
					<plx:initialize>
						<plx:callStatic name="GetBindableProperties" dataTypeName="EntityHelper">
							<plx:passParam>
								<plx:nameRef name="relevantType"/>
							</plx:passParam>
						</plx:callStatic>
					</plx:initialize>
				</plx:local>
				<plx:callInstance name="Add">
					<plx:callObject>
						<plx:callThis name="_childCollectionProperties" type="field"/>
					</plx:callObject>
					<plx:passParam>
						<plx:nameRef name="typeName"/>
					</plx:passParam>
					<plx:passParam>
						<plx:nameRef name="props"/>
					</plx:passParam>
				</plx:callInstance>
				<plx:return>
					<plx:nameRef name="props"/>
				</plx:return>
			</plx:function>
			<plx:function name="GetListName" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
This member returns the name displayed in the IDE.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:interfaceMember memberName="GetListName" dataTypeName="ITypedList" dataTypeQualifier="System.ComponentModel"/>
				<plx:param name="listAccessors" dataTypeIsSimpleArray="true" dataTypeName="PropertyDescriptor" dataTypeQualifier="System.ComponentModel"/>
				<plx:returns dataTypeName=".string"/>
				<plx:return>
					<plx:callThis name="_listName" type="field"/>
				</plx:return>
			</plx:function>
			<plx:function name="GetList" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Clean up. Nothing here though.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:interfaceMember memberName="GetList" dataTypeName="IListSource" dataTypeQualifier="System.ComponentModel"/>
				<plx:returns dataTypeName="IList" dataTypeQualifier="System.Collections"/>
				<plx:return>
					<plx:thisKeyword/>
				</plx:return>
			</plx:function>
			<plx:function name="Dispose" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Clean up. Nothing here though.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:interfaceMember memberName="Dispose" dataTypeName="IDisposable" dataTypeQualifier="System"/>
				<plx:callThis name="Dispose">
					<plx:passParam>
						<plx:trueKeyword/>
					</plx:passParam>
				</plx:callThis>
				<plx:callStatic name="SuppressFinalize" dataTypeName="GC" dataTypeQualifier="System">
					<plx:passParam>
						<plx:thisKeyword/>
					</plx:passParam>
				</plx:callStatic>
			</plx:function>
			<plx:function name="Dispose" visibility="protected" modifier="virtual">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Clean up.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="disposing" dataTypeName=".boolean"/>
				<plx:branch>
					<plx:condition>
						<plx:nameRef name="disposing" type="parameter"/>
					</plx:condition>
					<plx:local name="handler" dataTypeName="EventHandler" dataTypeQualifier="System">
						<plx:initialize>
							<plx:callThis name="Disposed" type="field"/>
						</plx:initialize>
					</plx:local>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="identityInequality">
								<plx:left>
									<plx:nameRef name="handler"/>
								</plx:left>
								<plx:right>
									<plx:nullKeyword/>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:callInstance name=".implied" type="delegateCall">
							<plx:callObject>
								<plx:nameRef name="handler"/>
							</plx:callObject>
							<plx:passParam>
								<plx:thisKeyword/>
							</plx:passParam>
							<plx:passParam>
								<plx:callStatic name="Empty" type="field" dataTypeName="EventArgs" dataTypeQualifier="System"/>
							</plx:passParam>
						</plx:callInstance>
					</plx:branch>
				</plx:branch>
			</plx:function>
			<plx:function name="Find" visibility="public" modifier="virtual">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Finds the first <see cref="IEntity" /> object in the current list matching the search criteria.
</summary>
						<param name="column">Property of the object to search, given as a value of the 'Entity'Columns enum.</param>
						<param name="value">Value to find.</param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="column" dataTypeName="Enum" dataTypeQualifier="System"/>
				<plx:param name="value" dataTypeName=".object"/>
				<plx:returns dataTypeName="T"/>
				<plx:return>
					<plx:callThis name="Find">
						<plx:passParam>
							<plx:callInstance name="ToString">
								<plx:callObject>
									<plx:nameRef name="column" type="parameter"/>
								</plx:callObject>
							</plx:callInstance>
						</plx:passParam>
						<plx:passParam>
							<plx:nameRef name="value" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:trueKeyword/>
						</plx:passParam>
					</plx:callThis>
				</plx:return>
			</plx:function>
			<plx:function name="Find" visibility="public" modifier="virtual">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Finds the first <see cref="IEntity" /> object in the current list matching the search criteria.
</summary>
						<param name="column">Property of the object to search, given as a value of the 'Entity'Columns enum.</param>
						<param name="value">Value to find.</param>
						<param name="ignoreCase">A Boolean indicating a case-sensitive or insensitive comparison (true indicates a case-insensitive comparison).  String properties only.</param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="column" dataTypeName="Enum" dataTypeQualifier="System"/>
				<plx:param name="value" dataTypeName=".object"/>
				<plx:param name="ignoreCase" dataTypeName=".boolean"/>
				<plx:returns dataTypeName="T"/>
				<plx:return>
					<plx:callThis name="Find">
						<plx:passParam>
							<plx:callInstance name="ToString">
								<plx:callObject>
									<plx:nameRef name="column" type="parameter"/>
								</plx:callObject>
							</plx:callInstance>
						</plx:passParam>
						<plx:passParam>
							<plx:nameRef name="value" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:nameRef name="ignoreCase" type="parameter"/>
						</plx:passParam>
					</plx:callThis>
				</plx:return>
			</plx:function>
			<plx:function name="Find" visibility="public" modifier="virtual">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Finds the first <see cref="IEntity" /> object in the current list matching the search criteria.
</summary>
						<param name="propertyName">Property of the object to search.</param>
						<param name="value">Value to find.</param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="propertyName" dataTypeName=".string"/>
				<plx:param name="value" dataTypeName=".object"/>
				<plx:returns dataTypeName="T"/>
				<plx:return>
					<plx:callThis name="Find">
						<plx:passParam>
							<plx:nameRef name="propertyName" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:nameRef name="value" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:trueKeyword/>
						</plx:passParam>
					</plx:callThis>
				</plx:return>
			</plx:function>
			<plx:function name="Find" visibility="public" modifier="virtual">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Finds the first <see cref="IEntity" /> object in the current list matching the search criteria.
</summary>
						<param name="propertyName">Property of the object to search.</param>
						<param name="value">Value to find.</param>
						<param name="ignoreCase">A Boolean indicating a case-sensitive or insensitive comparison (true indicates a case-insensitive comparison).  String properties only.</param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="propertyName" dataTypeName=".string"/>
				<plx:param name="value" dataTypeName=".object"/>
				<plx:param name="ignoreCase" dataTypeName=".boolean"/>
				<plx:returns dataTypeName="T"/>
				<plx:local name="searchBy" dataTypeName="PropertyDescriptor" dataTypeQualifier="System.ComponentModel">
					<plx:initialize>
						<plx:callInstance name="Find">
							<plx:callObject>
								<plx:callStatic name="GetProperties" dataTypeName="TypeDescriptor" dataTypeQualifier="System.ComponentModel">
									<plx:passParam>
										<plx:typeOf dataTypeName="T"/>
									</plx:passParam>
								</plx:callStatic>
							</plx:callObject>
							<plx:passParam>
								<plx:nameRef name="propertyName" type="parameter"/>
							</plx:passParam>
							<plx:passParam>
								<plx:trueKeyword/>
							</plx:passParam>
						</plx:callInstance>
					</plx:initialize>
				</plx:local>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="identityInequality">
							<plx:left>
								<plx:nameRef name="searchBy"/>
							</plx:left>
							<plx:right>
								<plx:nullKeyword/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:local name="index" dataTypeName=".i4">
						<plx:initialize>
							<plx:callThis name="FindCore">
								<plx:passParam>
									<plx:nameRef name="searchBy"/>
								</plx:passParam>
								<plx:passParam>
									<plx:nameRef name="value" type="parameter"/>
								</plx:passParam>
								<plx:passParam>
									<plx:nameRef name="ignoreCase" type="parameter"/>
								</plx:passParam>
							</plx:callThis>
						</plx:initialize>
					</plx:local>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="greaterThan">
								<plx:left>
									<plx:nameRef name="index"/>
								</plx:left>
								<plx:right>
									<plx:value data="-1" type="i4"/>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:return>
							<plx:callThis name=".implied" type="indexerCall">
								<plx:passParam>
									<plx:nameRef name="index"/>
								</plx:passParam>
							</plx:callThis>
						</plx:return>
					</plx:branch>
				</plx:branch>
				<plx:return>
					<plx:defaultValueOf dataTypeName="T"/>
				</plx:return>
			</plx:function>
			<plx:function name="OnDeserialization" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Runs when the entire object graph has been deserialized.
</summary>
						<param name="sender">The object that initiated the callback.</param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:interfaceMember memberName="OnDeserialization" dataTypeName="IDeserializationCallback" dataTypeQualifier="System.Runtime.Serialization"/>
				<plx:param name="sender" dataTypeName=".object"/>
				<plx:callThis name="InitializeList"/>
			</plx:function>
			<plx:function name="IsNullOrEmpty" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Indicates whether the specified TList object is a null reference (Nothing in Visual Basic) or an empty collection (no item in it).
</summary>
						<param name="list">The list.</param>
						<returns>
<c>true</c> if the object is null or has no item; otherwise, <c>false</c>.
</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="list" dataTypeName="ListBase">
					<plx:passTypeParam dataTypeName="T"/>
				</plx:param>
				<plx:returns dataTypeName=".boolean"/>
				<plx:return>
					<plx:binaryOperator type="booleanOr">
						<plx:left>
							<plx:binaryOperator type="identityEquality">
								<plx:left>
									<plx:nameRef name="list" type="parameter"/>
								</plx:left>
								<plx:right>
									<plx:nullKeyword/>
								</plx:right>
							</plx:binaryOperator>
						</plx:left>
						<plx:right>
							<plx:binaryOperator type="equality">
								<plx:left>
									<plx:callInstance name="Count" type="property">
										<plx:callObject>
											<plx:nameRef name="list" type="parameter"/>
										</plx:callObject>
									</plx:callInstance>
								</plx:left>
								<plx:right>
									<plx:value data="0" type="i4"/>
								</plx:right>
							</plx:binaryOperator>
						</plx:right>
					</plx:binaryOperator>
				</plx:return>
			</plx:function>
			<plx:function name="ForEach" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Performs the specified action on each element of the specified array.
</summary>
						<param name="action">The action.</param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="action" dataTypeName="Action" dataTypeQualifier="System">
					<plx:passTypeParam dataTypeName="T"/>
				</plx:param>
				<plx:iterator localName="entity" dataTypeName="T">
					<plx:initialize>
						<plx:callThis name="Items" type="property"/>
					</plx:initialize>
					<plx:callInstance name=".implied" type="delegateCall">
						<plx:callObject>
							<plx:nameRef name="action" type="parameter"/>
						</plx:callObject>
						<plx:passParam>
							<plx:nameRef name="entity"/>
						</plx:passParam>
					</plx:callInstance>
				</plx:iterator>
			</plx:function>
			<plx:function name="AddRange" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Adds an array of items to the list of items for a TList.
</summary>
						<param name="array">The array of items to add.</param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="array" dataTypeIsSimpleArray="true" dataTypeName="T"/>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="identityInequality">
							<plx:left>
								<plx:nameRef name="array" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:nullKeyword/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:iterator localName="item" dataTypeName="T">
						<plx:initialize>
							<plx:nameRef name="array" type="parameter"/>
						</plx:initialize>
						<plx:callThis name="Add">
							<plx:passParam>
								<plx:nameRef name="item"/>
							</plx:passParam>
						</plx:callThis>
					</plx:iterator>
				</plx:branch>
			</plx:function>
			<plx:function name="AddRange" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Adds an array of items to the list of items for a TList.
</summary>
						<param name="list">The list of items to add.</param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="list" dataTypeName="ListBase">
					<plx:passTypeParam dataTypeName="T"/>
				</plx:param>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="identityInequality">
							<plx:left>
								<plx:nameRef name="list" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:nullKeyword/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:iterator localName="item" dataTypeName="T">
						<plx:initialize>
							<plx:nameRef name="list" type="parameter"/>
						</plx:initialize>
						<plx:callThis name="Add">
							<plx:passParam>
								<plx:nameRef name="item"/>
							</plx:passParam>
						</plx:callThis>
					</plx:iterator>
				</plx:branch>
			</plx:function>
			<plx:function name="AddRange" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Adds an array of items to the list of items for a VList.
</summary>
						<param name="list">The list of items to add.</param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="list" dataTypeName="List" dataTypeQualifier="System.Collections.Generic">
					<plx:passTypeParam dataTypeName="T"/>
				</plx:param>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="identityInequality">
							<plx:left>
								<plx:nameRef name="list" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:nullKeyword/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:iterator localName="item" dataTypeName="T">
						<plx:initialize>
							<plx:nameRef name="list" type="parameter"/>
						</plx:initialize>
						<plx:callThis name="Add">
							<plx:passParam>
								<plx:nameRef name="item"/>
							</plx:passParam>
						</plx:callThis>
					</plx:iterator>
				</plx:branch>
			</plx:function>
			<plx:function name="FindAll" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Retrieves the all the elements that match the conditions defined by the specified predicate.
</summary>
						<param name="match">The <see cref="T:System.Predicate`1"></see> delegate that defines the conditions of the elements to search for.</param>
						<returns>
A <see cref="T:TList`1"></see> containing all the elements that match the conditions defined by the specified predicate, if found; otherwise, an empty <see cref="T:TList`1"></see>.
</returns>
						<exception cref="T:System.ArgumentNullException">match is null.</exception>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="match" dataTypeName="Predicate" dataTypeQualifier="System">
					<plx:passTypeParam dataTypeName="T"/>
				</plx:param>
				<plx:returns dataTypeName="ListBase">
					<plx:passTypeParam dataTypeName="T"/>
				</plx:returns>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="identityEquality">
							<plx:left>
								<plx:nameRef name="match" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:nullKeyword/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:throw>
						<plx:callNew dataTypeName="ArgumentNullException" dataTypeQualifier="System">
							<plx:passParam>
								<plx:string>match</plx:string>
							</plx:passParam>
						</plx:callNew>
					</plx:throw>
				</plx:branch>
				<plx:local name="result" dataTypeName="ListBase">
					<plx:passTypeParam dataTypeName="T"/>
					<plx:initialize>
						<plx:cast type="testCast" dataTypeName="ListBase">
							<plx:passTypeParam dataTypeName="T"/>
							<plx:callThis name="Clone"/>
						</plx:cast>
					</plx:initialize>
				</plx:local>
				<plx:callInstance name="ClearItems">
					<plx:callObject>
						<plx:nameRef name="result"/>
					</plx:callObject>
				</plx:callInstance>
				<plx:iterator localName="item" dataTypeName="T">
					<plx:initialize>
						<plx:callThis name="Items" type="property"/>
					</plx:initialize>
					<plx:branch>
						<plx:condition>
							<plx:callInstance name=".implied" type="delegateCall">
								<plx:callObject>
									<plx:nameRef name="match" type="parameter"/>
								</plx:callObject>
								<plx:passParam>
									<plx:nameRef name="item"/>
								</plx:passParam>
							</plx:callInstance>
						</plx:condition>
						<plx:callInstance name="Add">
							<plx:callObject>
								<plx:nameRef name="result"/>
							</plx:callObject>
							<plx:passParam>
								<plx:nameRef name="item"/>
							</plx:passParam>
						</plx:callInstance>
					</plx:branch>
				</plx:iterator>
				<plx:return>
					<plx:nameRef name="result"/>
				</plx:return>
			</plx:function>
			<plx:function name="Find" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Searches for an element that matches the conditions defined by the specified predicate, and returns the first occurrence within the entire <see cref="T:TList`1"></see>.
</summary>
						<param name="match">The <see cref="T:System.Predicate`1"></see> delegate that defines the conditions of the element to search for.</param>
						<returns>
The first element that matches the conditions defined by the specified predicate, if found; otherwise, the default value for type T.
</returns>
						<exception cref="T:System.ArgumentNullException">match is null.</exception>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="match" dataTypeName="Predicate" dataTypeQualifier="System">
					<plx:passTypeParam dataTypeName="T"/>
				</plx:param>
				<plx:returns dataTypeName="T"/>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="identityEquality">
							<plx:left>
								<plx:nameRef name="match" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:nullKeyword/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:throw>
						<plx:callNew dataTypeName="ArgumentNullException" dataTypeQualifier="System">
							<plx:passParam>
								<plx:string>match</plx:string>
							</plx:passParam>
						</plx:callNew>
					</plx:throw>
				</plx:branch>
				<plx:iterator localName="item" dataTypeName="T">
					<plx:initialize>
						<plx:callThis name="Items" type="property"/>
					</plx:initialize>
					<plx:branch>
						<plx:condition>
							<plx:callInstance name=".implied" type="delegateCall">
								<plx:callObject>
									<plx:nameRef name="match" type="parameter"/>
								</plx:callObject>
								<plx:passParam>
									<plx:nameRef name="item"/>
								</plx:passParam>
							</plx:callInstance>
						</plx:condition>
						<plx:return>
							<plx:nameRef name="item"/>
						</plx:return>
					</plx:branch>
				</plx:iterator>
				<plx:return>
					<plx:defaultValueOf dataTypeName="T"/>
				</plx:return>
			</plx:function>
			<plx:function name="ToArray" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Convert list of entities to an <see cref="T:System.Array" />
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:returns dataTypeIsSimpleArray="true" dataTypeName="T"/>
				<plx:local name="tmpArray" dataTypeName="List" dataTypeQualifier="System.Collections.Generic">
					<plx:passTypeParam dataTypeName="T"/>
					<plx:initialize>
						<plx:callNew dataTypeName="List" dataTypeQualifier="System.Collections.Generic">
							<plx:passTypeParam dataTypeName="T"/>
							<plx:passParam>
								<plx:callInstance name="Count" type="property">
									<plx:callObject>
										<plx:callThis name="Items" type="property"/>
									</plx:callObject>
								</plx:callInstance>
							</plx:passParam>
						</plx:callNew>
					</plx:initialize>
				</plx:local>
				<plx:iterator localName="type" dataTypeName="T">
					<plx:initialize>
						<plx:callThis name="Items" type="property"/>
					</plx:initialize>
					<plx:callInstance name="Add">
						<plx:callObject>
							<plx:nameRef name="tmpArray"/>
						</plx:callObject>
						<plx:passParam>
							<plx:nameRef name="type"/>
						</plx:passParam>
					</plx:callInstance>
				</plx:iterator>
				<plx:return>
					<plx:callInstance name="ToArray">
						<plx:callObject>
							<plx:nameRef name="tmpArray"/>
						</plx:callObject>
					</plx:callInstance>
				</plx:return>
			</plx:function>
			<plx:function name="ToDataSet" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Recursively adds child relationships of a <seealso cref="ListBase`1" /> Entities and 
builds out a nested dataset including <see cref="T:System.Data.DataRelation" /> relationships.
</summary>
						<param name="includeChildren">You can optionally go deep by including includeChildren</param>
						<returns>DataSet</returns>
						<example>
An example using the Northwind database would be to deep load a TList or VList, 
and then call list.ToDataSet(true/false);
<code><![CDATA[
TList<Categories> list = DataRepository.CategoriesProvider.GetAll();
DataRepository.CategoriesProvider.DeepLoad(list, true);
DataSet ds = list.ToDataSet(true);
ds.WriteXml("C:\\Test2.xml");
]]></code>
</example>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="includeChildren" dataTypeName=".boolean"/>
				<plx:returns dataTypeName="DataSet" dataTypeQualifier="System.Data"/>
				<plx:local name="dataset" dataTypeName="DataSet" dataTypeQualifier="System.Data">
					<plx:initialize>
						<plx:callNew dataTypeName="DataSet" dataTypeQualifier="System.Data"/>
					</plx:initialize>
				</plx:local>
				<plx:return>
					<plx:callThis name="AddRelations">
						<plx:passParam>
							<plx:nameRef name="dataset"/>
						</plx:passParam>
						<plx:passParam>
							<plx:nullKeyword/>
						</plx:passParam>
						<plx:passParam>
							<plx:nameRef name="includeChildren" type="parameter"/>
						</plx:passParam>
					</plx:callThis>
				</plx:return>
			</plx:function>
			<plx:function name="AddRelations" visibility="internal">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Recursively adds child relationships of a TList's Entity and builds out a nested dataset including relationships.
</summary>
						<param name="dataset">An already instatiated dataset which will be used to fill all objects.</param>
						<param name="parentKeys">Used to pass down the parent primary key to a child datatable to add a dataRelation</param>
						<param name="includeChildren">bool, include deep load of all child collections in this object graph?</param>
						<returns></returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="dataset" dataTypeName="DataSet" dataTypeQualifier="System.Data"/>
				<plx:param name="parentKeys" dataTypeName="List" dataTypeQualifier="System.Collections.Generic">
					<plx:passTypeParam dataTypeName="DataColumn" dataTypeQualifier="System.Data"/>
				</plx:param>
				<plx:param name="includeChildren" dataTypeName=".boolean"/>
				<plx:returns dataTypeName="DataSet" dataTypeQualifier="System.Data"/>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="identityEquality">
							<plx:left>
								<plx:nameRef name="dataset" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:nullKeyword/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:throw>
						<plx:callNew dataTypeName="ArgumentException" dataTypeQualifier="System">
							<plx:passParam>
								<plx:string>Invalid parameter context, dataset can not be null in this method context.</plx:string>
							</plx:passParam>
							<plx:passParam>
								<plx:string>dataset</plx:string>
							</plx:passParam>
						</plx:callNew>
					</plx:throw>
				</plx:branch>
				<plx:local name="children" dataTypeName="List" dataTypeQualifier="System.Collections.Generic">
					<plx:passTypeParam dataTypeName="PropertyDescriptor" dataTypeQualifier="System.ComponentModel"/>
					<plx:initialize>
						<plx:callNew dataTypeName="List" dataTypeQualifier="System.Collections.Generic">
							<plx:passTypeParam dataTypeName="PropertyDescriptor" dataTypeQualifier="System.ComponentModel"/>
						</plx:callNew>
					</plx:initialize>
				</plx:local>
				<plx:local name="dataTable" dataTypeName="DataTable" dataTypeQualifier="System.Data">
					<plx:initialize>
						<plx:nullKeyword/>
					</plx:initialize>
				</plx:local>
				<plx:local name="tableExists" dataTypeName=".boolean">
					<plx:initialize>
						<plx:falseKeyword/>
					</plx:initialize>
				</plx:local>
				<plx:local name="tName" dataTypeName=".string">
					<plx:initialize>
						<plx:callInstance name="Name" type="property">
							<plx:callObject>
								<plx:typeOf dataTypeName="T"/>
							</plx:callObject>
						</plx:callInstance>
					</plx:initialize>
				</plx:local>
				<plx:branch>
					<plx:condition>
						<plx:unaryOperator type="booleanNot">
							<plx:callInstance name="Contains">
								<plx:callObject>
									<plx:callInstance name="Tables" type="property">
										<plx:callObject>
											<plx:nameRef name="dataset" type="parameter"/>
										</plx:callObject>
									</plx:callInstance>
								</plx:callObject>
								<plx:passParam>
									<plx:nameRef name="tName"/>
								</plx:passParam>
							</plx:callInstance>
						</plx:unaryOperator>
					</plx:condition>
					<plx:assign>
						<plx:left>
							<plx:nameRef name="dataTable"/>
						</plx:left>
						<plx:right>
							<plx:callNew dataTypeName="DataTable" dataTypeQualifier="System.Data">
								<plx:passParam>
									<plx:nameRef name="tName"/>
								</plx:passParam>
							</plx:callNew>
						</plx:right>
					</plx:assign>
					<plx:assign>
						<plx:left>
							<plx:nameRef name="tableExists"/>
						</plx:left>
						<plx:right>
							<plx:falseKeyword/>
						</plx:right>
					</plx:assign>
				</plx:branch>
				<plx:fallbackBranch>
					<plx:assign>
						<plx:left>
							<plx:nameRef name="dataTable"/>
						</plx:left>
						<plx:right>
							<plx:callInstance name=".implied" type="indexerCall">
								<plx:callObject>
									<plx:callInstance name="Tables" type="property">
										<plx:callObject>
											<plx:nameRef name="dataset" type="parameter"/>
										</plx:callObject>
									</plx:callInstance>
								</plx:callObject>
								<plx:passParam>
									<plx:nameRef name="tName"/>
								</plx:passParam>
							</plx:callInstance>
						</plx:right>
					</plx:assign>
					<plx:assign>
						<plx:left>
							<plx:nameRef name="tableExists"/>
						</plx:left>
						<plx:right>
							<plx:trueKeyword/>
						</plx:right>
					</plx:assign>
				</plx:fallbackBranch>
				<plx:local name="props" dataTypeName="PropertyDescriptorCollection" dataTypeQualifier="System.ComponentModel">
					<plx:initialize>
						<plx:callStatic name="GetProperties" dataTypeName="TypeDescriptor" dataTypeQualifier="System.ComponentModel">
							<plx:passParam>
								<plx:typeOf dataTypeName="T"/>
							</plx:passParam>
						</plx:callStatic>
					</plx:initialize>
				</plx:local>
				<plx:local name="primaryKey" dataTypeName="List" dataTypeQualifier="System.Collections.Generic">
					<plx:passTypeParam dataTypeName="DataColumn" dataTypeQualifier="System.Data"/>
					<plx:initialize>
						<plx:callNew dataTypeName="List" dataTypeQualifier="System.Collections.Generic">
							<plx:passTypeParam dataTypeName="DataColumn" dataTypeQualifier="System.Data"/>
						</plx:callNew>
					</plx:initialize>
				</plx:local>
				<plx:branch>
					<plx:condition>
						<plx:unaryOperator type="booleanNot">
							<plx:nameRef name="tableExists"/>
						</plx:unaryOperator>
					</plx:condition>
					<plx:iterator localName="prop" dataTypeName="PropertyDescriptor" dataTypeQualifier="System.ComponentModel">
						<plx:initialize>
							<plx:nameRef name="props"/>
						</plx:initialize>
						<plx:branch>
							<plx:condition>
								<plx:callInstance name="Matches">
									<plx:callObject>
										<plx:callInstance name="Attributes" type="property">
											<plx:callObject>
												<plx:nameRef name="prop"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:callObject>
									<plx:passParam>
										<plx:callNew dataTypeIsSimpleArray="true" dataTypeName="Attribute" dataTypeQualifier="System">
											<plx:arrayInitializer>
												<plx:callNew dataTypeName="ReadOnlyAttribute" dataTypeQualifier="System.ComponentModel">
													<plx:passParam>
														<plx:falseKeyword/>
													</plx:passParam>
												</plx:callNew>
												<plx:callNew dataTypeName="BindableAttribute" dataTypeQualifier="System.ComponentModel">
													<plx:passParam>
														<plx:trueKeyword/>
													</plx:passParam>
												</plx:callNew>
												<plx:callNew dataTypeName="DescriptionAttribute" dataTypeQualifier="System.ComponentModel"/>
											</plx:arrayInitializer>
										</plx:callNew>
									</plx:passParam>
								</plx:callInstance>
							</plx:condition>
							<plx:callInstance name="Add">
								<plx:callObject>
									<plx:nameRef name="primaryKey"/>
								</plx:callObject>
								<plx:passParam>
									<plx:callInstance name="Add">
										<plx:callObject>
											<plx:callInstance name="Columns" type="property">
												<plx:callObject>
													<plx:nameRef name="dataTable"/>
												</plx:callObject>
											</plx:callInstance>
										</plx:callObject>
										<plx:passParam>
											<plx:callInstance name="Name" type="property">
												<plx:callObject>
													<plx:nameRef name="prop"/>
												</plx:callObject>
											</plx:callInstance>
										</plx:passParam>
										<plx:passParam>
											<plx:callInstance name="PropertyType" type="property">
												<plx:callObject>
													<plx:nameRef name="prop"/>
												</plx:callObject>
											</plx:callInstance>
										</plx:passParam>
									</plx:callInstance>
								</plx:passParam>
							</plx:callInstance>
						</plx:branch>
						<plx:alternateBranch>
							<plx:condition>
								<plx:binaryOperator type="booleanAnd">
									<plx:left>
										<plx:binaryOperator type="booleanAnd">
											<plx:left>
												<plx:binaryOperator type="identityInequality">
													<plx:left>
														<plx:callInstance name="GetInterface">
															<plx:callObject>
																<plx:callInstance name="PropertyType" type="property">
																	<plx:callObject>
																		<plx:nameRef name="prop"/>
																	</plx:callObject>
																</plx:callInstance>
															</plx:callObject>
															<plx:passParam>
																<plx:string>IList</plx:string>
															</plx:passParam>
														</plx:callInstance>
													</plx:left>
													<plx:right>
														<plx:nullKeyword/>
													</plx:right>
												</plx:binaryOperator>
											</plx:left>
											<plx:right>
												<plx:callInstance name="IsGenericType" type="property">
													<plx:callObject>
														<plx:callInstance name="PropertyType" type="property">
															<plx:callObject>
																<plx:nameRef name="prop"/>
															</plx:callObject>
														</plx:callInstance>
													</plx:callObject>
												</plx:callInstance>
											</plx:right>
										</plx:binaryOperator>
									</plx:left>
									<plx:right>
										<plx:binaryOperator type="booleanAnd">
											<plx:left>
												<plx:binaryOperator type="identityInequality">
													<plx:left>
														<plx:callInstance name="BaseType" type="property">
															<plx:callObject>
																<plx:callInstance name="PropertyType" type="property">
																	<plx:callObject>
																		<plx:nameRef name="prop"/>
																	</plx:callObject>
																</plx:callInstance>
															</plx:callObject>
														</plx:callInstance>
													</plx:left>
													<plx:right>
														<plx:nullKeyword/>
													</plx:right>
												</plx:binaryOperator>
											</plx:left>
											<plx:right>
												<plx:binaryOperator type="identityEquality">
													<plx:left>
														<plx:callInstance name="GetGenericTypeDefinition">
															<plx:callObject>
																<plx:callInstance name="BaseType" type="property">
																	<plx:callObject>
																		<plx:callInstance name="PropertyType" type="property">
																			<plx:callObject>
																				<plx:nameRef name="prop"/>
																			</plx:callObject>
																		</plx:callInstance>
																	</plx:callObject>
																</plx:callInstance>
															</plx:callObject>
														</plx:callInstance>
													</plx:left>
													<plx:right>
														<plx:typeOf dataTypeName="ListBase">
															<plx:passTypeParam dataTypeName=".unspecifiedTypeParam"/>
														</plx:typeOf>
													</plx:right>
												</plx:binaryOperator>
											</plx:right>
										</plx:binaryOperator>
									</plx:right>
								</plx:binaryOperator>
							</plx:condition>
							<plx:callInstance name="Add">
								<plx:callObject>
									<plx:nameRef name="children"/>
								</plx:callObject>
								<plx:passParam>
									<plx:nameRef name="prop"/>
								</plx:passParam>
							</plx:callInstance>
						</plx:alternateBranch>
						<plx:alternateBranch>
							<plx:condition>
								<plx:binaryOperator type="booleanAnd">
									<plx:left>
										<plx:binaryOperator type="identityEquality">
											<plx:left>
												<plx:callInstance name="GetInterface">
													<plx:callObject>
														<plx:callInstance name="PropertyType" type="property">
															<plx:callObject>
																<plx:nameRef name="prop"/>
															</plx:callObject>
														</plx:callInstance>
													</plx:callObject>
													<plx:passParam>
														<plx:string>IEntity</plx:string>
													</plx:passParam>
												</plx:callInstance>
											</plx:left>
											<plx:right>
												<plx:nullKeyword/>
											</plx:right>
										</plx:binaryOperator>
									</plx:left>
									<plx:right>
										<plx:callInstance name="Matches">
											<plx:callObject>
												<plx:callInstance name="Attributes" type="property">
													<plx:callObject>
														<plx:nameRef name="prop"/>
													</plx:callObject>
												</plx:callInstance>
											</plx:callObject>
											<plx:passParam>
												<plx:callNew dataTypeIsSimpleArray="true" dataTypeName="Attribute" dataTypeQualifier="System">
													<plx:arrayInitializer>
														<plx:callNew dataTypeName="BindableAttribute" dataTypeQualifier="System.ComponentModel">
															<plx:passParam>
																<plx:trueKeyword/>
															</plx:passParam>
														</plx:callNew>
														<plx:callNew dataTypeName="DescriptionAttribute" dataTypeQualifier="System.ComponentModel"/>
													</plx:arrayInitializer>
												</plx:callNew>
											</plx:passParam>
										</plx:callInstance>
									</plx:right>
								</plx:binaryOperator>
							</plx:condition>
							<plx:local name="columnType" dataTypeName="Type" dataTypeQualifier="System">
								<plx:initialize>
									<plx:inlineStatement dataTypeIsSimpleArray="true" dataTypeName="Type" dataTypeQualifier="System">
										<plx:conditionalOperator>
											<plx:condition>
												<plx:binaryOperator type="booleanAnd">
													<plx:left>
														<plx:callInstance name="IsGenericType" type="property">
															<plx:callObject>
																<plx:callInstance name="PropertyType" type="property">
																	<plx:callObject>
																		<plx:nameRef name="prop"/>
																	</plx:callObject>
																</plx:callInstance>
															</plx:callObject>
														</plx:callInstance>
													</plx:left>
													<plx:right>
														<plx:binaryOperator type="identityEquality">
															<plx:left>
																<plx:callInstance name="GetGenericTypeDefinition">
																	<plx:callObject>
																		<plx:callInstance name="PropertyType" type="property">
																			<plx:callObject>
																				<plx:nameRef name="prop"/>
																			</plx:callObject>
																		</plx:callInstance>
																	</plx:callObject>
																</plx:callInstance>
															</plx:left>
															<plx:right>
																<plx:typeOf dataTypeName="Nullable" dataTypeQualifier="System">
																	<plx:passTypeParam dataTypeName=".unspecifiedTypeParam"/>
																</plx:typeOf>
															</plx:right>
														</plx:binaryOperator>
													</plx:right>
												</plx:binaryOperator>
											</plx:condition>
											<plx:left>
												<plx:callInstance name=".implied" type="arrayIndexer">
													<plx:callObject>
														<plx:callInstance name="GetGenericArguments">
															<plx:callObject>
																<plx:callInstance name="PropertyType" type="property">
																	<plx:callObject>
																		<plx:nameRef name="prop"/>
																	</plx:callObject>
																</plx:callInstance>
															</plx:callObject>
														</plx:callInstance>
													</plx:callObject>
													<plx:passParam>
														<plx:value data="0" type="i4"/>
													</plx:passParam>
												</plx:callInstance>
											</plx:left>
											<plx:right>
												<plx:callInstance name="PropertyType" type="property">
													<plx:callObject>
														<plx:nameRef name="prop"/>
													</plx:callObject>
												</plx:callInstance>
											</plx:right>
										</plx:conditionalOperator>
									</plx:inlineStatement>
								</plx:initialize>
							</plx:local>
							<plx:callInstance name="Add">
								<plx:callObject>
									<plx:callInstance name="Columns" type="property">
										<plx:callObject>
											<plx:nameRef name="dataTable"/>
										</plx:callObject>
									</plx:callInstance>
								</plx:callObject>
								<plx:passParam>
									<plx:callInstance name="Name" type="property">
										<plx:callObject>
											<plx:nameRef name="prop"/>
										</plx:callObject>
									</plx:callInstance>
								</plx:passParam>
								<plx:passParam>
									<plx:nameRef name="columnType"/>
								</plx:passParam>
							</plx:callInstance>
						</plx:alternateBranch>
					</plx:iterator>
				</plx:branch>
				<plx:iterator localName="entity" dataTypeName="T">
					<plx:initialize>
						<plx:callThis name="Items" type="property"/>
					</plx:initialize>
					<plx:local name="row" dataTypeName="DataRow" dataTypeQualifier="System.Data">
						<plx:initialize>
							<plx:callInstance name="NewRow">
								<plx:callObject>
									<plx:nameRef name="dataTable"/>
								</plx:callObject>
							</plx:callInstance>
						</plx:initialize>
					</plx:local>
					<plx:iterator localName="currentProperty" dataTypeName="PropertyDescriptor" dataTypeQualifier="System.ComponentModel">
						<plx:initialize>
							<plx:nameRef name="props"/>
						</plx:initialize>
						<plx:branch>
							<plx:condition>
								<plx:unaryOperator type="booleanNot">
									<plx:callInstance name="Contains">
										<plx:callObject>
											<plx:callInstance name="Columns" type="property">
												<plx:callObject>
													<plx:nameRef name="dataTable"/>
												</plx:callObject>
											</plx:callInstance>
										</plx:callObject>
										<plx:passParam>
											<plx:callInstance name="Name" type="property">
												<plx:callObject>
													<plx:nameRef name="currentProperty"/>
												</plx:callObject>
											</plx:callInstance>
										</plx:passParam>
									</plx:callInstance>
								</plx:unaryOperator>
							</plx:condition>
							<plx:continue/>
						</plx:branch>
						<plx:local name="val" dataTypeName=".object">
							<plx:initialize>
								<plx:callInstance name="GetValue">
									<plx:callObject>
										<plx:nameRef name="currentProperty"/>
									</plx:callObject>
									<plx:passParam>
										<plx:nameRef name="entity"/>
									</plx:passParam>
								</plx:callInstance>
							</plx:initialize>
						</plx:local>
						<plx:assign>
							<plx:left>
								<plx:callInstance name=".implied" type="indexerCall">
									<plx:callObject>
										<plx:nameRef name="row"/>
									</plx:callObject>
									<plx:passParam>
										<plx:callInstance name="Name" type="property">
											<plx:callObject>
												<plx:nameRef name="currentProperty"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:passParam>
								</plx:callInstance>
							</plx:left>
							<plx:right>
								<plx:inlineStatement dataTypeName="DBNull" dataTypeQualifier="System">
									<plx:conditionalOperator>
										<plx:condition>
											<plx:binaryOperator type="identityEquality">
												<plx:left>
													<plx:nameRef name="val"/>
												</plx:left>
												<plx:right>
													<plx:nullKeyword/>
												</plx:right>
											</plx:binaryOperator>
										</plx:condition>
										<plx:left>
											<plx:callStatic name="Value" type="field" dataTypeName="DBNull" dataTypeQualifier="System"/>
										</plx:left>
										<plx:right>
											<plx:nameRef name="val"/>
										</plx:right>
									</plx:conditionalOperator>
								</plx:inlineStatement>
							</plx:right>
						</plx:assign>
					</plx:iterator>
					<plx:callInstance name="Add">
						<plx:callObject>
							<plx:callInstance name="Rows" type="property">
								<plx:callObject>
									<plx:nameRef name="dataTable"/>
								</plx:callObject>
							</plx:callInstance>
						</plx:callObject>
						<plx:passParam>
							<plx:nameRef name="row"/>
						</plx:passParam>
					</plx:callInstance>
				</plx:iterator>
				<plx:branch>
					<plx:condition>
						<plx:unaryOperator type="booleanNot">
							<plx:nameRef name="tableExists"/>
						</plx:unaryOperator>
					</plx:condition>
					<plx:callInstance name="Add">
						<plx:callObject>
							<plx:callInstance name="Tables" type="property">
								<plx:callObject>
									<plx:nameRef name="dataset" type="parameter"/>
								</plx:callObject>
							</plx:callInstance>
						</plx:callObject>
						<plx:passParam>
							<plx:nameRef name="dataTable"/>
						</plx:passParam>
					</plx:callInstance>
				</plx:branch>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="booleanAnd">
							<plx:left>
								<plx:binaryOperator type="identityInequality">
									<plx:left>
										<plx:nameRef name="parentKeys" type="parameter"/>
									</plx:left>
									<plx:right>
										<plx:nullKeyword/>
									</plx:right>
								</plx:binaryOperator>
							</plx:left>
							<plx:right>
								<plx:unaryOperator type="booleanNot">
									<plx:nameRef name="tableExists"/>
								</plx:unaryOperator>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:local name="skip" dataTypeName=".boolean">
						<plx:initialize>
							<plx:falseKeyword/>
						</plx:initialize>
					</plx:local>
					<plx:local name="childTable" dataTypeName="DataTable" dataTypeQualifier="System.Data">
						<plx:initialize>
							<plx:callInstance name=".implied" type="indexerCall">
								<plx:callObject>
									<plx:callInstance name="Tables" type="property">
										<plx:callObject>
											<plx:nameRef name="dataset" type="parameter"/>
										</plx:callObject>
									</plx:callInstance>
								</plx:callObject>
								<plx:passParam>
									<plx:binaryOperator type="subtract">
										<plx:left>
											<plx:callInstance name="Count" type="property">
												<plx:callObject>
													<plx:callInstance name="Tables" type="property">
														<plx:callObject>
															<plx:nameRef name="dataset" type="parameter"/>
														</plx:callObject>
													</plx:callInstance>
												</plx:callObject>
											</plx:callInstance>
										</plx:left>
										<plx:right>
											<plx:value data="1" type="i4"/>
										</plx:right>
									</plx:binaryOperator>
								</plx:passParam>
							</plx:callInstance>
						</plx:initialize>
					</plx:local>
					<plx:callStatic name="WriteLine" dataTypeName="Trace" dataTypeQualifier="System.Diagnostics">
						<plx:passParam>
							<plx:callStatic name="Concat" dataTypeName=".string">
								<plx:passParam>
									<plx:callInstance name="TableName" type="property">
										<plx:callObject>
											<plx:nameRef name="childTable"/>
										</plx:callObject>
									</plx:callInstance>
								</plx:passParam>
								<plx:passParam>
									<plx:string> - Found</plx:string>
								</plx:passParam>
							</plx:callStatic>
						</plx:passParam>
					</plx:callStatic>
					<plx:local name="childCols" dataTypeName="List" dataTypeQualifier="System.Collections.Generic">
						<plx:passTypeParam dataTypeName="DataColumn" dataTypeQualifier="System.Data"/>
						<plx:initialize>
							<plx:callNew dataTypeName="List" dataTypeQualifier="System.Collections.Generic">
								<plx:passTypeParam dataTypeName="DataColumn" dataTypeQualifier="System.Data"/>
							</plx:callNew>
						</plx:initialize>
					</plx:local>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="identityInequality">
								<plx:left>
									<plx:nameRef name="childTable"/>
								</plx:left>
								<plx:right>
									<plx:nullKeyword/>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:iterator localName="col" dataTypeName="DataColumn" dataTypeQualifier="System.Data">
							<plx:initialize>
								<plx:nameRef name="parentKeys" type="parameter"/>
							</plx:initialize>
							<plx:branch>
								<plx:condition>
									<plx:unaryOperator type="booleanNot">
										<plx:callInstance name="Contains">
											<plx:callObject>
												<plx:callInstance name="Columns" type="property">
													<plx:callObject>
														<plx:nameRef name="childTable"/>
													</plx:callObject>
												</plx:callInstance>
											</plx:callObject>
											<plx:passParam>
												<plx:callInstance name="ColumnName" type="property">
													<plx:callObject>
														<plx:nameRef name="col"/>
													</plx:callObject>
												</plx:callInstance>
											</plx:passParam>
										</plx:callInstance>
									</plx:unaryOperator>
								</plx:condition>
								<plx:assign>
									<plx:left>
										<plx:nameRef name="skip"/>
									</plx:left>
									<plx:right>
										<plx:trueKeyword/>
									</plx:right>
								</plx:assign>
							</plx:branch>
							<plx:callStatic name="WriteLine" dataTypeName="Trace" dataTypeQualifier="System.Diagnostics">
								<plx:passParam>
									<plx:callStatic name="Concat" dataTypeName=".string">
										<plx:passParam>
											<plx:callInstance name="TableName" type="property">
												<plx:callObject>
													<plx:nameRef name="childTable"/>
												</plx:callObject>
											</plx:callInstance>
										</plx:passParam>
										<plx:passParam>
											<plx:string> - Skip </plx:string>
										</plx:passParam>
										<plx:passParam>
											<plx:nameRef name="skip"/>
										</plx:passParam>
									</plx:callStatic>
								</plx:passParam>
							</plx:callStatic>
							<plx:callInstance name="Add">
								<plx:callObject>
									<plx:nameRef name="childCols"/>
								</plx:callObject>
								<plx:passParam>
									<plx:callInstance name=".implied" type="indexerCall">
										<plx:callObject>
											<plx:callInstance name="Columns" type="property">
												<plx:callObject>
													<plx:nameRef name="childTable"/>
												</plx:callObject>
											</plx:callInstance>
										</plx:callObject>
										<plx:passParam>
											<plx:callInstance name="ColumnName" type="property">
												<plx:callObject>
													<plx:nameRef name="col"/>
												</plx:callObject>
											</plx:callInstance>
										</plx:passParam>
									</plx:callInstance>
								</plx:passParam>
							</plx:callInstance>
						</plx:iterator>
						<plx:branch>
							<plx:condition>
								<plx:unaryOperator type="booleanNot">
									<plx:nameRef name="skip"/>
								</plx:unaryOperator>
							</plx:condition>
							<plx:callStatic name="WriteLine" dataTypeName="Trace" dataTypeQualifier="System.Diagnostics">
								<plx:passParam>
									<plx:callStatic name="Concat" dataTypeName=".string">
										<plx:passParam>
											<plx:callInstance name="TableName" type="property">
												<plx:callObject>
													<plx:nameRef name="childTable"/>
												</plx:callObject>
											</plx:callInstance>
										</plx:passParam>
										<plx:passParam>
											<plx:string> - relation added </plx:string>
										</plx:passParam>
									</plx:callStatic>
								</plx:passParam>
							</plx:callStatic>
							<plx:local name="key" dataTypeName=".i4">
								<plx:initialize>
									<plx:binaryOperator type="add">
										<plx:left>
											<plx:callInstance name="GetHashCode">
												<plx:callObject>
													<plx:nameRef name="parentKeys" type="parameter"/>
												</plx:callObject>
											</plx:callInstance>
										</plx:left>
										<plx:right>
											<plx:callInstance name="GetHashCode">
												<plx:callObject>
													<plx:nameRef name="childCols"/>
												</plx:callObject>
											</plx:callInstance>
										</plx:right>
									</plx:binaryOperator>
								</plx:initialize>
							</plx:local>
							<plx:branch>
								<plx:condition>
									<plx:unaryOperator type="booleanNot">
										<plx:callInstance name="Contains">
											<plx:callObject>
												<plx:callInstance name="Relations" type="property">
													<plx:callObject>
														<plx:nameRef name="dataset" type="parameter"/>
													</plx:callObject>
												</plx:callInstance>
											</plx:callObject>
											<plx:passParam>
												<plx:callInstance name="ToString">
													<plx:callObject>
														<plx:nameRef name="key"/>
													</plx:callObject>
												</plx:callInstance>
											</plx:passParam>
										</plx:callInstance>
									</plx:unaryOperator>
								</plx:condition>
								<plx:assign>
									<plx:left>
										<plx:callInstance name="Nested" type="property">
											<plx:callObject>
												<plx:callInstance name="Add">
													<plx:callObject>
														<plx:callInstance name="Relations" type="property">
															<plx:callObject>
																<plx:nameRef name="dataset" type="parameter"/>
															</plx:callObject>
														</plx:callInstance>
													</plx:callObject>
													<plx:passParam>
														<plx:callInstance name="ToString">
															<plx:callObject>
																<plx:nameRef name="key"/>
															</plx:callObject>
														</plx:callInstance>
													</plx:passParam>
													<plx:passParam>
														<plx:callInstance name="ToArray">
															<plx:callObject>
																<plx:nameRef name="parentKeys" type="parameter"/>
															</plx:callObject>
														</plx:callInstance>
													</plx:passParam>
													<plx:passParam>
														<plx:callInstance name="ToArray">
															<plx:callObject>
																<plx:nameRef name="childCols"/>
															</plx:callObject>
														</plx:callInstance>
													</plx:passParam>
												</plx:callInstance>
											</plx:callObject>
										</plx:callInstance>
									</plx:left>
									<plx:right>
										<plx:trueKeyword/>
									</plx:right>
								</plx:assign>
							</plx:branch>
						</plx:branch>
					</plx:branch>
				</plx:branch>
				<plx:branch>
					<plx:condition>
						<plx:nameRef name="includeChildren" type="parameter"/>
					</plx:condition>
					<plx:iterator localName="child" dataTypeName="PropertyDescriptor" dataTypeQualifier="System.ComponentModel">
						<plx:initialize>
							<plx:nameRef name="children"/>
						</plx:initialize>
						<plx:iterator localName="childEntity" dataTypeName="T">
							<plx:initialize>
								<plx:callThis name="Items" type="property"/>
							</plx:initialize>
							<plx:local name="childEntityParams" dataTypeIsSimpleArray="true" dataTypeName=".object">
								<plx:initialize>
									<plx:callNew dataTypeIsSimpleArray="true" dataTypeName=".object">
										<plx:arrayInitializer>
											<plx:nameRef name="dataset" type="parameter"/>
											<plx:nameRef name="primaryKey"/>
											<plx:nameRef name="includeChildren" type="parameter"/>
										</plx:arrayInitializer>
									</plx:callNew>
								</plx:initialize>
							</plx:local>
							<plx:local name="addRelationsMethod" dataTypeName="MethodInfo" dataTypeQualifier="System.Reflection">
								<plx:initialize>
									<plx:callInstance name="GetMethod">
										<plx:callObject>
											<plx:callInstance name="PropertyType" type="property">
												<plx:callObject>
													<plx:nameRef name="child"/>
												</plx:callObject>
											</plx:callInstance>
										</plx:callObject>
										<plx:passParam>
											<plx:string>AddRelations</plx:string>
										</plx:passParam>
										<plx:passParam>
											<plx:binaryOperator type="bitwiseOr">
												<plx:left>
													<plx:callStatic name="NonPublic" type="field" dataTypeName="BindingFlags" dataTypeQualifier="System.Reflection"/>
												</plx:left>
												<plx:right>
													<plx:callStatic name="Instance" type="field" dataTypeName="BindingFlags" dataTypeQualifier="System.Reflection"/>
												</plx:right>
											</plx:binaryOperator>
										</plx:passParam>
									</plx:callInstance>
								</plx:initialize>
							</plx:local>
							<plx:branch>
								<plx:condition>
									<plx:binaryOperator type="identityEquality">
										<plx:left>
											<plx:nameRef name="addRelationsMethod"/>
										</plx:left>
										<plx:right>
											<plx:nullKeyword/>
										</plx:right>
									</plx:binaryOperator>
								</plx:condition>
								<plx:throw>
									<plx:callNew dataTypeName="InvalidOperationException" dataTypeQualifier="System">
										<plx:passParam>
											<plx:string>The template method for converting a TList to a Dataset has been altered. Can not include child collections.</plx:string>
										</plx:passParam>
									</plx:callNew>
								</plx:throw>
							</plx:branch>
							<plx:local name="childDataset" dataTypeName=".object">
								<plx:initialize>
									<plx:nullKeyword/>
								</plx:initialize>
							</plx:local>
							<plx:assign>
								<plx:left>
									<plx:nameRef name="childDataset"/>
								</plx:left>
								<plx:right>
									<plx:callInstance name="Invoke">
										<plx:callObject>
											<plx:nameRef name="addRelationsMethod"/>
										</plx:callObject>
										<plx:passParam>
											<plx:callStatic name="ChangeType" dataTypeName="Convert" dataTypeQualifier="System">
												<plx:passParam>
													<plx:callInstance name="GetValue">
														<plx:callObject>
															<plx:nameRef name="child"/>
														</plx:callObject>
														<plx:passParam>
															<plx:nameRef name="childEntity"/>
														</plx:passParam>
													</plx:callInstance>
												</plx:passParam>
												<plx:passParam>
													<plx:callInstance name="PropertyType" type="property">
														<plx:callObject>
															<plx:nameRef name="child"/>
														</plx:callObject>
													</plx:callInstance>
												</plx:passParam>
											</plx:callStatic>
										</plx:passParam>
										<plx:passParam>
											<plx:nameRef name="childEntityParams"/>
										</plx:passParam>
									</plx:callInstance>
								</plx:right>
							</plx:assign>
							<plx:branch>
								<plx:condition>
									<plx:binaryOperator type="identityEquality">
										<plx:left>
											<plx:nameRef name="childDataset"/>
										</plx:left>
										<plx:right>
											<plx:nullKeyword/>
										</plx:right>
									</plx:binaryOperator>
								</plx:condition>
								<plx:throw>
									<plx:callNew dataTypeName="ArgumentException" dataTypeQualifier="System">
										<plx:passParam>
											<plx:string>Could not successfully convert nested child relationships to a dataset, consider a shallow conversion.</plx:string>
										</plx:passParam>
									</plx:callNew>
								</plx:throw>
							</plx:branch>
							<plx:assign>
								<plx:left>
									<plx:nameRef name="dataset" type="parameter"/>
								</plx:left>
								<plx:right>
									<plx:cast dataTypeName="DataSet" dataTypeQualifier="System.Data">
										<plx:nameRef name="childDataset"/>
									</plx:cast>
								</plx:right>
							</plx:assign>
						</plx:iterator>
					</plx:iterator>
				</plx:branch>
				<plx:return>
					<plx:nameRef name="dataset" type="parameter"/>
				</plx:return>
			</plx:function>
		</plx:class>
		<plx:class name="SortComparer" visibility="public">
			<plx:leadingInfo>
				<plx:docComment>
					<summary>
Generic Sort comparer for the <see cref="TList`1" /> class.
</summary>
					<typeparam name="T">Type of object to sort.</typeparam>
				</plx:docComment>
			</plx:leadingInfo>
			<plx:typeParam name="T"/>
			<plx:implementsInterface dataTypeName="IComparer" dataTypeQualifier="System.Collections.Generic">
				<plx:passTypeParam dataTypeName="T"/>
			</plx:implementsInterface>
			<plx:field name="m_SortCollection" visibility="private" dataTypeName="ListSortDescriptionCollection" dataTypeQualifier="System.ComponentModel">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Collection of properties to sort by.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:initialize>
					<plx:nullKeyword/>
				</plx:initialize>
			</plx:field>
			<plx:field name="m_PropDesc" visibility="private" dataTypeName="PropertyDescriptor" dataTypeQualifier="System.ComponentModel">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Property to sort by.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:initialize>
					<plx:nullKeyword/>
				</plx:initialize>
			</plx:field>
			<plx:field name="m_Direction" visibility="private" dataTypeName="ListSortDirection" dataTypeQualifier="System.ComponentModel">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Direction to sort by
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:initialize>
					<plx:callStatic dataTypeName="ListSortDirection" type="field" name="Ascending"/>
				</plx:initialize>
			</plx:field>
			<plx:field name="m_PropertyDescriptors" visibility="private" dataTypeName="PropertyDescriptorCollection" dataTypeQualifier="System.ComponentModel">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Collection of properties for T.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:initialize>
					<plx:nullKeyword/>
				</plx:initialize>
			</plx:field>
			<plx:function name=".construct" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Create a new instance of the SortComparer class.
</summary>
						<param name="propDesc">The <see cref="T:System.ComponentModel.PropertyDescriptor" /> to sort by.</param>
						<param name="direction">The <see cref="T:System.ComponentModel.ListSortDirection" /> to sort the list.</param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="propDesc" dataTypeName="PropertyDescriptor" dataTypeQualifier="System.ComponentModel"/>
				<plx:param name="direction" dataTypeName="ListSortDirection" dataTypeQualifier="System.ComponentModel"/>
				<plx:callThis name="Initialize"/>
				<plx:assign>
					<plx:left>
						<plx:callThis name="m_PropDesc" type="field"/>
					</plx:left>
					<plx:right>
						<plx:nameRef name="propDesc" type="parameter"/>
					</plx:right>
				</plx:assign>
				<plx:assign>
					<plx:left>
						<plx:callThis name="m_Direction" type="field"/>
					</plx:left>
					<plx:right>
						<plx:nameRef name="direction" type="parameter"/>
					</plx:right>
				</plx:assign>
			</plx:function>
			<plx:function name=".construct" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Create a new instance of the SortComparer class.
</summary>
						<param name="sortCollection">A <see cref="T:System.ComponentModel.ListSortDescriptionCollection" /> containing the properties to sort the list by.</param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="sortCollection" dataTypeName="ListSortDescriptionCollection" dataTypeQualifier="System.ComponentModel"/>
				<plx:callThis name="Initialize"/>
				<plx:assign>
					<plx:left>
						<plx:callThis name="m_SortCollection" type="field"/>
					</plx:left>
					<plx:right>
						<plx:nameRef name="sortCollection" type="parameter"/>
					</plx:right>
				</plx:assign>
			</plx:function>
			<plx:function name=".construct" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Create a new instance of the SortComparer class.
</summary>
						<param name="orderBy">SQL-like string representing the properties to sort the list by.</param>
						<remarks><i>orderBy</i> should be in the following format: 
<para>PropertyName[[ [[ASC]|DESC]][, PropertyName[ [[ASC]|DESC]][,...]]]</para>
</remarks>
						<example>
							<c>list.Sort("Property1, Property2 DESC, Property3 ASC");</c>
						</example>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="orderBy" dataTypeName=".string"/>
				<plx:callThis name="Initialize"/>
				<plx:assign>
					<plx:left>
						<plx:callThis name="m_SortCollection" type="field"/>
					</plx:left>
					<plx:right>
						<plx:callThis name="ParseOrderBy">
							<plx:passParam>
								<plx:nameRef name="orderBy" type="parameter"/>
							</plx:passParam>
						</plx:callThis>
					</plx:right>
				</plx:assign>
			</plx:function>
			<plx:function name="Compare" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Compares two objects and returns a value indicating whether one is less than, equal to, or greater than the other.
</summary>
						<param name="x">The first object to compare.</param>
						<param name="y">The second object to compare.</param>
						<returns>Value is less than zero: <c>x</c> is less than <c>y</c>
<para>Value is equal to zero: <c>x</c> equals <c>y</c></para>
<para>Value is greater than zero: <c>x</c> is greater than <c>y</c></para>
</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:interfaceMember memberName="Compare" dataTypeName="IComparer" dataTypeQualifier="System.Collections.Generic">
					<plx:passTypeParam dataTypeName="T"/>
				</plx:interfaceMember>
				<plx:param name="x" dataTypeName="T"/>
				<plx:param name="y" dataTypeName="T"/>
				<plx:returns dataTypeName=".i4"/>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="identityInequality">
							<plx:left>
								<plx:callThis name="m_PropDesc" type="field"/>
							</plx:left>
							<plx:right>
								<plx:nullKeyword/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:local name="xValue" dataTypeName=".object">
						<plx:initialize>
							<plx:callInstance name="GetValue">
								<plx:callObject>
									<plx:callThis name="m_PropDesc" type="field"/>
								</plx:callObject>
								<plx:passParam>
									<plx:nameRef name="x" type="parameter"/>
								</plx:passParam>
							</plx:callInstance>
						</plx:initialize>
					</plx:local>
					<plx:local name="yValue" dataTypeName=".object">
						<plx:initialize>
							<plx:callInstance name="GetValue">
								<plx:callObject>
									<plx:callThis name="m_PropDesc" type="field"/>
								</plx:callObject>
								<plx:passParam>
									<plx:nameRef name="y" type="parameter"/>
								</plx:passParam>
							</plx:callInstance>
						</plx:initialize>
					</plx:local>
					<plx:return>
						<plx:callThis name="CompareValues">
							<plx:passParam>
								<plx:nameRef name="xValue"/>
							</plx:passParam>
							<plx:passParam>
								<plx:nameRef name="yValue"/>
							</plx:passParam>
							<plx:passParam>
								<plx:callThis name="m_Direction" type="field"/>
							</plx:passParam>
						</plx:callThis>
					</plx:return>
				</plx:branch>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="booleanAnd">
							<plx:left>
								<plx:binaryOperator type="identityInequality">
									<plx:left>
										<plx:callThis name="m_SortCollection" type="field"/>
									</plx:left>
									<plx:right>
										<plx:nullKeyword/>
									</plx:right>
								</plx:binaryOperator>
							</plx:left>
							<plx:right>
								<plx:binaryOperator type="greaterThan">
									<plx:left>
										<plx:callInstance name="Count" type="property">
											<plx:callObject>
												<plx:callThis name="m_SortCollection" type="field"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:left>
									<plx:right>
										<plx:value data="0" type="i4"/>
									</plx:right>
								</plx:binaryOperator>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:return>
						<plx:callThis name="RecursiveCompareInternal">
							<plx:passParam>
								<plx:nameRef name="x" type="parameter"/>
							</plx:passParam>
							<plx:passParam>
								<plx:nameRef name="y" type="parameter"/>
							</plx:passParam>
							<plx:passParam>
								<plx:value data="0" type="i4"/>
							</plx:passParam>
						</plx:callThis>
					</plx:return>
				</plx:branch>
				<plx:return>
					<plx:value data="0" type="i4"/>
				</plx:return>
			</plx:function>
			<plx:function name="CompareValues" visibility="private">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Compare two objects
</summary>
						<param name="xValue">The first object to compare</param>
						<param name="yValue">The second object to compare</param>
						<param name="direction">The direction to sort the objects in</param>
						<returns>Returns an integer representing the order of the objects</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="xValue" dataTypeName=".object"/>
				<plx:param name="yValue" dataTypeName=".object"/>
				<plx:param name="direction" dataTypeName="ListSortDirection" dataTypeQualifier="System.ComponentModel"/>
				<plx:returns dataTypeName=".i4"/>
				<plx:local name="retValue" dataTypeName=".i4">
					<plx:initialize>
						<plx:value data="0" type="i4"/>
					</plx:initialize>
				</plx:local>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="booleanAnd">
							<plx:left>
								<plx:binaryOperator type="identityInequality">
									<plx:left>
										<plx:nameRef name="xValue" type="parameter"/>
									</plx:left>
									<plx:right>
										<plx:nullKeyword/>
									</plx:right>
								</plx:binaryOperator>
							</plx:left>
							<plx:right>
								<plx:binaryOperator type="identityEquality">
									<plx:left>
										<plx:nameRef name="yValue" type="parameter"/>
									</plx:left>
									<plx:right>
										<plx:nullKeyword/>
									</plx:right>
								</plx:binaryOperator>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:assign>
						<plx:left>
							<plx:nameRef name="retValue"/>
						</plx:left>
						<plx:right>
							<plx:value data="1" type="i4"/>
						</plx:right>
					</plx:assign>
				</plx:branch>
				<plx:alternateBranch>
					<plx:condition>
						<plx:binaryOperator type="booleanAnd">
							<plx:left>
								<plx:binaryOperator type="identityEquality">
									<plx:left>
										<plx:nameRef name="xValue" type="parameter"/>
									</plx:left>
									<plx:right>
										<plx:nullKeyword/>
									</plx:right>
								</plx:binaryOperator>
							</plx:left>
							<plx:right>
								<plx:binaryOperator type="identityInequality">
									<plx:left>
										<plx:nameRef name="yValue" type="parameter"/>
									</plx:left>
									<plx:right>
										<plx:nullKeyword/>
									</plx:right>
								</plx:binaryOperator>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:assign>
						<plx:left>
							<plx:nameRef name="retValue"/>
						</plx:left>
						<plx:right>
							<plx:value data="-1" type="i4"/>
						</plx:right>
					</plx:assign>
				</plx:alternateBranch>
				<plx:alternateBranch>
					<plx:condition>
						<plx:binaryOperator type="booleanAnd">
							<plx:left>
								<plx:binaryOperator type="identityEquality">
									<plx:left>
										<plx:nameRef name="xValue" type="parameter"/>
									</plx:left>
									<plx:right>
										<plx:nullKeyword/>
									</plx:right>
								</plx:binaryOperator>
							</plx:left>
							<plx:right>
								<plx:binaryOperator type="identityEquality">
									<plx:left>
										<plx:nameRef name="yValue" type="parameter"/>
									</plx:left>
									<plx:right>
										<plx:nullKeyword/>
									</plx:right>
								</plx:binaryOperator>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:assign>
						<plx:left>
							<plx:nameRef name="retValue"/>
						</plx:left>
						<plx:right>
							<plx:value data="0" type="i4"/>
						</plx:right>
					</plx:assign>
				</plx:alternateBranch>
				<plx:alternateBranch>
					<plx:condition>
						<plx:binaryOperator type="typeEquality">
							<plx:left>
								<plx:nameRef name="xValue" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:directTypeReference dataTypeName="IComparable" dataTypeQualifier="System"/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:assign>
						<plx:left>
							<plx:nameRef name="retValue"/>
						</plx:left>
						<plx:right>
							<plx:callInstance name="CompareTo">
								<plx:callObject>
									<plx:cast dataTypeName="IComparable" dataTypeQualifier="System">
										<plx:nameRef name="xValue" type="parameter"/>
									</plx:cast>
								</plx:callObject>
								<plx:passParam>
									<plx:nameRef name="yValue" type="parameter"/>
								</plx:passParam>
							</plx:callInstance>
						</plx:right>
					</plx:assign>
				</plx:alternateBranch>
				<plx:alternateBranch>
					<plx:condition>
						<plx:binaryOperator type="typeEquality">
							<plx:left>
								<plx:nameRef name="yValue" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:directTypeReference dataTypeName="IComparable" dataTypeQualifier="System"/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:assign>
						<plx:left>
							<plx:nameRef name="retValue"/>
						</plx:left>
						<plx:right>
							<plx:callInstance name="CompareTo">
								<plx:callObject>
									<plx:cast dataTypeName="IComparable" dataTypeQualifier="System">
										<plx:nameRef name="yValue" type="parameter"/>
									</plx:cast>
								</plx:callObject>
								<plx:passParam>
									<plx:nameRef name="xValue" type="parameter"/>
								</plx:passParam>
							</plx:callInstance>
						</plx:right>
					</plx:assign>
				</plx:alternateBranch>
				<plx:alternateBranch>
					<plx:condition>
						<plx:unaryOperator type="booleanNot">
							<plx:callInstance name="Equals">
								<plx:callObject>
									<plx:nameRef name="xValue" type="parameter"/>
								</plx:callObject>
								<plx:passParam>
									<plx:nameRef name="yValue" type="parameter"/>
								</plx:passParam>
							</plx:callInstance>
						</plx:unaryOperator>
					</plx:condition>
					<plx:assign>
						<plx:left>
							<plx:nameRef name="retValue"/>
						</plx:left>
						<plx:right>
							<plx:callInstance name="CompareTo">
								<plx:callObject>
									<plx:callInstance name="ToString">
										<plx:callObject>
											<plx:nameRef name="xValue" type="parameter"/>
										</plx:callObject>
									</plx:callInstance>
								</plx:callObject>
								<plx:passParam>
									<plx:callInstance name="ToString">
										<plx:callObject>
											<plx:nameRef name="yValue" type="parameter"/>
										</plx:callObject>
									</plx:callInstance>
								</plx:passParam>
							</plx:callInstance>
						</plx:right>
					</plx:assign>
				</plx:alternateBranch>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="equality">
							<plx:left>
								<plx:nameRef name="direction" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:callStatic name="Ascending" type="field" dataTypeName="ListSortDirection" dataTypeQualifier="System.ComponentModel"/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:return>
						<plx:nameRef name="retValue"/>
					</plx:return>
				</plx:branch>
				<plx:return>
					<plx:binaryOperator type="multiply">
						<plx:left>
							<plx:nameRef name="retValue"/>
						</plx:left>
						<plx:right>
							<plx:value data="-1" type="i4"/>
						</plx:right>
					</plx:binaryOperator>
				</plx:return>
			</plx:function>
			<plx:function name="RecursiveCompareInternal" visibility="private">
				<plx:param name="x" dataTypeName="T"/>
				<plx:param name="y" dataTypeName="T"/>
				<plx:param name="index" dataTypeName=".i4"/>
				<plx:returns dataTypeName=".i4"/>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="greaterThanOrEqual">
							<plx:left>
								<plx:nameRef name="index" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:callInstance name="Count" type="property">
									<plx:callObject>
										<plx:callThis name="m_SortCollection" type="field"/>
									</plx:callObject>
								</plx:callInstance>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:return>
						<plx:value data="0" type="i4"/>
					</plx:return>
				</plx:branch>
				<plx:local name="listSortDesc" dataTypeName="ListSortDescription" dataTypeQualifier="System.ComponentModel">
					<plx:initialize>
						<plx:callInstance name=".implied" type="indexerCall">
							<plx:callObject>
								<plx:callThis name="m_SortCollection" type="field"/>
							</plx:callObject>
							<plx:passParam>
								<plx:nameRef name="index" type="parameter"/>
							</plx:passParam>
						</plx:callInstance>
					</plx:initialize>
				</plx:local>
				<plx:local name="xValue" dataTypeName=".object">
					<plx:initialize>
						<plx:callInstance name="GetValue">
							<plx:callObject>
								<plx:callInstance name="PropertyDescriptor" type="property">
									<plx:callObject>
										<plx:nameRef name="listSortDesc"/>
									</plx:callObject>
								</plx:callInstance>
							</plx:callObject>
							<plx:passParam>
								<plx:nameRef name="x" type="parameter"/>
							</plx:passParam>
						</plx:callInstance>
					</plx:initialize>
				</plx:local>
				<plx:local name="yValue" dataTypeName=".object">
					<plx:initialize>
						<plx:callInstance name="GetValue">
							<plx:callObject>
								<plx:callInstance name="PropertyDescriptor" type="property">
									<plx:callObject>
										<plx:nameRef name="listSortDesc"/>
									</plx:callObject>
								</plx:callInstance>
							</plx:callObject>
							<plx:passParam>
								<plx:nameRef name="y" type="parameter"/>
							</plx:passParam>
						</plx:callInstance>
					</plx:initialize>
				</plx:local>
				<plx:local name="retValue" dataTypeName=".i4">
					<plx:initialize>
						<plx:callThis name="CompareValues">
							<plx:passParam>
								<plx:nameRef name="xValue"/>
							</plx:passParam>
							<plx:passParam>
								<plx:nameRef name="yValue"/>
							</plx:passParam>
							<plx:passParam>
								<plx:callInstance name="SortDirection" type="property">
									<plx:callObject>
										<plx:nameRef name="listSortDesc"/>
									</plx:callObject>
								</plx:callInstance>
							</plx:passParam>
						</plx:callThis>
					</plx:initialize>
				</plx:local>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="equality">
							<plx:left>
								<plx:nameRef name="retValue"/>
							</plx:left>
							<plx:right>
								<plx:value data="0" type="i4"/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:return>
						<plx:callThis name="RecursiveCompareInternal">
							<plx:passParam>
								<plx:nameRef name="x" type="parameter"/>
							</plx:passParam>
							<plx:passParam>
								<plx:nameRef name="y" type="parameter"/>
							</plx:passParam>
							<plx:passParam>
								<plx:inlineStatement dataTypeName=".i4">
									<plx:increment>
										<plx:nameRef name="index" type="parameter"/>
									</plx:increment>
								</plx:inlineStatement>
							</plx:passParam>
						</plx:callThis>
					</plx:return>
				</plx:branch>
				<plx:return>
					<plx:nameRef name="retValue"/>
				</plx:return>
			</plx:function>
			<plx:function name="ParseOrderBy" visibility="private">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Parses a string into a <see cref="T:System.ComponentModel.ListSortDescriptionCollection" />.
</summary>
						<param name="orderBy">SQL-like string of sort properties</param>
						<returns></returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="orderBy" dataTypeName=".string"/>
				<plx:returns dataTypeName="ListSortDescriptionCollection" dataTypeQualifier="System.ComponentModel"/>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="booleanOr">
							<plx:left>
								<plx:binaryOperator type="identityEquality">
									<plx:left>
										<plx:nameRef name="orderBy" type="parameter"/>
									</plx:left>
									<plx:right>
										<plx:nullKeyword/>
									</plx:right>
								</plx:binaryOperator>
							</plx:left>
							<plx:right>
								<plx:binaryOperator type="equality">
									<plx:left>
										<plx:callInstance name="Length" type="property">
											<plx:callObject>
												<plx:nameRef name="orderBy" type="parameter"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:left>
									<plx:right>
										<plx:value data="0" type="i4"/>
									</plx:right>
								</plx:binaryOperator>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:throw>
						<plx:callNew dataTypeName="ArgumentNullException" dataTypeQualifier="System">
							<plx:passParam>
								<plx:string>orderBy</plx:string>
							</plx:passParam>
						</plx:callNew>
					</plx:throw>
				</plx:branch>
				<plx:local name="props" dataTypeIsSimpleArray="true" dataTypeName=".string">
					<plx:initialize>
						<plx:callInstance name="Split">
							<plx:callObject>
								<plx:nameRef name="orderBy" type="parameter"/>
							</plx:callObject>
							<plx:passParam>
								<plx:value data="," type="char"/>
							</plx:passParam>
						</plx:callInstance>
					</plx:initialize>
				</plx:local>
				<plx:local name="sortProps" dataTypeIsSimpleArray="true" dataTypeName="ListSortDescription" dataTypeQualifier="System.ComponentModel">
					<plx:initialize>
						<plx:callNew dataTypeIsSimpleArray="true" dataTypeName="ListSortDescription" dataTypeQualifier="System.ComponentModel">
							<plx:passParam>
								<plx:callInstance name="Length" type="property">
									<plx:callObject>
										<plx:nameRef name="props"/>
									</plx:callObject>
								</plx:callInstance>
							</plx:passParam>
						</plx:callNew>
					</plx:initialize>
				</plx:local>
				<plx:local name="sortDirection" dataTypeName="ListSortDirection" dataTypeQualifier="System.ComponentModel">
					<plx:initialize>
						<plx:callStatic name="Ascending" type="field" dataTypeName="ListSortDirection" dataTypeQualifier="System.ComponentModel"/>
					</plx:initialize>
				</plx:local>
				<plx:loop>
					<plx:initializeLoop>
						<plx:local name="i" dataTypeName=".i4">
							<plx:initialize>
								<plx:value data="0" type="i4"/>
							</plx:initialize>
						</plx:local>
					</plx:initializeLoop>
					<plx:condition>
						<plx:binaryOperator type="lessThan">
							<plx:left>
								<plx:nameRef name="i"/>
							</plx:left>
							<plx:right>
								<plx:callInstance name="Length" type="property">
									<plx:callObject>
										<plx:nameRef name="props"/>
									</plx:callObject>
								</plx:callInstance>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:beforeLoop>
						<plx:increment>
							<plx:nameRef name="i"/>
						</plx:increment>
					</plx:beforeLoop>
					<plx:assign>
						<plx:left>
							<plx:nameRef name="sortDirection"/>
						</plx:left>
						<plx:right>
							<plx:callStatic name="Ascending" type="field" dataTypeName="ListSortDirection" dataTypeQualifier="System.ComponentModel"/>
						</plx:right>
					</plx:assign>
					<plx:local name="prop" dataTypeName=".string">
						<plx:initialize>
							<plx:callInstance name="Trim">
								<plx:callObject>
									<plx:callInstance name=".implied" type="arrayIndexer">
										<plx:callObject>
											<plx:nameRef name="props"/>
										</plx:callObject>
										<plx:passParam>
											<plx:nameRef name="i"/>
										</plx:passParam>
									</plx:callInstance>
								</plx:callObject>
							</plx:callInstance>
						</plx:initialize>
					</plx:local>
					<plx:branch>
						<plx:condition>
							<plx:callInstance name="EndsWith">
								<plx:callObject>
									<plx:callInstance name="ToUpper">
										<plx:callObject>
											<plx:nameRef name="prop"/>
										</plx:callObject>
									</plx:callInstance>
								</plx:callObject>
								<plx:passParam>
									<plx:string> DESC</plx:string>
								</plx:passParam>
							</plx:callInstance>
						</plx:condition>
						<plx:assign>
							<plx:left>
								<plx:nameRef name="sortDirection"/>
							</plx:left>
							<plx:right>
								<plx:callStatic name="Descending" type="field" dataTypeName="ListSortDirection" dataTypeQualifier="System.ComponentModel"/>
							</plx:right>
						</plx:assign>
						<plx:assign>
							<plx:left>
								<plx:nameRef name="prop"/>
							</plx:left>
							<plx:right>
								<plx:callInstance name="Substring">
									<plx:callObject>
										<plx:nameRef name="prop"/>
									</plx:callObject>
									<plx:passParam>
										<plx:value data="0" type="i4"/>
									</plx:passParam>
									<plx:passParam>
										<plx:callInstance name="LastIndexOf">
											<plx:callObject>
												<plx:callInstance name="ToUpper">
													<plx:callObject>
														<plx:nameRef name="prop"/>
													</plx:callObject>
												</plx:callInstance>
											</plx:callObject>
											<plx:passParam>
												<plx:string> DESC</plx:string>
											</plx:passParam>
										</plx:callInstance>
									</plx:passParam>
								</plx:callInstance>
							</plx:right>
						</plx:assign>
					</plx:branch>
					<plx:alternateBranch>
						<plx:condition>
							<plx:callInstance name="EndsWith">
								<plx:callObject>
									<plx:callInstance name="ToUpper">
										<plx:callObject>
											<plx:nameRef name="prop"/>
										</plx:callObject>
									</plx:callInstance>
								</plx:callObject>
								<plx:passParam>
									<plx:string> ASC</plx:string>
								</plx:passParam>
							</plx:callInstance>
						</plx:condition>
						<plx:assign>
							<plx:left>
								<plx:nameRef name="prop"/>
							</plx:left>
							<plx:right>
								<plx:callInstance name="Substring">
									<plx:callObject>
										<plx:nameRef name="prop"/>
									</plx:callObject>
									<plx:passParam>
										<plx:value data="0" type="i4"/>
									</plx:passParam>
									<plx:passParam>
										<plx:callInstance name="LastIndexOf">
											<plx:callObject>
												<plx:callInstance name="ToUpper">
													<plx:callObject>
														<plx:nameRef name="prop"/>
													</plx:callObject>
												</plx:callInstance>
											</plx:callObject>
											<plx:passParam>
												<plx:string> ASC</plx:string>
											</plx:passParam>
										</plx:callInstance>
									</plx:passParam>
								</plx:callInstance>
							</plx:right>
						</plx:assign>
					</plx:alternateBranch>
					<plx:assign>
						<plx:left>
							<plx:nameRef name="prop"/>
						</plx:left>
						<plx:right>
							<plx:callInstance name="Trim">
								<plx:callObject>
									<plx:nameRef name="prop"/>
								</plx:callObject>
							</plx:callInstance>
						</plx:right>
					</plx:assign>
					<plx:local name="propertyDescriptor" dataTypeName="PropertyDescriptor" dataTypeQualifier="System.ComponentModel">
						<plx:initialize>
							<plx:callInstance name=".implied" type="indexerCall">
								<plx:callObject>
									<plx:callThis name="m_PropertyDescriptors" type="field"/>
								</plx:callObject>
								<plx:passParam>
									<plx:nameRef name="prop"/>
								</plx:passParam>
							</plx:callInstance>
						</plx:initialize>
					</plx:local>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="identityEquality">
								<plx:left>
									<plx:nameRef name="propertyDescriptor"/>
								</plx:left>
								<plx:right>
									<plx:nullKeyword/>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:throw>
							<plx:callNew dataTypeName="ArgumentException" dataTypeQualifier="System">
								<plx:passParam>
									<plx:callStatic name="Format" dataTypeName=".string">
										<plx:passParam>
											<plx:string>The property "{0}" is not a valid property.</plx:string>
										</plx:passParam>
										<plx:passParam>
											<plx:nameRef name="prop"/>
										</plx:passParam>
									</plx:callStatic>
								</plx:passParam>
							</plx:callNew>
						</plx:throw>
					</plx:branch>
					<plx:assign>
						<plx:left>
							<plx:callInstance name=".implied" type="arrayIndexer">
								<plx:callObject>
									<plx:nameRef name="sortProps"/>
								</plx:callObject>
								<plx:passParam>
									<plx:nameRef name="i"/>
								</plx:passParam>
							</plx:callInstance>
						</plx:left>
						<plx:right>
							<plx:callNew dataTypeName="ListSortDescription" dataTypeQualifier="System.ComponentModel">
								<plx:passParam>
									<plx:nameRef name="propertyDescriptor"/>
								</plx:passParam>
								<plx:passParam>
									<plx:nameRef name="sortDirection"/>
								</plx:passParam>
							</plx:callNew>
						</plx:right>
					</plx:assign>
				</plx:loop>
				<plx:return>
					<plx:callNew dataTypeName="ListSortDescriptionCollection" dataTypeQualifier="System.ComponentModel">
						<plx:passParam>
							<plx:nameRef name="sortProps"/>
						</plx:passParam>
					</plx:callNew>
				</plx:return>
			</plx:function>
			<plx:function name="Initialize" visibility="private">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Initializes the SortComparer object
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:local name="instanceType" dataTypeName="Type" dataTypeQualifier="System">
					<plx:initialize>
						<plx:typeOf dataTypeName="T"/>
					</plx:initialize>
				</plx:local>
				<plx:branch>
					<plx:condition>
						<plx:unaryOperator type="booleanNot">
							<plx:callInstance name="IsPublic" type="property">
								<plx:callObject>
									<plx:nameRef name="instanceType"/>
								</plx:callObject>
							</plx:callInstance>
						</plx:unaryOperator>
					</plx:condition>
					<plx:throw>
						<plx:callNew dataTypeName="ArgumentException" dataTypeQualifier="System">
							<plx:passParam>
								<plx:callStatic name="Format" dataTypeName=".string">
									<plx:passParam>
										<plx:string>Type "{0}" is not public.</plx:string>
									</plx:passParam>
									<plx:passParam>
										<plx:callInstance name="FullName" type="property">
											<plx:callObject>
												<plx:typeOf dataTypeName="T"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:passParam>
								</plx:callStatic>
							</plx:passParam>
						</plx:callNew>
					</plx:throw>
				</plx:branch>
				<plx:assign>
					<plx:left>
						<plx:callThis name="m_PropertyDescriptors" type="field"/>
					</plx:left>
					<plx:right>
						<plx:callStatic name="GetProperties" dataTypeName="TypeDescriptor" dataTypeQualifier="System.ComponentModel">
							<plx:passParam>
								<plx:typeOf dataTypeName="T"/>
							</plx:passParam>
						</plx:callStatic>
					</plx:right>
				</plx:assign>
			</plx:function>
		</plx:class>
	</xsl:template>
	<xsl:template name="EntityInterfaces">
		<plx:enum name="EntityState" visibility="public">
			<plx:leadingInfo>
				<plx:docComment>
					<summary>
List of possible state for an entity.
</summary>
				</plx:docComment>
			</plx:leadingInfo>
			<plx:enumItem name="Unchanged">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Entity is unchanged
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:initialize>
					<plx:value data="0" type="i4"/>
				</plx:initialize>
			</plx:enumItem>
			<plx:enumItem name="Added">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Entity is new
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:initialize>
					<plx:value data="1" type="i4"/>
				</plx:initialize>
			</plx:enumItem>
			<plx:enumItem name="Changed">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Entity has been modified
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:initialize>
					<plx:value data="2" type="i4"/>
				</plx:initialize>
			</plx:enumItem>
			<plx:enumItem name="Deleted">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Entity has been deleted
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:initialize>
					<plx:value data="3" type="i4"/>
				</plx:initialize>
			</plx:enumItem>
		</plx:enum>
		<plx:interface name="IEntity" visibility="public">
			<plx:leadingInfo>
				<plx:docComment>
					<summary>
The interface that each business object of the model implements.
</summary>
				</plx:docComment>
			</plx:leadingInfo>
			<plx:property name="EntityTableName" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
The name of the underlying database table.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:returns dataTypeName=".string"/>
				<plx:get/>
			</plx:property>
			<plx:property name="IsDirty" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Indicates if the object has been modified from its original state.
</summary>
						<value>True if object has been modified from its original state; otherwise False;</value>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:returns dataTypeName=".boolean"/>
				<plx:get/>
			</plx:property>
			<plx:property name="IsNew" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Indicates if the object is new.
</summary>
						<value>True if objectis new; otherwise False;</value>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:returns dataTypeName=".boolean"/>
				<plx:get/>
			</plx:property>
			<plx:property name="IsDeleted" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
True if object has been marked as deleted. ReadOnly.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:returns dataTypeName=".boolean"/>
				<plx:get/>
			</plx:property>
			<plx:property name="IsValid" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Indicates if the object is in a valid state
</summary>
						<value>True if object is valid; otherwise False.</value>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:returns dataTypeName=".boolean"/>
				<plx:get/>
			</plx:property>
			<plx:property name="EntityState" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Returns one of EntityState enum values - intended to replace IsNew, IsDirty, IsDeleted.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:returns dataTypeName="EntityState"/>
				<plx:get/>
			</plx:property>
			<plx:property name="ParentCollection" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Gets or sets the parent collection.
</summary>
						<value>The parent collection.</value>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:returns dataTypeName=".object"/>
				<plx:get/>
				<plx:set/>
			</plx:property>
			<plx:property name="TableColumns" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
The name of the underlying database table's columns.
</summary>
						<value>A string array that holds the columns names.</value>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:returns dataTypeIsSimpleArray="true" dataTypeName=".string"/>
				<plx:get/>
			</plx:property>
			<plx:property name="Tag" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Gets or sets the object that contains supplemental data about this object.
</summary>
						<value>Object</value>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:returns dataTypeName=".object"/>
				<plx:get/>
				<plx:set/>
			</plx:property>
			<plx:property name="IsEntityTracked" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Determines whether this entity is being tracked.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:returns dataTypeName=".boolean"/>
				<plx:get/>
				<plx:set/>
			</plx:property>
			<plx:property name="EntityTrackingKey" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
The tracking key used to with the <see cref="EntityLocator" />
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:returns dataTypeName=".string"/>
				<plx:get/>
				<plx:set/>
			</plx:property>
			<!-- Make property for columns that have the same name and type in the tables -->
			<xsl:variable name="allTableColumnsFragment">
				<xsl:for-each select="se:databaseSchema/se:tables/se:table/se:columns/se:column">
					<xsl:sort select="@name"/>
					<xsl:copy-of select="."/>
				</xsl:for-each>
			</xsl:variable>
			<xsl:variable name="allTableColumns" select="exsl:node-set($allTableColumnsFragment)/child::*"/>
			<xsl:variable name="tableCount" select="count(se:databaseSchema/se:tables/se:table)"/>
			<xsl:for-each select="$allTableColumns">
				<xsl:if test="not(preceding-sibling::*[1]/@name=@name)">
					<xsl:if test="count(following-sibling::*[position()&lt;$tableCount][@name=current()/@name][@nativeType=current()/@nativeType])=($tableCount - 1)">
						<xsl:variable name="columnDescription" select="se:description"/>
						<xsl:variable name="nativeType" select="@nativeType"/>
						<xsl:variable name="columnName" select="@name"/>
						<plx:property name="{$columnName}" visibility="public">
							<plx:leadingInfo>
								<plx:docComment>
									<summary>
										<xsl:value-of select="$columnDescription"/>
									</summary>
								</plx:docComment>
							</plx:leadingInfo>
							<plx:returns dataTypeName="{$nativeType}"/>
							<plx:get/>
						</plx:property>
					</xsl:if>
				</xsl:if>
			</xsl:for-each>
			<plx:event name="PropertyChanged" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Event to indicate that a property has changed.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="sender" dataTypeName=".object"/>
				<plx:param name="e" dataTypeName="PropertyChangedEventArgs" dataTypeQualifier="System.ComponentModel"/>
				<plx:explicitDelegateType dataTypeName="PropertyChangedEventHandler" dataTypeQualifier="System.ComponentModel"/>
				<plx:onAdd>
					<plx:attribute dataTypeName="MethodImplAttribute" dataTypeQualifier="System.Runtime.CompilerServices">
						<plx:passParam>
							<plx:callStatic name="Synchronized" type="field" dataTypeName="MethodImplOptions" dataTypeQualifier="System.Runtime.CompilerServices"/>
						</plx:passParam>
					</plx:attribute>
				</plx:onAdd>
				<plx:onRemove>
					<plx:attribute dataTypeName="MethodImplAttribute" dataTypeQualifier="System.Runtime.CompilerServices">
						<plx:passParam>
							<plx:callStatic name="Synchronized" type="field" dataTypeName="MethodImplOptions" dataTypeQualifier="System.Runtime.CompilerServices"/>
						</plx:passParam>
					</plx:attribute>
				</plx:onRemove>
			</plx:event>
			<plx:function name="AcceptChanges" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Accepts the changes made to this object by setting each flags to false.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
			</plx:function>
			<plx:function name="MarkToDelete" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Marks entity to be deleted.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
			</plx:function>
		</plx:interface>
		<plx:interface name="IEntityCacheItem" visibility="internal">
			<plx:property name="EntityCacheDuration" visibility="public">
				<plx:returns dataTypeName="TimeSpan" dataTypeQualifier="System"/>
				<plx:get/>
				<plx:set/>
			</plx:property>
			<plx:property name="EntityCacheItemPriority" visibility="public">
				<plx:returns dataTypeName="CacheItemPriority" dataTypeQualifier="Microsoft.Practices.EnterpriseLibrary.Caching"/>
				<plx:get/>
				<plx:set/>
			</plx:property>
			<plx:property name="EntityCacheItemExpiration" visibility="public">
				<plx:returns dataTypeName="ICacheItemExpiration" dataTypeQualifier="Microsoft.Practices.EnterpriseLibrary.Caching"/>
				<plx:get/>
				<plx:set/>
			</plx:property>
			<plx:property name="EntityCacheItemRefreshAction" visibility="public">
				<plx:returns dataTypeName="ICacheItemRefreshAction" dataTypeQualifier="Microsoft.Practices.EnterpriseLibrary.Caching"/>
				<plx:get/>
				<plx:set/>
			</plx:property>
		</plx:interface>
		<plx:interface name="IEntityFactory" visibility="public">
			<plx:leadingInfo>
				<plx:docComment>
					<summary>
Exposes a factory to create an entity based on a typeString and a default type.
</summary>
				</plx:docComment>
			</plx:leadingInfo>
			<plx:property name="CurrentEntityAssembly" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Gets the current assembly responsible for entity creation.
</summary>
						<value>The current assembly.</value>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:returns dataTypeName="Assembly" dataTypeQualifier="System.Reflection"/>
				<plx:get/>
				<plx:set/>
			</plx:property>
			<plx:function name="CreateEntity" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Create an entity based on a string.  
It will autodiscover the type based on any information we can gather.
</summary>
						<param name="typeString">string of entity to discover and create</param>
						<param name="defaultType">if string is not found defaultType will be created.</param>
						<returns>Created IEntity object</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="typeString" dataTypeName=".string"/>
				<plx:param name="defaultType" dataTypeName="Type" dataTypeQualifier="System"/>
				<plx:returns dataTypeName="IEntity"/>
			</plx:function>
			<plx:function name="CreateViewEntity" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Create a readonly entity based on a string for views.  
It will autodiscover the type based on any information we can gather.
</summary>
						<param name="typeString">string of entity to discover and create</param>
						<param name="defaultType">if string is not found defaultType will be created.</param>
						<returns>Created IEntity object</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="typeString" dataTypeName=".string"/>
				<plx:param name="defaultType" dataTypeName="Type" dataTypeQualifier="System"/>
				<plx:returns dataTypeName=".object"/>
			</plx:function>
		</plx:interface>
		<plx:interface name="IEntityId" visibility="public">
			<plx:leadingInfo>
				<plx:docComment>
					<summary>
Defines a common property which represents the
unique identifier for a business object.
</summary>
					<typeparam name="EntityKey">The value type or class to be used for the EntityId property.</typeparam>
				</plx:docComment>
			</plx:leadingInfo>
			<plx:typeParam name="EntityKey" requireDefaultConstructor="true">
				<plx:typeConstraint dataTypeName="IEntityKey"/>
			</plx:typeParam>
			<plx:implementsInterface dataTypeName="IEntity"/>
			<plx:property name="EntityId" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Gets or sets the value of the unique identifier
for the current business object.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:returns dataTypeName="EntityKey"/>
				<plx:get/>
				<plx:set/>
			</plx:property>
		</plx:interface>
		<plx:interface name="IEntityKey" visibility="public">
			<plx:leadingInfo>
				<plx:docComment>
					<summary>
Defines a method that allows setting of property values
based on the key/value pairs of an IDictionary object.
</summary>
				</plx:docComment>
			</plx:leadingInfo>
			<plx:function name="Load" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Reads values from the supplied IDictionary object into
properties of the current object.
</summary>
						<param name="values">An IDictionary instance that contains the key/value pairs to be used as property values.</param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="values" dataTypeName="IDictionary" dataTypeQualifier="System.Collections"/>
			</plx:function>
			<plx:function name="ToDictionary" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Creates a new <see cref="T:System.Collections.IDictionary" /> object and populates it
with the property values of the current object.
</summary>
						<returns>A collection of name/value pairs.</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:returns dataTypeName="IDictionary" dataTypeQualifier="System.Collections"/>
			</plx:function>
		</plx:interface>
	</xsl:template>
	<xsl:template name="GenericTypeConverter">
		<plx:class name="GenericTypeConverter" visibility="public">
			<plx:leadingInfo>
				<plx:docComment>
					<summary>
Provides a unified way of converting types of values to other types, as well as for accessing standard values and subproperties.
Used by the nettiers strongly typed collection, so they can be saved in ViewState.
</summary>
				</plx:docComment>
			</plx:leadingInfo>
			<plx:derivesFromClass dataTypeName="TypeConverter" dataTypeQualifier="System.ComponentModel"/>
			<plx:function name=".construct" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Initializes a new instance of the <see cref="GenericTypeConverter" /> class.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
			</plx:function>
			<plx:function name="CanConvertTo" visibility="public" modifier="override">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Returns whether this converter can convert the object to the specified type.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="context" dataTypeName="ITypeDescriptorContext" dataTypeQualifier="System.ComponentModel"/>
				<plx:param name="destinationType" dataTypeName="Type" dataTypeQualifier="System"/>
				<plx:returns dataTypeName=".boolean"/>
				<plx:return>
					<plx:binaryOperator type="booleanOr">
						<plx:left>
							<plx:binaryOperator type="identityEquality">
								<plx:left>
									<plx:nameRef name="destinationType" type="parameter"/>
								</plx:left>
								<plx:right>
									<plx:typeOf dataTypeName="InstanceDescriptor" dataTypeQualifier="System.ComponentModel.Design.Serialization"/>
								</plx:right>
							</plx:binaryOperator>
						</plx:left>
						<plx:right>
							<plx:callThis name="CanConvertTo" accessor="base">
								<plx:passParam>
									<plx:nameRef name="context" type="parameter"/>
								</plx:passParam>
								<plx:passParam>
									<plx:nameRef name="destinationType" type="parameter"/>
								</plx:passParam>
							</plx:callThis>
						</plx:right>
					</plx:binaryOperator>
				</plx:return>
			</plx:function>
			<plx:function name="ConvertTo" visibility="public" modifier="override">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Converts the given value object to the specified type.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="context" dataTypeName="ITypeDescriptorContext" dataTypeQualifier="System.ComponentModel"/>
				<plx:param name="culture" dataTypeName="CultureInfo" dataTypeQualifier="System.Globalization"/>
				<plx:param name="val" dataTypeName=".object"/>
				<plx:param name="destinationType" dataTypeName="Type" dataTypeQualifier="System"/>
				<plx:returns dataTypeName=".object"/>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="identityEquality">
							<plx:left>
								<plx:nameRef name="destinationType" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:typeOf dataTypeName="InstanceDescriptor" dataTypeQualifier="System.ComponentModel.Design.Serialization"/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:return>
						<plx:callNew dataTypeName="InstanceDescriptor" dataTypeQualifier="System.ComponentModel.Design.Serialization">
							<plx:passParam>
								<plx:callInstance name="GetConstructor">
									<plx:callObject>
										<plx:callInstance name="GetType">
											<plx:callObject>
												<plx:nameRef name="val" type="parameter"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:callObject>
									<plx:passParam>
										<plx:callStatic name="EmptyTypes" type="field" dataTypeName="Type" dataTypeQualifier="System"/>
									</plx:passParam>
								</plx:callInstance>
							</plx:passParam>
							<plx:passParam>
								<plx:nullKeyword/>
							</plx:passParam>
							<plx:passParam>
								<plx:falseKeyword/>
							</plx:passParam>
						</plx:callNew>
					</plx:return>
				</plx:branch>
				<plx:return>
					<plx:callThis name="ConvertTo" accessor="base">
						<plx:passParam>
							<plx:nameRef name="context" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:nameRef name="culture" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:nameRef name="val" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:nameRef name="destinationType" type="parameter"/>
						</plx:passParam>
					</plx:callThis>
				</plx:return>
			</plx:function>
		</plx:class>
	</xsl:template>
	<xsl:template name="Filter">
		<plx:class name="Expressions" visibility="public" modifier="sealed">
			<plx:leadingInfo>
				<plx:docComment>
					<summary>
Hold a list of <see cref="Expression" /> instance.
</summary>
				</plx:docComment>
			</plx:leadingInfo>
			<plx:derivesFromClass dataTypeName="CollectionBase" dataTypeQualifier="System.Collections"/>
			<plx:function name=".construct" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Initializes a new instance of the <c>Expressions</c> class.
</summary>
						<param name="holeFilterExpression">the filter expression that will be parsed to create the collection.</param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="holeFilterExpression" dataTypeName=".string"/>
				<plx:callThis name="SplitFilter">
					<plx:passParam>
						<plx:nameRef name="holeFilterExpression" type="parameter"/>
					</plx:passParam>
				</plx:callThis>
			</plx:function>
			<plx:function name=".construct" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Initializes a new instance of the <c>Expressions</c> class.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
			</plx:function>
			<plx:function name="SplitFilter" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
This method split a string filter expression anc create <c>EntityFilter</c> instances.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="HoleFilterExpression" dataTypeName=".string"/>
				<plx:local name="LastPosition" dataTypeName=".i4">
					<plx:initialize>
						<plx:value data="0" type="i4"/>
					</plx:initialize>
				</plx:local>
				<plx:loop>
					<plx:initializeLoop>
						<plx:local name="j" dataTypeName=".i4">
							<plx:initialize>
								<plx:value data="5" type="i4"/>
							</plx:initialize>
						</plx:local>
					</plx:initializeLoop>
					<plx:condition>
						<plx:binaryOperator type="lessThanOrEqual">
							<plx:left>
								<plx:nameRef name="j"/>
							</plx:left>
							<plx:right>
								<plx:binaryOperator type="subtract">
									<plx:left>
										<plx:callInstance name="Length" type="property">
											<plx:callObject>
												<plx:nameRef name="HoleFilterExpression" type="parameter"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:left>
									<plx:right>
										<plx:value data="5" type="i4"/>
									</plx:right>
								</plx:binaryOperator>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:beforeLoop>
						<plx:increment>
							<plx:nameRef name="j"/>
						</plx:increment>
					</plx:beforeLoop>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="equality">
								<plx:left>
									<plx:callInstance name="ToUpper">
										<plx:callObject>
											<plx:callInstance name="Substring">
												<plx:callObject>
													<plx:nameRef name="HoleFilterExpression" type="parameter"/>
												</plx:callObject>
												<plx:passParam>
													<plx:binaryOperator type="subtract">
														<plx:left>
															<plx:nameRef name="j"/>
														</plx:left>
														<plx:right>
															<plx:value data="5" type="i4"/>
														</plx:right>
													</plx:binaryOperator>
												</plx:passParam>
												<plx:passParam>
													<plx:value data="5" type="i4"/>
												</plx:passParam>
											</plx:callInstance>
										</plx:callObject>
									</plx:callInstance>
								</plx:left>
								<plx:right>
									<plx:string> AND </plx:string>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:callThis name="Add">
							<plx:passParam>
								<plx:callNew dataTypeName="Expression">
									<plx:passParam>
										<plx:callInstance name="Substring">
											<plx:callObject>
												<plx:nameRef name="HoleFilterExpression" type="parameter"/>
											</plx:callObject>
											<plx:passParam>
												<plx:nameRef name="LastPosition"/>
											</plx:passParam>
											<plx:passParam>
												<plx:binaryOperator type="subtract">
													<plx:left>
														<plx:binaryOperator type="subtract">
															<plx:left>
																<plx:nameRef name="j"/>
															</plx:left>
															<plx:right>
																<plx:nameRef name="LastPosition"/>
															</plx:right>
														</plx:binaryOperator>
													</plx:left>
													<plx:right>
														<plx:value data="5" type="i4"/>
													</plx:right>
												</plx:binaryOperator>
											</plx:passParam>
										</plx:callInstance>
									</plx:passParam>
								</plx:callNew>
							</plx:passParam>
						</plx:callThis>
						<plx:assign>
							<plx:left>
								<plx:nameRef name="LastPosition"/>
							</plx:left>
							<plx:right>
								<plx:nameRef name="j"/>
							</plx:right>
						</plx:assign>
					</plx:branch>
				</plx:loop>
				<plx:loop>
					<plx:initializeLoop>
						<plx:local name="z" dataTypeName=".i4">
							<plx:initialize>
								<plx:value data="4" type="i4"/>
							</plx:initialize>
						</plx:local>
					</plx:initializeLoop>
					<plx:condition>
						<plx:binaryOperator type="lessThanOrEqual">
							<plx:left>
								<plx:nameRef name="z"/>
							</plx:left>
							<plx:right>
								<plx:binaryOperator type="subtract">
									<plx:left>
										<plx:callInstance name="Length" type="property">
											<plx:callObject>
												<plx:nameRef name="HoleFilterExpression" type="parameter"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:left>
									<plx:right>
										<plx:value data="4" type="i4"/>
									</plx:right>
								</plx:binaryOperator>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:beforeLoop>
						<plx:increment>
							<plx:nameRef name="z"/>
						</plx:increment>
					</plx:beforeLoop>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="equality">
								<plx:left>
									<plx:callInstance name="ToUpper">
										<plx:callObject>
											<plx:callInstance name="Substring">
												<plx:callObject>
													<plx:nameRef name="HoleFilterExpression" type="parameter"/>
												</plx:callObject>
												<plx:passParam>
													<plx:binaryOperator type="subtract">
														<plx:left>
															<plx:nameRef name="z"/>
														</plx:left>
														<plx:right>
															<plx:value data="4" type="i4"/>
														</plx:right>
													</plx:binaryOperator>
												</plx:passParam>
												<plx:passParam>
													<plx:value data="4" type="i4"/>
												</plx:passParam>
											</plx:callInstance>
										</plx:callObject>
									</plx:callInstance>
								</plx:left>
								<plx:right>
									<plx:string> OR </plx:string>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:callThis name="Add">
							<plx:passParam>
								<plx:callNew dataTypeName="Expression">
									<plx:passParam>
										<plx:callInstance name="Substring">
											<plx:callObject>
												<plx:nameRef name="HoleFilterExpression" type="parameter"/>
											</plx:callObject>
											<plx:passParam>
												<plx:nameRef name="LastPosition"/>
											</plx:passParam>
											<plx:passParam>
												<plx:binaryOperator type="subtract">
													<plx:left>
														<plx:binaryOperator type="subtract">
															<plx:left>
																<plx:nameRef name="z"/>
															</plx:left>
															<plx:right>
																<plx:nameRef name="LastPosition"/>
															</plx:right>
														</plx:binaryOperator>
													</plx:left>
													<plx:right>
														<plx:value data="4" type="i4"/>
													</plx:right>
												</plx:binaryOperator>
											</plx:passParam>
										</plx:callInstance>
									</plx:passParam>
								</plx:callNew>
							</plx:passParam>
						</plx:callThis>
						<plx:assign>
							<plx:left>
								<plx:nameRef name="LastPosition"/>
							</plx:left>
							<plx:right>
								<plx:nameRef name="z"/>
							</plx:right>
						</plx:assign>
					</plx:branch>
				</plx:loop>
				<plx:callThis name="Add">
					<plx:passParam>
						<plx:callNew dataTypeName="Expression">
							<plx:passParam>
								<plx:callInstance name="Substring">
									<plx:callObject>
										<plx:nameRef name="HoleFilterExpression" type="parameter"/>
									</plx:callObject>
									<plx:passParam>
										<plx:nameRef name="LastPosition"/>
									</plx:passParam>
								</plx:callInstance>
							</plx:passParam>
						</plx:callNew>
					</plx:passParam>
				</plx:callThis>
			</plx:function>
			<plx:function name="Item" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Get the <see cref="Expression" /> at the specified index.
</summary>
						<param name="Index">The index of the expression in the collection.</param>
						<returns></returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="Index" dataTypeName=".i4"/>
				<plx:returns dataTypeName="Expression"/>
				<plx:return>
					<plx:cast dataTypeName="Expression">
						<plx:callInstance name=".implied" type="indexerCall">
							<plx:callObject>
								<plx:callThis name="List" type="property"/>
							</plx:callObject>
							<plx:passParam>
								<plx:nameRef name="Index" type="parameter"/>
							</plx:passParam>
						</plx:callInstance>
					</plx:cast>
				</plx:return>
			</plx:function>
			<plx:function name="Add" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Adds the specified value.
</summary>
						<param name="value">The value.</param>
						<returns></returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="value" dataTypeName="Expression"/>
				<plx:returns dataTypeName=".i4"/>
				<plx:return>
					<plx:callInstance name="Add">
						<plx:callObject>
							<plx:callThis name="List" type="property"/>
						</plx:callObject>
						<plx:passParam>
							<plx:nameRef name="value" type="parameter"/>
						</plx:passParam>
					</plx:callInstance>
				</plx:return>
			</plx:function>
			<plx:function name="Remove" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Removes the specified value.
</summary>
						<param name="value">The value.</param>
						<returns></returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="value" dataTypeName="Expression"/>
				<plx:callInstance name="Remove">
					<plx:callObject>
						<plx:callThis name="List" type="property"/>
					</plx:callObject>
					<plx:passParam>
						<plx:nameRef name="value" type="parameter"/>
					</plx:passParam>
				</plx:callInstance>
			</plx:function>
		</plx:class>
		<plx:class name="Expression" visibility="public" modifier="sealed">
			<plx:leadingInfo>
				<plx:docComment>
					<summary>
Reprensents an expression to filter a collection.
</summary>
				</plx:docComment>
			</plx:leadingInfo>
			<plx:field name="TmpPropertyValue" visibility="private" dataTypeName=".string"/>
			<plx:field name="TmpOperator" visibility="private" dataTypeName=".string"/>
			<plx:field name="TmpUserValue" visibility="private" dataTypeName=".string"/>
			<plx:property name="PropertyName" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Gets or sets the name of the property.
</summary>
						<value>The name of the property.</value>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:returns dataTypeName=".string"/>
				<plx:get>
					<plx:return>
						<plx:callThis name="TmpPropertyValue" type="field"/>
					</plx:return>
				</plx:get>
				<plx:set>
					<plx:assign>
						<plx:left>
							<plx:callThis name="TmpPropertyValue" type="field"/>
						</plx:left>
						<plx:right>
							<plx:nameRef name="value" type="parameter"/>
						</plx:right>
					</plx:assign>
				</plx:set>
			</plx:property>
			<plx:property name="Operator" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Gets or sets the operator.
</summary>
						<value>The operator.</value>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:returns dataTypeName=".string"/>
				<plx:get>
					<plx:return>
						<plx:callThis name="TmpOperator" type="field"/>
					</plx:return>
				</plx:get>
				<plx:set>
					<plx:assign>
						<plx:left>
							<plx:callThis name="TmpOperator" type="field"/>
						</plx:left>
						<plx:right>
							<plx:nameRef name="value" type="parameter"/>
						</plx:right>
					</plx:assign>
				</plx:set>
			</plx:property>
			<plx:property name="UserValue" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Gets or sets the user value.
</summary>
						<value>The user value.</value>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:returns dataTypeName=".string"/>
				<plx:get>
					<plx:return>
						<plx:callThis name="TmpUserValue" type="field"/>
					</plx:return>
				</plx:get>
				<plx:set>
					<plx:assign>
						<plx:left>
							<plx:callThis name="TmpUserValue" type="field"/>
						</plx:left>
						<plx:right>
							<plx:nameRef name="value" type="parameter"/>
						</plx:right>
					</plx:assign>
				</plx:set>
			</plx:property>
			<plx:function name=".construct" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Initializes a new instance of the <see cref="Expression" /> class.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
			</plx:function>
			<plx:function name=".construct" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Initializes a new instance of the <see cref="Expression" /> class.
</summary>
						<param name="PropValue">The prop value.</param>
						<param name="Opr">The opr.</param>
						<param name="Usrvalue">The usrvalue.</param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="PropValue" dataTypeName=".string"/>
				<plx:param name="Opr" dataTypeName=".string"/>
				<plx:param name="Usrvalue" dataTypeName=".string"/>
				<plx:assign>
					<plx:left>
						<plx:callThis name="PropertyName" type="property"/>
					</plx:left>
					<plx:right>
						<plx:nameRef name="PropValue" type="parameter"/>
					</plx:right>
				</plx:assign>
				<plx:assign>
					<plx:left>
						<plx:callThis name="Operator" type="property"/>
					</plx:left>
					<plx:right>
						<plx:nameRef name="Opr" type="parameter"/>
					</plx:right>
				</plx:assign>
				<plx:assign>
					<plx:left>
						<plx:callThis name="UserValue" type="property"/>
					</plx:left>
					<plx:right>
						<plx:nameRef name="Usrvalue" type="parameter"/>
					</plx:right>
				</plx:assign>
			</plx:function>
			<plx:function name=".construct" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Initializes a new instance of the <see cref="Expression" /> class.
</summary>
						<param name="wholeExpression">The whole expression.</param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="wholeExpression" dataTypeName=".string"/>
				<plx:local name="Words" dataTypeIsSimpleArray="true" dataTypeName=".string">
					<plx:initialize>
						<plx:callNew dataTypeIsSimpleArray="true" dataTypeName=".string">
							<plx:passParam>
								<plx:value data="2" type="i4"/>
							</plx:passParam>
						</plx:callNew>
					</plx:initialize>
				</plx:local>
				<plx:assign>
					<plx:left>
						<plx:nameRef name="Words"/>
					</plx:left>
					<plx:right>
						<plx:callInstance name="Split">
							<plx:callObject>
								<plx:nameRef name="wholeExpression" type="parameter"/>
							</plx:callObject>
							<plx:passParam>
								<plx:callNew dataTypeIsSimpleArray="true" dataTypeName=".char">
									<plx:arrayInitializer>
										<plx:value data=" " type="char"/>
									</plx:arrayInitializer>
								</plx:callNew>
							</plx:passParam>
							<plx:passParam>
								<plx:value data="3" type="i4"/>
							</plx:passParam>
						</plx:callInstance>
					</plx:right>
				</plx:assign>
				<plx:assign>
					<plx:left>
						<plx:callThis name="PropertyName" type="property"/>
					</plx:left>
					<plx:right>
						<plx:callInstance name=".implied" type="arrayIndexer">
							<plx:callObject>
								<plx:nameRef name="Words"/>
							</plx:callObject>
							<plx:passParam>
								<plx:value data="0" type="i4"/>
							</plx:passParam>
						</plx:callInstance>
					</plx:right>
				</plx:assign>
				<plx:assign>
					<plx:left>
						<plx:callThis name="Operator" type="property"/>
					</plx:left>
					<plx:right>
						<plx:callInstance name="Trim">
							<plx:callObject>
								<plx:callInstance name=".implied" type="arrayIndexer">
									<plx:callObject>
										<plx:nameRef name="Words"/>
									</plx:callObject>
									<plx:passParam>
										<plx:value data="1" type="i4"/>
									</plx:passParam>
								</plx:callInstance>
							</plx:callObject>
						</plx:callInstance>
					</plx:right>
				</plx:assign>
				<plx:assign>
					<plx:left>
						<plx:callThis name="UserValue" type="property"/>
					</plx:left>
					<plx:right>
						<plx:callInstance name="Trim">
							<plx:callObject>
								<plx:callInstance name=".implied" type="arrayIndexer">
									<plx:callObject>
										<plx:nameRef name="Words"/>
									</plx:callObject>
									<plx:passParam>
										<plx:value data="2" type="i4"/>
									</plx:passParam>
								</plx:callInstance>
							</plx:callObject>
						</plx:callInstance>
					</plx:right>
				</plx:assign>
			</plx:function>
		</plx:class>
		<plx:class name="Filter" visibility="public" modifier="sealed">
			<plx:leadingInfo>
				<plx:docComment>
					<summary>
Represents a filter.
</summary>
				</plx:docComment>
			</plx:leadingInfo>
			<plx:typeParam name="T">
				<plx:typeConstraint dataTypeName="ListBase">
					<plx:passTypeParam dataTypeName="Entity"/>
				</plx:typeConstraint>
			</plx:typeParam>
			<plx:typeParam name="Entity"/>
			<plx:function name=".construct" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Initializes a new instance of the <see cref="T:Filter&lt;T, Entity&gt;" /> class.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
			</plx:function>
			<plx:function name=".construct" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Initializes a new instance of the <see cref="T:Filter&lt;T, Entity&gt;" /> class.
</summary>
						<param name="objToFilter">The obj to filter.</param>
						<param name="filter">The filter.</param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="objToFilter" dataTypeName="T"/>
				<plx:param name="filter" dataTypeName=".string"/>
				<plx:callThis name="ApplyFilter">
					<plx:passParam>
						<plx:nameRef name="objToFilter" type="parameter"/>
					</plx:passParam>
					<plx:passParam>
						<plx:nameRef name="filter" type="parameter"/>
					</plx:passParam>
				</plx:callThis>
			</plx:function>
			<plx:function name="IsOk" visibility="private">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Determines whether the specified object property value is ok.
</summary>
						<param name="ObjectPropertyValue">The object property value.</param>
						<param name="Operator">The operator.</param>
						<param name="UserValue">The user value.</param>
						<returns>
<c>true</c> if the specified object property value is ok; otherwise, <c>false</c>.
</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="ObjectPropertyValue" dataTypeName=".string"/>
				<plx:param name="Operator" dataTypeName=".string"/>
				<plx:param name="UserValue" dataTypeName=".string"/>
				<plx:returns dataTypeName=".boolean"/>
				<plx:local name="Rt" dataTypeName=".boolean">
					<plx:initialize>
						<plx:falseKeyword/>
					</plx:initialize>
				</plx:local>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="equality">
							<plx:left>
								<plx:nameRef name="Operator" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:string>=</plx:string>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="equality">
								<plx:left>
									<plx:callInstance name="TrimEnd">
										<plx:callObject>
											<plx:nameRef name="ObjectPropertyValue" type="parameter"/>
										</plx:callObject>
										<plx:passParamArray dataTypeIsSimpleArray="true" dataTypeName=".char"/>
									</plx:callInstance>
								</plx:left>
								<plx:right>
									<plx:callInstance name="TrimEnd">
										<plx:callObject>
											<plx:nameRef name="UserValue" type="parameter"/>
										</plx:callObject>
										<plx:passParamArray dataTypeIsSimpleArray="true" dataTypeName=".char"/>
									</plx:callInstance>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:assign>
							<plx:left>
								<plx:nameRef name="Rt"/>
							</plx:left>
							<plx:right>
								<plx:trueKeyword/>
							</plx:right>
						</plx:assign>
					</plx:branch>
					<plx:return>
						<plx:nameRef name="Rt"/>
					</plx:return>
				</plx:branch>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="booleanOr">
							<plx:left>
								<plx:binaryOperator type="equality">
									<plx:left>
										<plx:nameRef name="Operator" type="parameter"/>
									</plx:left>
									<plx:right>
										<plx:string>&lt;&gt;</plx:string>
									</plx:right>
								</plx:binaryOperator>
							</plx:left>
							<plx:right>
								<plx:binaryOperator type="equality">
									<plx:left>
										<plx:nameRef name="Operator" type="parameter"/>
									</plx:left>
									<plx:right>
										<plx:string>!=</plx:string>
									</plx:right>
								</plx:binaryOperator>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="inequality">
								<plx:left>
									<plx:callInstance name="TrimEnd">
										<plx:callObject>
											<plx:nameRef name="ObjectPropertyValue" type="parameter"/>
										</plx:callObject>
										<plx:passParamArray dataTypeIsSimpleArray="true" dataTypeName=".char"/>
									</plx:callInstance>
								</plx:left>
								<plx:right>
									<plx:callInstance name="TrimEnd">
										<plx:callObject>
											<plx:nameRef name="UserValue" type="parameter"/>
										</plx:callObject>
										<plx:passParamArray dataTypeIsSimpleArray="true" dataTypeName=".char"/>
									</plx:callInstance>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:assign>
							<plx:left>
								<plx:nameRef name="Rt"/>
							</plx:left>
							<plx:right>
								<plx:trueKeyword/>
							</plx:right>
						</plx:assign>
					</plx:branch>
					<plx:return>
						<plx:nameRef name="Rt"/>
					</plx:return>
				</plx:branch>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="inequality">
							<plx:left>
								<plx:callInstance name="ToUpper">
									<plx:callObject>
										<plx:nameRef name="Operator" type="parameter"/>
									</plx:callObject>
								</plx:callInstance>
							</plx:left>
							<plx:right>
								<plx:string>LIKE</plx:string>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:throw>
						<plx:callNew dataTypeName="Exception" dataTypeQualifier="System">
							<plx:passParam>
								<plx:callStatic name="Concat" dataTypeName=".string">
									<plx:passParam>
										<plx:string>The operator '</plx:string>
									</plx:passParam>
									<plx:passParam>
										<plx:nameRef name="Operator" type="parameter"/>
									</plx:passParam>
									<plx:passParam>
										<plx:string>' does not match the type String !</plx:string>
									</plx:passParam>
								</plx:callStatic>
							</plx:passParam>
						</plx:callNew>
					</plx:throw>
				</plx:branch>
				<plx:local name="SearchedText" dataTypeName=".string">
					<plx:initialize>
						<plx:callInstance name="ToLower">
							<plx:callObject>
								<plx:callInstance name="Replace">
									<plx:callObject>
										<plx:nameRef name="UserValue" type="parameter"/>
									</plx:callObject>
									<plx:passParam>
										<plx:string>*</plx:string>
									</plx:passParam>
									<plx:passParam>
										<plx:string/>
									</plx:passParam>
								</plx:callInstance>
							</plx:callObject>
						</plx:callInstance>
					</plx:initialize>
				</plx:local>
				<plx:branch>
					<plx:condition>
						<plx:unaryOperator type="booleanNot">
							<plx:callInstance name="StartsWith">
								<plx:callObject>
									<plx:nameRef name="UserValue" type="parameter"/>
								</plx:callObject>
								<plx:passParam>
									<plx:string>*</plx:string>
								</plx:passParam>
							</plx:callInstance>
						</plx:unaryOperator>
					</plx:condition>
					<plx:return>
						<plx:callInstance name="StartsWith">
							<plx:callObject>
								<plx:callInstance name="ToLower">
									<plx:callObject>
										<plx:nameRef name="ObjectPropertyValue" type="parameter"/>
									</plx:callObject>
								</plx:callInstance>
							</plx:callObject>
							<plx:passParam>
								<plx:nameRef name="SearchedText"/>
							</plx:passParam>
						</plx:callInstance>
					</plx:return>
				</plx:branch>
				<plx:branch>
					<plx:condition>
						<plx:unaryOperator type="booleanNot">
							<plx:callInstance name="EndsWith">
								<plx:callObject>
									<plx:nameRef name="UserValue" type="parameter"/>
								</plx:callObject>
								<plx:passParam>
									<plx:string>*</plx:string>
								</plx:passParam>
							</plx:callInstance>
						</plx:unaryOperator>
					</plx:condition>
					<plx:return>
						<plx:callInstance name="EndsWith">
							<plx:callObject>
								<plx:callInstance name="ToLower">
									<plx:callObject>
										<plx:nameRef name="ObjectPropertyValue" type="parameter"/>
									</plx:callObject>
								</plx:callInstance>
							</plx:callObject>
							<plx:passParam>
								<plx:nameRef name="SearchedText"/>
							</plx:passParam>
						</plx:callInstance>
					</plx:return>
				</plx:branch>
				<!-- Why are these here?
				<plx:local name="LastStrar" dataTypeName=".i4">
					<plx:initialize>
						<plx:callInstance name="LastIndexOf">
							<plx:callObject>
								<plx:nameRef name="UserValue" type="parameter"/>
							</plx:callObject>
							<plx:passParam>
								<plx:string>*</plx:string>
							</plx:passParam>
						</plx:callInstance>
					</plx:initialize>
				</plx:local>
				<plx:local name="UserValueLenght" dataTypeName=".i4">
					<plx:initialize>
						<plx:callInstance name="Length" type="property">
							<plx:callObject>
								<plx:nameRef name="UserValue" type="parameter"/>
							</plx:callObject>
						</plx:callInstance>
					</plx:initialize>
				</plx:local>
					-->
				<plx:return>
					<plx:binaryOperator type="greaterThan">
						<plx:left>
							<plx:callInstance name="IndexOf">
								<plx:callObject>
									<plx:callInstance name="ToLower">
										<plx:callObject>
											<plx:nameRef name="ObjectPropertyValue" type="parameter"/>
										</plx:callObject>
									</plx:callInstance>
								</plx:callObject>
								<plx:passParam>
									<plx:nameRef name="SearchedText"/>
								</plx:passParam>
							</plx:callInstance>
						</plx:left>
						<plx:right>
							<plx:value data="-1" type="i4"/>
						</plx:right>
					</plx:binaryOperator>
				</plx:return>
			</plx:function>
			<plx:function name="IsOk" visibility="private">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Determines whether the specified object property value is ok.
</summary>
						<param name="ObjectPropertyValue">The object property value.</param>
						<param name="Operator">The operator.</param>
						<param name="UserValue">The user value.</param>
						<returns>
<c>true</c> if the specified object property value is ok; otherwise, <c>false</c>.
</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="ObjectPropertyValue" dataTypeName=".i4"/>
				<plx:param name="Operator" dataTypeName=".string"/>
				<plx:param name="UserValue" dataTypeName=".i4"/>
				<plx:returns dataTypeName=".boolean"/>
				<plx:local name="Rt" dataTypeName=".boolean">
					<plx:initialize>
						<plx:falseKeyword/>
					</plx:initialize>
				</plx:local>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="equality">
							<plx:left>
								<plx:nameRef name="Operator" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:string>=</plx:string>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="equality">
								<plx:left>
									<plx:nameRef name="ObjectPropertyValue" type="parameter"/>
								</plx:left>
								<plx:right>
									<plx:nameRef name="UserValue" type="parameter"/>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:assign>
							<plx:left>
								<plx:nameRef name="Rt"/>
							</plx:left>
							<plx:right>
								<plx:trueKeyword/>
							</plx:right>
						</plx:assign>
					</plx:branch>
					<plx:return>
						<plx:nameRef name="Rt"/>
					</plx:return>
				</plx:branch>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="equality">
							<plx:left>
								<plx:nameRef name="Operator" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:string>&gt;</plx:string>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="greaterThan">
								<plx:left>
									<plx:nameRef name="ObjectPropertyValue" type="parameter"/>
								</plx:left>
								<plx:right>
									<plx:nameRef name="UserValue" type="parameter"/>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:assign>
							<plx:left>
								<plx:nameRef name="Rt"/>
							</plx:left>
							<plx:right>
								<plx:trueKeyword/>
							</plx:right>
						</plx:assign>
					</plx:branch>
					<plx:return>
						<plx:nameRef name="Rt"/>
					</plx:return>
				</plx:branch>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="equality">
							<plx:left>
								<plx:nameRef name="Operator" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:string>&gt;=</plx:string>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="greaterThanOrEqual">
								<plx:left>
									<plx:nameRef name="ObjectPropertyValue" type="parameter"/>
								</plx:left>
								<plx:right>
									<plx:nameRef name="UserValue" type="parameter"/>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:assign>
							<plx:left>
								<plx:nameRef name="Rt"/>
							</plx:left>
							<plx:right>
								<plx:trueKeyword/>
							</plx:right>
						</plx:assign>
					</plx:branch>
					<plx:return>
						<plx:nameRef name="Rt"/>
					</plx:return>
				</plx:branch>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="equality">
							<plx:left>
								<plx:nameRef name="Operator" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:string>&lt;</plx:string>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="lessThan">
								<plx:left>
									<plx:nameRef name="ObjectPropertyValue" type="parameter"/>
								</plx:left>
								<plx:right>
									<plx:nameRef name="UserValue" type="parameter"/>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:assign>
							<plx:left>
								<plx:nameRef name="Rt"/>
							</plx:left>
							<plx:right>
								<plx:trueKeyword/>
							</plx:right>
						</plx:assign>
					</plx:branch>
					<plx:return>
						<plx:nameRef name="Rt"/>
					</plx:return>
				</plx:branch>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="equality">
							<plx:left>
								<plx:nameRef name="Operator" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:string>&lt;=</plx:string>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="lessThanOrEqual">
								<plx:left>
									<plx:nameRef name="ObjectPropertyValue" type="parameter"/>
								</plx:left>
								<plx:right>
									<plx:nameRef name="UserValue" type="parameter"/>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:assign>
							<plx:left>
								<plx:nameRef name="Rt"/>
							</plx:left>
							<plx:right>
								<plx:trueKeyword/>
							</plx:right>
						</plx:assign>
					</plx:branch>
					<plx:return>
						<plx:nameRef name="Rt"/>
					</plx:return>
				</plx:branch>
				<plx:branch>
					<plx:condition>
						<plx:unaryOperator type="booleanNot">
							<plx:binaryOperator type="booleanOr">
								<plx:left>
									<plx:binaryOperator type="equality">
										<plx:left>
											<plx:nameRef name="Operator" type="parameter"/>
										</plx:left>
										<plx:right>
											<plx:string>&lt;&gt;</plx:string>
										</plx:right>
									</plx:binaryOperator>
								</plx:left>
								<plx:right>
									<plx:binaryOperator type="equality">
										<plx:left>
											<plx:nameRef name="Operator" type="parameter"/>
										</plx:left>
										<plx:right>
											<plx:string>!=</plx:string>
										</plx:right>
									</plx:binaryOperator>
								</plx:right>
							</plx:binaryOperator>
						</plx:unaryOperator>
					</plx:condition>
					<plx:throw>
						<plx:callNew dataTypeName="Exception" dataTypeQualifier="System">
							<plx:passParam>
								<plx:callStatic name="Concat" dataTypeName=".string">
									<plx:passParam>
										<plx:string>The operator '</plx:string>
									</plx:passParam>
									<plx:passParam>
										<plx:nameRef name="Operator" type="parameter"/>
									</plx:passParam>
									<plx:passParam>
										<plx:string>' does not match the type int !</plx:string>
									</plx:passParam>
								</plx:callStatic>
							</plx:passParam>
						</plx:callNew>
					</plx:throw>
				</plx:branch>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="inequality">
							<plx:left>
								<plx:nameRef name="ObjectPropertyValue" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:nameRef name="UserValue" type="parameter"/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:assign>
						<plx:left>
							<plx:nameRef name="Rt"/>
						</plx:left>
						<plx:right>
							<plx:trueKeyword/>
						</plx:right>
					</plx:assign>
				</plx:branch>
				<plx:return>
					<plx:nameRef name="Rt"/>
				</plx:return>
			</plx:function>
			<plx:function name="IsOk" visibility="private">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Determines whether the specified object property value is ok.
</summary>
						<param name="ObjectPropertyValue">The object property value.</param>
						<param name="Operator">The operator.</param>
						<param name="UserValue">The user value.</param>
						<returns>
<c>true</c> if the specified object property value is ok; otherwise, <c>false</c>.
</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="ObjectPropertyValue" dataTypeName=".decimal"/>
				<plx:param name="Operator" dataTypeName=".string"/>
				<plx:param name="UserValue" dataTypeName=".i4"/>
				<plx:returns dataTypeName=".boolean"/>
				<plx:local name="Rt" dataTypeName=".boolean">
					<plx:initialize>
						<plx:falseKeyword/>
					</plx:initialize>
				</plx:local>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="equality">
							<plx:left>
								<plx:nameRef name="Operator" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:string>=</plx:string>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="equality">
								<plx:left>
									<plx:nameRef name="ObjectPropertyValue" type="parameter"/>
								</plx:left>
								<plx:right>
									<plx:nameRef name="UserValue" type="parameter"/>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:assign>
							<plx:left>
								<plx:nameRef name="Rt"/>
							</plx:left>
							<plx:right>
								<plx:trueKeyword/>
							</plx:right>
						</plx:assign>
					</plx:branch>
					<plx:return>
						<plx:nameRef name="Rt"/>
					</plx:return>
				</plx:branch>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="equality">
							<plx:left>
								<plx:nameRef name="Operator" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:string>&gt;</plx:string>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="greaterThan">
								<plx:left>
									<plx:nameRef name="ObjectPropertyValue" type="parameter"/>
								</plx:left>
								<plx:right>
									<plx:nameRef name="UserValue" type="parameter"/>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:assign>
							<plx:left>
								<plx:nameRef name="Rt"/>
							</plx:left>
							<plx:right>
								<plx:trueKeyword/>
							</plx:right>
						</plx:assign>
					</plx:branch>
					<plx:return>
						<plx:nameRef name="Rt"/>
					</plx:return>
				</plx:branch>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="equality">
							<plx:left>
								<plx:nameRef name="Operator" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:string>&gt;=</plx:string>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="greaterThanOrEqual">
								<plx:left>
									<plx:nameRef name="ObjectPropertyValue" type="parameter"/>
								</plx:left>
								<plx:right>
									<plx:nameRef name="UserValue" type="parameter"/>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:assign>
							<plx:left>
								<plx:nameRef name="Rt"/>
							</plx:left>
							<plx:right>
								<plx:trueKeyword/>
							</plx:right>
						</plx:assign>
					</plx:branch>
					<plx:return>
						<plx:nameRef name="Rt"/>
					</plx:return>
				</plx:branch>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="equality">
							<plx:left>
								<plx:nameRef name="Operator" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:string>&lt;</plx:string>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="lessThan">
								<plx:left>
									<plx:nameRef name="ObjectPropertyValue" type="parameter"/>
								</plx:left>
								<plx:right>
									<plx:nameRef name="UserValue" type="parameter"/>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:assign>
							<plx:left>
								<plx:nameRef name="Rt"/>
							</plx:left>
							<plx:right>
								<plx:trueKeyword/>
							</plx:right>
						</plx:assign>
					</plx:branch>
					<plx:return>
						<plx:nameRef name="Rt"/>
					</plx:return>
				</plx:branch>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="equality">
							<plx:left>
								<plx:nameRef name="Operator" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:string>&lt;=</plx:string>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="lessThanOrEqual">
								<plx:left>
									<plx:nameRef name="ObjectPropertyValue" type="parameter"/>
								</plx:left>
								<plx:right>
									<plx:nameRef name="UserValue" type="parameter"/>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:assign>
							<plx:left>
								<plx:nameRef name="Rt"/>
							</plx:left>
							<plx:right>
								<plx:trueKeyword/>
							</plx:right>
						</plx:assign>
					</plx:branch>
					<plx:return>
						<plx:nameRef name="Rt"/>
					</plx:return>
				</plx:branch>
				<plx:branch>
					<plx:condition>
						<plx:unaryOperator type="booleanNot">
							<plx:binaryOperator type="booleanOr">
								<plx:left>
									<plx:binaryOperator type="equality">
										<plx:left>
											<plx:nameRef name="Operator" type="parameter"/>
										</plx:left>
										<plx:right>
											<plx:string>&lt;&gt;</plx:string>
										</plx:right>
									</plx:binaryOperator>
								</plx:left>
								<plx:right>
									<plx:binaryOperator type="equality">
										<plx:left>
											<plx:nameRef name="Operator" type="parameter"/>
										</plx:left>
										<plx:right>
											<plx:string>!=</plx:string>
										</plx:right>
									</plx:binaryOperator>
								</plx:right>
							</plx:binaryOperator>
						</plx:unaryOperator>
					</plx:condition>
					<plx:throw>
						<plx:callNew dataTypeName="Exception" dataTypeQualifier="System">
							<plx:passParam>
								<plx:callStatic name="Concat" dataTypeName=".string">
									<plx:passParam>
										<plx:string>The operator '</plx:string>
									</plx:passParam>
									<plx:passParam>
										<plx:nameRef name="Operator" type="parameter"/>
									</plx:passParam>
									<plx:passParam>
										<plx:string>' does not match the type int !</plx:string>
									</plx:passParam>
								</plx:callStatic>
							</plx:passParam>
						</plx:callNew>
					</plx:throw>
				</plx:branch>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="inequality">
							<plx:left>
								<plx:nameRef name="ObjectPropertyValue" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:nameRef name="UserValue" type="parameter"/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:assign>
						<plx:left>
							<plx:nameRef name="Rt"/>
						</plx:left>
						<plx:right>
							<plx:trueKeyword/>
						</plx:right>
					</plx:assign>
				</plx:branch>
				<plx:return>
					<plx:nameRef name="Rt"/>
				</plx:return>
			</plx:function>
			<plx:function name="IsOk" visibility="private">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Determines whether the specified object property value is ok.
</summary>
						<param name="ObjectPropertyValue">The object property value.</param>
						<param name="Operator">The operator.</param>
						<param name="UserValue">The user value.</param>
						<returns>
<c>true</c> if the specified object property value is ok; otherwise, <c>false</c>.
</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="ObjectPropertyValue" dataTypeName="Guid" dataTypeQualifier="System"/>
				<plx:param name="Operator" dataTypeName=".string"/>
				<plx:param name="UserValue" dataTypeName="Guid" dataTypeQualifier="System"/>
				<plx:returns dataTypeName=".boolean"/>
				<plx:local name="Rt" dataTypeName=".boolean">
					<plx:initialize>
						<plx:falseKeyword/>
					</plx:initialize>
				</plx:local>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="inequality">
							<plx:left>
								<plx:nameRef name="Operator" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:string>=</plx:string>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:throw>
						<plx:callNew dataTypeName="Exception" dataTypeQualifier="System">
							<plx:passParam>
								<plx:callStatic name="Concat" dataTypeName=".string">
									<plx:passParam>
										<plx:string>The operator '</plx:string>
									</plx:passParam>
									<plx:passParam>
										<plx:nameRef name="Operator" type="parameter"/>
									</plx:passParam>
									<plx:passParam>
										<plx:string>' does not match the type Guid !</plx:string>
									</plx:passParam>
								</plx:callStatic>
							</plx:passParam>
						</plx:callNew>
					</plx:throw>
				</plx:branch>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="equality">
							<plx:left>
								<plx:nameRef name="ObjectPropertyValue" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:nameRef name="UserValue" type="parameter"/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:assign>
						<plx:left>
							<plx:nameRef name="Rt"/>
						</plx:left>
						<plx:right>
							<plx:trueKeyword/>
						</plx:right>
					</plx:assign>
				</plx:branch>
				<plx:return>
					<plx:nameRef name="Rt"/>
				</plx:return>
			</plx:function>
			<plx:function name="IsOk" visibility="private">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Determines whether the specified object property value is ok.
</summary>
						<param name="ObjectPropertyValue">The object property value.</param>
						<param name="Operator">The operator.</param>
						<param name="UserValue">The user value.</param>
						<returns>
<c>true</c> if the specified object property value is ok; otherwise, <c>false</c>.
</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="ObjectPropertyValue" dataTypeName=".r8"/>
				<plx:param name="Operator" dataTypeName=".string"/>
				<plx:param name="UserValue" dataTypeName=".r8"/>
				<plx:returns dataTypeName=".boolean"/>
				<plx:local name="Rt" dataTypeName=".boolean">
					<plx:initialize>
						<plx:falseKeyword/>
					</plx:initialize>
				</plx:local>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="equality">
							<plx:left>
								<plx:nameRef name="Operator" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:string>=</plx:string>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="equality">
								<plx:left>
									<plx:nameRef name="ObjectPropertyValue" type="parameter"/>
								</plx:left>
								<plx:right>
									<plx:nameRef name="UserValue" type="parameter"/>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:assign>
							<plx:left>
								<plx:nameRef name="Rt"/>
							</plx:left>
							<plx:right>
								<plx:trueKeyword/>
							</plx:right>
						</plx:assign>
					</plx:branch>
					<plx:return>
						<plx:nameRef name="Rt"/>
					</plx:return>
				</plx:branch>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="equality">
							<plx:left>
								<plx:nameRef name="Operator" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:string>&gt;</plx:string>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="greaterThan">
								<plx:left>
									<plx:nameRef name="ObjectPropertyValue" type="parameter"/>
								</plx:left>
								<plx:right>
									<plx:nameRef name="UserValue" type="parameter"/>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:assign>
							<plx:left>
								<plx:nameRef name="Rt"/>
							</plx:left>
							<plx:right>
								<plx:trueKeyword/>
							</plx:right>
						</plx:assign>
					</plx:branch>
					<plx:return>
						<plx:nameRef name="Rt"/>
					</plx:return>
				</plx:branch>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="equality">
							<plx:left>
								<plx:nameRef name="Operator" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:string>&gt;=</plx:string>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="greaterThanOrEqual">
								<plx:left>
									<plx:nameRef name="ObjectPropertyValue" type="parameter"/>
								</plx:left>
								<plx:right>
									<plx:nameRef name="UserValue" type="parameter"/>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:assign>
							<plx:left>
								<plx:nameRef name="Rt"/>
							</plx:left>
							<plx:right>
								<plx:trueKeyword/>
							</plx:right>
						</plx:assign>
					</plx:branch>
					<plx:return>
						<plx:nameRef name="Rt"/>
					</plx:return>
				</plx:branch>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="equality">
							<plx:left>
								<plx:nameRef name="Operator" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:string>&lt;</plx:string>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="lessThan">
								<plx:left>
									<plx:nameRef name="ObjectPropertyValue" type="parameter"/>
								</plx:left>
								<plx:right>
									<plx:nameRef name="UserValue" type="parameter"/>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:assign>
							<plx:left>
								<plx:nameRef name="Rt"/>
							</plx:left>
							<plx:right>
								<plx:trueKeyword/>
							</plx:right>
						</plx:assign>
					</plx:branch>
					<plx:return>
						<plx:nameRef name="Rt"/>
					</plx:return>
				</plx:branch>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="inequality">
							<plx:left>
								<plx:nameRef name="Operator" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:string>&lt;=</plx:string>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:throw>
						<plx:callNew dataTypeName="Exception" dataTypeQualifier="System">
							<plx:passParam>
								<plx:callStatic name="Concat" dataTypeName=".string">
									<plx:passParam>
										<plx:string>The operator '</plx:string>
									</plx:passParam>
									<plx:passParam>
										<plx:nameRef name="Operator" type="parameter"/>
									</plx:passParam>
									<plx:passParam>
										<plx:string>' does not match the type double !</plx:string>
									</plx:passParam>
								</plx:callStatic>
							</plx:passParam>
						</plx:callNew>
					</plx:throw>
				</plx:branch>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="lessThanOrEqual">
							<plx:left>
								<plx:nameRef name="ObjectPropertyValue" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:nameRef name="UserValue" type="parameter"/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:assign>
						<plx:left>
							<plx:nameRef name="Rt"/>
						</plx:left>
						<plx:right>
							<plx:trueKeyword/>
						</plx:right>
					</plx:assign>
				</plx:branch>
				<plx:return>
					<plx:nameRef name="Rt"/>
				</plx:return>
			</plx:function>
			<plx:function name="IsOk" visibility="private">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Determines whether the specified object property value is ok.
</summary>
						<param name="ObjectPropertyValue">The object property value.</param>
						<param name="Operator">The operator.</param>
						<param name="UserValue">The user value.</param>
						<returns>
<c>true</c> if the specified object property value is ok; otherwise, <c>false</c>.
</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="ObjectPropertyValue" dataTypeName=".i8"/>
				<plx:param name="Operator" dataTypeName=".string"/>
				<plx:param name="UserValue" dataTypeName=".i8"/>
				<plx:returns dataTypeName=".boolean"/>
				<plx:local name="Rt" dataTypeName=".boolean">
					<plx:initialize>
						<plx:falseKeyword/>
					</plx:initialize>
				</plx:local>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="equality">
							<plx:left>
								<plx:nameRef name="Operator" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:string>=</plx:string>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="equality">
								<plx:left>
									<plx:nameRef name="ObjectPropertyValue" type="parameter"/>
								</plx:left>
								<plx:right>
									<plx:nameRef name="UserValue" type="parameter"/>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:assign>
							<plx:left>
								<plx:nameRef name="Rt"/>
							</plx:left>
							<plx:right>
								<plx:trueKeyword/>
							</plx:right>
						</plx:assign>
					</plx:branch>
					<plx:return>
						<plx:nameRef name="Rt"/>
					</plx:return>
				</plx:branch>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="equality">
							<plx:left>
								<plx:nameRef name="Operator" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:string>&gt;</plx:string>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="greaterThan">
								<plx:left>
									<plx:nameRef name="ObjectPropertyValue" type="parameter"/>
								</plx:left>
								<plx:right>
									<plx:nameRef name="UserValue" type="parameter"/>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:assign>
							<plx:left>
								<plx:nameRef name="Rt"/>
							</plx:left>
							<plx:right>
								<plx:trueKeyword/>
							</plx:right>
						</plx:assign>
					</plx:branch>
					<plx:return>
						<plx:nameRef name="Rt"/>
					</plx:return>
				</plx:branch>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="equality">
							<plx:left>
								<plx:nameRef name="Operator" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:string>&gt;=</plx:string>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="greaterThanOrEqual">
								<plx:left>
									<plx:nameRef name="ObjectPropertyValue" type="parameter"/>
								</plx:left>
								<plx:right>
									<plx:nameRef name="UserValue" type="parameter"/>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:assign>
							<plx:left>
								<plx:nameRef name="Rt"/>
							</plx:left>
							<plx:right>
								<plx:trueKeyword/>
							</plx:right>
						</plx:assign>
					</plx:branch>
					<plx:return>
						<plx:nameRef name="Rt"/>
					</plx:return>
				</plx:branch>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="equality">
							<plx:left>
								<plx:nameRef name="Operator" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:string>&lt;</plx:string>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="lessThan">
								<plx:left>
									<plx:nameRef name="ObjectPropertyValue" type="parameter"/>
								</plx:left>
								<plx:right>
									<plx:nameRef name="UserValue" type="parameter"/>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:assign>
							<plx:left>
								<plx:nameRef name="Rt"/>
							</plx:left>
							<plx:right>
								<plx:trueKeyword/>
							</plx:right>
						</plx:assign>
					</plx:branch>
					<plx:return>
						<plx:nameRef name="Rt"/>
					</plx:return>
				</plx:branch>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="inequality">
							<plx:left>
								<plx:nameRef name="Operator" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:string>&lt;=</plx:string>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:throw>
						<plx:callNew dataTypeName="Exception" dataTypeQualifier="System">
							<plx:passParam>
								<plx:callStatic name="Concat" dataTypeName=".string">
									<plx:passParam>
										<plx:string>The operator '</plx:string>
									</plx:passParam>
									<plx:passParam>
										<plx:nameRef name="Operator" type="parameter"/>
									</plx:passParam>
									<plx:passParam>
										<plx:string>' does not match the type double !</plx:string>
									</plx:passParam>
								</plx:callStatic>
							</plx:passParam>
						</plx:callNew>
					</plx:throw>
				</plx:branch>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="lessThanOrEqual">
							<plx:left>
								<plx:nameRef name="ObjectPropertyValue" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:nameRef name="UserValue" type="parameter"/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:assign>
						<plx:left>
							<plx:nameRef name="Rt"/>
						</plx:left>
						<plx:right>
							<plx:trueKeyword/>
						</plx:right>
					</plx:assign>
				</plx:branch>
				<plx:return>
					<plx:nameRef name="Rt"/>
				</plx:return>
			</plx:function>
			<plx:function name="IsOk" visibility="private">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Determines whether the specified object property value is ok.
</summary>
						<param name="ObjectPropertyValue">The object property value.</param>
						<param name="Operator">The operator.</param>
						<param name="UserValue">The user value.</param>
						<returns>
<c>true</c> if the specified object property value is ok; otherwise, <c>false</c>.
</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="ObjectPropertyValue" dataTypeName=".decimal"/>
				<plx:param name="Operator" dataTypeName=".string"/>
				<plx:param name="UserValue" dataTypeName=".decimal"/>
				<plx:returns dataTypeName=".boolean"/>
				<plx:local name="Rt" dataTypeName=".boolean">
					<plx:initialize>
						<plx:falseKeyword/>
					</plx:initialize>
				</plx:local>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="equality">
							<plx:left>
								<plx:nameRef name="Operator" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:string>=</plx:string>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="equality">
								<plx:left>
									<plx:nameRef name="ObjectPropertyValue" type="parameter"/>
								</plx:left>
								<plx:right>
									<plx:nameRef name="UserValue" type="parameter"/>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:assign>
							<plx:left>
								<plx:nameRef name="Rt"/>
							</plx:left>
							<plx:right>
								<plx:trueKeyword/>
							</plx:right>
						</plx:assign>
					</plx:branch>
					<plx:return>
						<plx:nameRef name="Rt"/>
					</plx:return>
				</plx:branch>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="equality">
							<plx:left>
								<plx:nameRef name="Operator" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:string>&gt;</plx:string>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="greaterThan">
								<plx:left>
									<plx:nameRef name="ObjectPropertyValue" type="parameter"/>
								</plx:left>
								<plx:right>
									<plx:nameRef name="UserValue" type="parameter"/>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:assign>
							<plx:left>
								<plx:nameRef name="Rt"/>
							</plx:left>
							<plx:right>
								<plx:trueKeyword/>
							</plx:right>
						</plx:assign>
					</plx:branch>
					<plx:return>
						<plx:nameRef name="Rt"/>
					</plx:return>
				</plx:branch>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="equality">
							<plx:left>
								<plx:nameRef name="Operator" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:string>&gt;=</plx:string>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="greaterThanOrEqual">
								<plx:left>
									<plx:nameRef name="ObjectPropertyValue" type="parameter"/>
								</plx:left>
								<plx:right>
									<plx:nameRef name="UserValue" type="parameter"/>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:assign>
							<plx:left>
								<plx:nameRef name="Rt"/>
							</plx:left>
							<plx:right>
								<plx:trueKeyword/>
							</plx:right>
						</plx:assign>
					</plx:branch>
					<plx:return>
						<plx:nameRef name="Rt"/>
					</plx:return>
				</plx:branch>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="equality">
							<plx:left>
								<plx:nameRef name="Operator" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:string>&lt;</plx:string>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="lessThan">
								<plx:left>
									<plx:nameRef name="ObjectPropertyValue" type="parameter"/>
								</plx:left>
								<plx:right>
									<plx:nameRef name="UserValue" type="parameter"/>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:assign>
							<plx:left>
								<plx:nameRef name="Rt"/>
							</plx:left>
							<plx:right>
								<plx:trueKeyword/>
							</plx:right>
						</plx:assign>
					</plx:branch>
					<plx:return>
						<plx:nameRef name="Rt"/>
					</plx:return>
				</plx:branch>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="inequality">
							<plx:left>
								<plx:nameRef name="Operator" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:string>&lt;=</plx:string>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:throw>
						<plx:callNew dataTypeName="Exception" dataTypeQualifier="System">
							<plx:passParam>
								<plx:callStatic name="Concat" dataTypeName=".string">
									<plx:passParam>
										<plx:string>The operator '</plx:string>
									</plx:passParam>
									<plx:passParam>
										<plx:nameRef name="Operator" type="parameter"/>
									</plx:passParam>
									<plx:passParam>
										<plx:string>' does not match the type decimal !</plx:string>
									</plx:passParam>
								</plx:callStatic>
							</plx:passParam>
						</plx:callNew>
					</plx:throw>
				</plx:branch>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="lessThanOrEqual">
							<plx:left>
								<plx:nameRef name="ObjectPropertyValue" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:nameRef name="UserValue" type="parameter"/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:assign>
						<plx:left>
							<plx:nameRef name="Rt"/>
						</plx:left>
						<plx:right>
							<plx:trueKeyword/>
						</plx:right>
					</plx:assign>
				</plx:branch>
				<plx:return>
					<plx:nameRef name="Rt"/>
				</plx:return>
			</plx:function>
			<plx:function name="IsOk" visibility="private">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Determines whether the specified object property value is ok.
</summary>
						<param name="ObjectPropertyValue">The object property value.</param>
						<param name="Operator">The operator.</param>
						<param name="UserValue">The user value.</param>
						<returns>
<c>true</c> if the specified object property value is ok; otherwise, <c>false</c>.
</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="ObjectPropertyValue" dataTypeName=".date"/>
				<plx:param name="Operator" dataTypeName=".string"/>
				<plx:param name="UserValue" dataTypeName=".date"/>
				<plx:returns dataTypeName=".boolean"/>
				<plx:local name="Rt" dataTypeName=".boolean">
					<plx:initialize>
						<plx:falseKeyword/>
					</plx:initialize>
				</plx:local>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="equality">
							<plx:left>
								<plx:nameRef name="Operator" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:string>=</plx:string>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="equality">
								<plx:left>
									<plx:nameRef name="ObjectPropertyValue" type="parameter"/>
								</plx:left>
								<plx:right>
									<plx:nameRef name="UserValue" type="parameter"/>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:assign>
							<plx:left>
								<plx:nameRef name="Rt"/>
							</plx:left>
							<plx:right>
								<plx:trueKeyword/>
							</plx:right>
						</plx:assign>
					</plx:branch>
					<plx:return>
						<plx:nameRef name="Rt"/>
					</plx:return>
				</plx:branch>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="equality">
							<plx:left>
								<plx:nameRef name="Operator" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:string>&gt;</plx:string>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="greaterThan">
								<plx:left>
									<plx:nameRef name="ObjectPropertyValue" type="parameter"/>
								</plx:left>
								<plx:right>
									<plx:nameRef name="UserValue" type="parameter"/>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:assign>
							<plx:left>
								<plx:nameRef name="Rt"/>
							</plx:left>
							<plx:right>
								<plx:trueKeyword/>
							</plx:right>
						</plx:assign>
					</plx:branch>
					<plx:return>
						<plx:nameRef name="Rt"/>
					</plx:return>
				</plx:branch>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="equality">
							<plx:left>
								<plx:nameRef name="Operator" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:string>&gt;=</plx:string>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="greaterThanOrEqual">
								<plx:left>
									<plx:nameRef name="ObjectPropertyValue" type="parameter"/>
								</plx:left>
								<plx:right>
									<plx:nameRef name="UserValue" type="parameter"/>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:assign>
							<plx:left>
								<plx:nameRef name="Rt"/>
							</plx:left>
							<plx:right>
								<plx:trueKeyword/>
							</plx:right>
						</plx:assign>
					</plx:branch>
					<plx:return>
						<plx:nameRef name="Rt"/>
					</plx:return>
				</plx:branch>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="equality">
							<plx:left>
								<plx:nameRef name="Operator" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:string>&lt;</plx:string>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="lessThan">
								<plx:left>
									<plx:nameRef name="ObjectPropertyValue" type="parameter"/>
								</plx:left>
								<plx:right>
									<plx:nameRef name="UserValue" type="parameter"/>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:assign>
							<plx:left>
								<plx:nameRef name="Rt"/>
							</plx:left>
							<plx:right>
								<plx:trueKeyword/>
							</plx:right>
						</plx:assign>
					</plx:branch>
					<plx:return>
						<plx:nameRef name="Rt"/>
					</plx:return>
				</plx:branch>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="inequality">
							<plx:left>
								<plx:nameRef name="Operator" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:string>&lt;=</plx:string>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:throw>
						<plx:callNew dataTypeName="Exception" dataTypeQualifier="System">
							<plx:passParam>
								<plx:callStatic name="Concat" dataTypeName=".string">
									<plx:passParam>
										<plx:string>The operator '</plx:string>
									</plx:passParam>
									<plx:passParam>
										<plx:nameRef name="Operator" type="parameter"/>
									</plx:passParam>
									<plx:passParam>
										<plx:string>' does not match the type DateTime !</plx:string>
									</plx:passParam>
								</plx:callStatic>
							</plx:passParam>
						</plx:callNew>
					</plx:throw>
				</plx:branch>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="lessThanOrEqual">
							<plx:left>
								<plx:nameRef name="ObjectPropertyValue" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:nameRef name="UserValue" type="parameter"/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:assign>
						<plx:left>
							<plx:nameRef name="Rt"/>
						</plx:left>
						<plx:right>
							<plx:trueKeyword/>
						</plx:right>
					</plx:assign>
				</plx:branch>
				<plx:return>
					<plx:nameRef name="Rt"/>
				</plx:return>
			</plx:function>
			<plx:function name="IsOk" visibility="private">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Determines whether the specified object property value is ok.
</summary>
						<param name="ObjectPropertyValue">if set to <c>true</c> [object property value].</param>
						<param name="Operator">The operator.</param>
						<param name="UserValue">if set to <c>true</c> [user value].</param>
						<returns>
<c>true</c> if the specified object property value is ok; otherwise, <c>false</c>.
</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="ObjectPropertyValue" dataTypeName=".boolean"/>
				<plx:param name="Operator" dataTypeName=".string"/>
				<plx:param name="UserValue" dataTypeName=".boolean"/>
				<plx:returns dataTypeName=".boolean"/>
				<plx:local name="Rt" dataTypeName=".boolean">
					<plx:initialize>
						<plx:falseKeyword/>
					</plx:initialize>
				</plx:local>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="inequality">
							<plx:left>
								<plx:nameRef name="Operator" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:string>=</plx:string>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:throw>
						<plx:callNew dataTypeName="Exception" dataTypeQualifier="System">
							<plx:passParam>
								<plx:callStatic name="Concat" dataTypeName=".string">
									<plx:passParam>
										<plx:string>The operator '</plx:string>
									</plx:passParam>
									<plx:passParam>
										<plx:nameRef name="Operator" type="parameter"/>
									</plx:passParam>
									<plx:passParam>
										<plx:string>' does not match the type string !</plx:string>
									</plx:passParam>
								</plx:callStatic>
							</plx:passParam>
						</plx:callNew>
					</plx:throw>
				</plx:branch>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="equality">
							<plx:left>
								<plx:nameRef name="ObjectPropertyValue" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:nameRef name="UserValue" type="parameter"/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:assign>
						<plx:left>
							<plx:nameRef name="Rt"/>
						</plx:left>
						<plx:right>
							<plx:trueKeyword/>
						</plx:right>
					</plx:assign>
				</plx:branch>
				<plx:return>
					<plx:nameRef name="Rt"/>
				</plx:return>
			</plx:function>
			<plx:function name="IsOk" visibility="private">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Determines whether the specified object property value is ok.
</summary>
						<param name="ObjectPropertyValue">The object property value.</param>
						<param name="Operator">The operator.</param>
						<param name="UserValue">array of the user value.</param>
						<returns>
<c>true</c> if the specified object property value is ok; otherwise, <c>false</c>.
</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="ObjectPropertyValue" dataTypeName=".object"/>
				<plx:param name="Operator" dataTypeName=".string"/>
				<plx:param name="UserValue" dataTypeIsSimpleArray="true" dataTypeName=".object"/>
				<plx:returns dataTypeName=".boolean"/>
				<plx:iterator localName="item" dataTypeName=".object">
					<plx:initialize>
						<plx:nameRef name="UserValue" type="parameter"/>
					</plx:initialize>
					<plx:branch>
						<plx:condition>
							<plx:callInstance name="Equals">
								<plx:callObject>
									<plx:nameRef name="item"/>
								</plx:callObject>
								<plx:passParam>
									<plx:nameRef name="ObjectPropertyValue" type="parameter"/>
								</plx:passParam>
							</plx:callInstance>
						</plx:condition>
						<plx:return>
							<plx:trueKeyword/>
						</plx:return>
					</plx:branch>
				</plx:iterator>
				<plx:return>
					<plx:falseKeyword/>
				</plx:return>
			</plx:function>
			<plx:function name="IsOk" visibility="private">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Determines whether the specified operator is ok.
</summary>
						<param name="Operator">The operator.</param>
						<param name="UserValue">The user value.</param>
						<returns>
<c>true</c> if the specified operator is ok; otherwise, <c>false</c>.
</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="Operator" dataTypeName=".string"/>
				<plx:param name="UserValue" dataTypeName=".object"/>
				<plx:returns dataTypeName=".boolean"/>
				<plx:local name="Rt" dataTypeName=".boolean">
					<plx:initialize>
						<plx:falseKeyword/>
					</plx:initialize>
				</plx:local>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="booleanAnd">
							<plx:left>
								<plx:binaryOperator type="equality">
									<plx:left>
										<plx:callInstance name="ToUpper">
											<plx:callObject>
												<plx:callInstance name="ToString">
													<plx:callObject>
														<plx:nameRef name="UserValue" type="parameter"/>
													</plx:callObject>
												</plx:callInstance>
											</plx:callObject>
										</plx:callInstance>
									</plx:left>
									<plx:right>
										<plx:string>NULL</plx:string>
									</plx:right>
								</plx:binaryOperator>
							</plx:left>
							<plx:right>
								<plx:binaryOperator type="equality">
									<plx:left>
										<plx:nameRef name="Operator" type="parameter"/>
									</plx:left>
									<plx:right>
										<plx:string>=</plx:string>
									</plx:right>
								</plx:binaryOperator>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:assign>
						<plx:left>
							<plx:nameRef name="Rt"/>
						</plx:left>
						<plx:right>
							<plx:trueKeyword/>
						</plx:right>
					</plx:assign>
				</plx:branch>
				<plx:return>
					<plx:nameRef name="Rt"/>
				</plx:return>
			</plx:function>
			<plx:function name="CorrectUserValue" visibility="private">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Corrects the user value.
</summary>
						<param name="UserValue">The user value.</param>
						<returns></returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="UserValue" dataTypeName=".string"/>
				<plx:returns dataTypeName=".string"/>
				<plx:branch>
					<plx:condition>
						<plx:unaryOperator type="booleanNot">
							<plx:callStatic name="IsNullOrEmpty" dataTypeName=".string">
								<plx:passParam>
									<plx:nameRef name="UserValue" type="parameter"/>
								</plx:passParam>
							</plx:callStatic>
						</plx:unaryOperator>
					</plx:condition>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="equality">
								<plx:left>
									<plx:callInstance name="Substring">
										<plx:callObject>
											<plx:nameRef name="UserValue" type="parameter"/>
										</plx:callObject>
										<plx:passParam>
											<plx:value data="0" type="i4"/>
										</plx:passParam>
										<plx:passParam>
											<plx:value data="1" type="i4"/>
										</plx:passParam>
									</plx:callInstance>
								</plx:left>
								<plx:right>
									<plx:string>'</plx:string>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:assign>
							<plx:left>
								<plx:nameRef name="UserValue" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:callInstance name="Replace">
									<plx:callObject>
										<plx:nameRef name="UserValue" type="parameter"/>
									</plx:callObject>
									<plx:passParam>
										<plx:string>'</plx:string>
									</plx:passParam>
									<plx:passParam>
										<plx:string/>
									</plx:passParam>
								</plx:callInstance>
							</plx:right>
						</plx:assign>
					</plx:branch>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="equality">
								<plx:left>
									<plx:callInstance name="Substring">
										<plx:callObject>
											<plx:nameRef name="UserValue" type="parameter"/>
										</plx:callObject>
										<plx:passParam>
											<plx:value data="0" type="i4"/>
										</plx:passParam>
										<plx:passParam>
											<plx:value data="1" type="i4"/>
										</plx:passParam>
									</plx:callInstance>
								</plx:left>
								<plx:right>
									<plx:string>#</plx:string>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:assign>
							<plx:left>
								<plx:nameRef name="UserValue" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:callInstance name="Replace">
									<plx:callObject>
										<plx:nameRef name="UserValue" type="parameter"/>
									</plx:callObject>
									<plx:passParam>
										<plx:string>#</plx:string>
									</plx:passParam>
									<plx:passParam>
										<plx:string/>
									</plx:passParam>
								</plx:callInstance>
							</plx:right>
						</plx:assign>
					</plx:branch>
				</plx:branch>
				<plx:return>
					<plx:nameRef name="UserValue" type="parameter"/>
				</plx:return>
			</plx:function>
			<plx:function name="IsOk" visibility="private">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Determines whether the specified object property value is ok.
</summary>
						<param name="ObjectPropertyValue">The object property value.</param>
						<param name="Operator">The operator.</param>
						<param name="UserValue">The user value.</param>
						<returns>
<c>true</c> if the specified object property value is ok; otherwise, <c>false</c>.
</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="ObjectPropertyValue" dataTypeName=".object"/>
				<plx:param name="Operator" dataTypeName=".string"/>
				<plx:param name="UserValue" dataTypeName=".string"/>
				<plx:returns dataTypeName=".boolean"/>
				<plx:local name="o" dataTypeName=".i2"/>
				<plx:local name="Rt" dataTypeName=".boolean">
					<plx:initialize>
						<plx:falseKeyword/>
					</plx:initialize>
				</plx:local>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="identityEquality">
							<plx:left>
								<plx:nameRef name="ObjectPropertyValue" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:nullKeyword/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:return>
						<plx:falseKeyword/>
					</plx:return>
				</plx:branch>
				<plx:local name="TypeOfValue" dataTypeName="Type" dataTypeQualifier="System">
					<plx:initialize>
						<plx:callInstance name="GetType">
							<plx:callObject>
								<plx:nameRef name="ObjectPropertyValue" type="parameter"/>
							</plx:callObject>
						</plx:callInstance>
					</plx:initialize>
				</plx:local>
				<plx:local name="FilterValue" dataTypeName=".object">
					<plx:initialize>
						<plx:callThis name="CorrectUserValue">
							<plx:passParam>
								<plx:nameRef name="UserValue" type="parameter"/>
							</plx:passParam>
						</plx:callThis>
					</plx:initialize>
				</plx:local>
				<plx:branch>
					<plx:condition>
						<plx:callInstance name="Equals">
							<plx:callObject>
								<plx:callInstance name="ToUpper">
									<plx:callObject>
										<plx:nameRef name="Operator" type="parameter"/>
									</plx:callObject>
								</plx:callInstance>
							</plx:callObject>
							<plx:passParam>
								<plx:string>IN</plx:string>
							</plx:passParam>
						</plx:callInstance>
					</plx:condition>
					<plx:try>
						<plx:local name="i" dataTypeName=".i4"/>
						<plx:local name="fvalue" dataTypeIsSimpleArray="true" dataTypeName=".string">
							<plx:initialize>
								<plx:callInstance name="Split">
									<plx:callObject>
										<plx:callInstance name="Substring">
											<plx:callObject>
												<plx:callInstance name="ToString">
													<plx:callObject>
														<plx:nameRef name="FilterValue"/>
													</plx:callObject>
												</plx:callInstance>
											</plx:callObject>
											<plx:passParam>
												<plx:value data="1" type="i4"/>
											</plx:passParam>
											<plx:passParam>
												<plx:binaryOperator type="subtract">
													<plx:left>
														<plx:callInstance name="Length" type="property">
															<plx:callObject>
																<plx:callInstance name="ToString">
																	<plx:callObject>
																		<plx:nameRef name="FilterValue"/>
																	</plx:callObject>
																</plx:callInstance>
															</plx:callObject>
														</plx:callInstance>
													</plx:left>
													<plx:right>
														<plx:value data="2" type="i4"/>
													</plx:right>
												</plx:binaryOperator>
											</plx:passParam>
										</plx:callInstance>
									</plx:callObject>
									<plx:passParamArray dataTypeIsSimpleArray="true" dataTypeName=".char">
										<plx:passParam>
											<plx:value data="," type="char"/>
										</plx:passParam>
									</plx:passParamArray>
								</plx:callInstance>
							</plx:initialize>
						</plx:local>
						<plx:local name="values" dataTypeIsSimpleArray="true" dataTypeName=".object">
							<plx:initialize>
								<plx:callNew dataTypeIsSimpleArray="true" dataTypeName=".object">
									<plx:passParam>
										<plx:callInstance name="Length" type="property">
											<plx:callObject>
												<plx:nameRef name="fvalue"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:passParam>
								</plx:callNew>
							</plx:initialize>
						</plx:local>
						<plx:branch>
							<plx:condition>
								<plx:binaryOperator type="identityEquality">
									<plx:left>
										<plx:nameRef name="TypeOfValue"/>
									</plx:left>
									<plx:right>
										<plx:typeOf dataTypeName=".i4"/>
									</plx:right>
								</plx:binaryOperator>
							</plx:condition>
							<plx:loop>
								<plx:initializeLoop>
									<plx:assign>
										<plx:left>
											<plx:nameRef name="i"/>
										</plx:left>
										<plx:right>
											<plx:value data="0" type="i4"/>
										</plx:right>
									</plx:assign>
								</plx:initializeLoop>
								<plx:condition>
									<plx:binaryOperator type="lessThan">
										<plx:left>
											<plx:nameRef name="i"/>
										</plx:left>
										<plx:right>
											<plx:callInstance name="Length" type="property">
												<plx:callObject>
													<plx:nameRef name="fvalue"/>
												</plx:callObject>
											</plx:callInstance>
										</plx:right>
									</plx:binaryOperator>
								</plx:condition>
								<plx:beforeLoop>
									<plx:increment>
										<plx:nameRef name="i"/>
									</plx:increment>
								</plx:beforeLoop>
								<plx:assign>
									<plx:left>
										<plx:callInstance name=".implied" type="arrayIndexer">
											<plx:callObject>
												<plx:nameRef name="values"/>
											</plx:callObject>
											<plx:passParam>
												<plx:nameRef name="i"/>
											</plx:passParam>
										</plx:callInstance>
									</plx:left>
									<plx:right>
										<plx:callStatic name="Parse" dataTypeName=".i4">
											<plx:passParam>
												<plx:callInstance name=".implied" type="arrayIndexer">
													<plx:callObject>
														<plx:nameRef name="fvalue"/>
													</plx:callObject>
													<plx:passParam>
														<plx:nameRef name="i"/>
													</plx:passParam>
												</plx:callInstance>
											</plx:passParam>
										</plx:callStatic>
									</plx:right>
								</plx:assign>
							</plx:loop>
						</plx:branch>
						<plx:alternateBranch>
							<plx:condition>
								<plx:binaryOperator type="identityEquality">
									<plx:left>
										<plx:nameRef name="TypeOfValue"/>
									</plx:left>
									<plx:right>
										<plx:typeOf dataTypeName=".string"/>
									</plx:right>
								</plx:binaryOperator>
							</plx:condition>
							<plx:loop>
								<plx:initializeLoop>
									<plx:assign>
										<plx:left>
											<plx:nameRef name="i"/>
										</plx:left>
										<plx:right>
											<plx:value data="0" type="i4"/>
										</plx:right>
									</plx:assign>
								</plx:initializeLoop>
								<plx:condition>
									<plx:binaryOperator type="lessThan">
										<plx:left>
											<plx:nameRef name="i"/>
										</plx:left>
										<plx:right>
											<plx:callInstance name="Length" type="property">
												<plx:callObject>
													<plx:nameRef name="fvalue"/>
												</plx:callObject>
											</plx:callInstance>
										</plx:right>
									</plx:binaryOperator>
								</plx:condition>
								<plx:beforeLoop>
									<plx:increment>
										<plx:nameRef name="i"/>
									</plx:increment>
								</plx:beforeLoop>
								<plx:assign>
									<plx:left>
										<plx:callInstance name=".implied" type="arrayIndexer">
											<plx:callObject>
												<plx:nameRef name="values"/>
											</plx:callObject>
											<plx:passParam>
												<plx:nameRef name="i"/>
											</plx:passParam>
										</plx:callInstance>
									</plx:left>
									<plx:right>
										<plx:callInstance name=".implied" type="arrayIndexer">
											<plx:callObject>
												<plx:nameRef name="fvalue"/>
											</plx:callObject>
											<plx:passParam>
												<plx:nameRef name="i"/>
											</plx:passParam>
										</plx:callInstance>
									</plx:right>
								</plx:assign>
							</plx:loop>
						</plx:alternateBranch>
						<plx:alternateBranch>
							<plx:condition>
								<plx:binaryOperator type="identityEquality">
									<plx:left>
										<plx:nameRef name="TypeOfValue"/>
									</plx:left>
									<plx:right>
										<plx:typeOf dataTypeName=".i8"/>
									</plx:right>
								</plx:binaryOperator>
							</plx:condition>
							<plx:loop>
								<plx:initializeLoop>
									<plx:assign>
										<plx:left>
											<plx:nameRef name="i"/>
										</plx:left>
										<plx:right>
											<plx:value data="0" type="i4"/>
										</plx:right>
									</plx:assign>
								</plx:initializeLoop>
								<plx:condition>
									<plx:binaryOperator type="lessThan">
										<plx:left>
											<plx:nameRef name="i"/>
										</plx:left>
										<plx:right>
											<plx:callInstance name="Length" type="property">
												<plx:callObject>
													<plx:nameRef name="fvalue"/>
												</plx:callObject>
											</plx:callInstance>
										</plx:right>
									</plx:binaryOperator>
								</plx:condition>
								<plx:beforeLoop>
									<plx:increment>
										<plx:nameRef name="i"/>
									</plx:increment>
								</plx:beforeLoop>
								<plx:assign>
									<plx:left>
										<plx:callInstance name=".implied" type="arrayIndexer">
											<plx:callObject>
												<plx:nameRef name="values"/>
											</plx:callObject>
											<plx:passParam>
												<plx:nameRef name="i"/>
											</plx:passParam>
										</plx:callInstance>
									</plx:left>
									<plx:right>
										<plx:callStatic name="Parse" dataTypeName=".i8">
											<plx:passParam>
												<plx:callInstance name=".implied" type="arrayIndexer">
													<plx:callObject>
														<plx:nameRef name="fvalue"/>
													</plx:callObject>
													<plx:passParam>
														<plx:nameRef name="i"/>
													</plx:passParam>
												</plx:callInstance>
											</plx:passParam>
										</plx:callStatic>
									</plx:right>
								</plx:assign>
							</plx:loop>
						</plx:alternateBranch>
						<plx:branch>
							<plx:condition>
								<plx:binaryOperator type="lessThanOrEqual">
									<plx:left>
										<plx:callInstance name="Length" type="property">
											<plx:callObject>
												<plx:nameRef name="values"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:left>
									<plx:right>
										<plx:value data="0" type="i4"/>
									</plx:right>
								</plx:binaryOperator>
							</plx:condition>
							<plx:throw>
								<plx:callNew dataTypeName="NotSupportedException" dataTypeQualifier="System">
									<plx:passParam>
										<plx:callStatic name="Concat" dataTypeName=".string">
											<plx:passParam>
												<plx:string>IN operator Filtering is not possible on the type </plx:string>
											</plx:passParam>
											<plx:passParam>
												<plx:callInstance name="ToString">
													<plx:callObject>
														<plx:nameRef name="TypeOfValue"/>
													</plx:callObject>
												</plx:callInstance>
											</plx:passParam>
											<plx:passParam>
												<plx:string>. Please use integer or long values.</plx:string>
											</plx:passParam>
										</plx:callStatic>
									</plx:passParam>
								</plx:callNew>
							</plx:throw>
						</plx:branch>
						<plx:assign>
							<plx:left>
								<plx:nameRef name="Rt"/>
							</plx:left>
							<plx:right>
								<plx:callThis name="IsOk">
									<plx:passParam>
										<plx:nameRef name="ObjectPropertyValue" type="parameter"/>
									</plx:passParam>
									<plx:passParam>
										<plx:nameRef name="Operator" type="parameter"/>
									</plx:passParam>
									<plx:passParam>
										<plx:nameRef name="values"/>
									</plx:passParam>
								</plx:callThis>
							</plx:right>
						</plx:assign>
						<plx:catch localName="ex" dataTypeName="Exception" dataTypeQualifier="System">
							<plx:throw>
								<plx:callNew dataTypeName="InvalidFilterCriteriaException" dataTypeQualifier="System.Reflection">
									<plx:passParam>
										<plx:string>Invalid IN Filter value</plx:string>
									</plx:passParam>
									<plx:passParam>
										<plx:nameRef name="ex"/>
									</plx:passParam>
								</plx:callNew>
							</plx:throw>
						</plx:catch>
					</plx:try>
					<plx:return>
						<plx:nameRef name="Rt"/>
					</plx:return>
				</plx:branch>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="identityEquality">
							<plx:left>
								<plx:nameRef name="TypeOfValue"/>
							</plx:left>
							<plx:right>
								<plx:typeOf dataTypeName=".string"/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:return>
						<plx:callThis name="IsOk">
							<plx:passParam>
								<plx:cast dataTypeName=".string">
									<plx:nameRef name="ObjectPropertyValue" type="parameter"/>
								</plx:cast>
							</plx:passParam>
							<plx:passParam>
								<plx:nameRef name="Operator" type="parameter"/>
							</plx:passParam>
							<plx:passParam>
								<plx:cast dataTypeName=".string">
									<plx:nameRef name="FilterValue"/>
								</plx:cast>
							</plx:passParam>
						</plx:callThis>
					</plx:return>
				</plx:branch>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="identityEquality">
							<plx:left>
								<plx:nameRef name="TypeOfValue"/>
							</plx:left>
							<plx:right>
								<plx:typeOf dataTypeName=".i4"/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:local name="o" dataTypeName=".i4"/>
					<plx:branch>
						<plx:condition>
							<plx:callStatic name="TryParse" dataTypeName=".i4">
								<plx:passParam>
									<plx:callInstance name="ToString">
										<plx:callObject>
											<plx:nameRef name="FilterValue"/>
										</plx:callObject>
									</plx:callInstance>
								</plx:passParam>
								<plx:passParam type="out">
									<plx:nameRef name="o"/>
								</plx:passParam>
							</plx:callStatic>
						</plx:condition>
						<plx:assign>
							<plx:left>
								<plx:nameRef name="Rt"/>
							</plx:left>
							<plx:right>
								<plx:callThis name="IsOk">
									<plx:passParam>
										<plx:cast dataTypeName=".i4">
											<plx:nameRef name="ObjectPropertyValue" type="parameter"/>
										</plx:cast>
									</plx:passParam>
									<plx:passParam>
										<plx:nameRef name="Operator" type="parameter"/>
									</plx:passParam>
									<plx:passParam>
										<plx:nameRef name="o"/>
									</plx:passParam>
								</plx:callThis>
							</plx:right>
						</plx:assign>
					</plx:branch>
					<plx:fallbackBranch>
						<plx:assign>
							<plx:left>
								<plx:nameRef name="Rt"/>
							</plx:left>
							<plx:right>
								<plx:falseKeyword/>
							</plx:right>
						</plx:assign>
					</plx:fallbackBranch>
					<plx:return>
						<plx:nameRef name="Rt"/>
					</plx:return>
				</plx:branch>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="identityEquality">
							<plx:left>
								<plx:nameRef name="TypeOfValue"/>
							</plx:left>
							<plx:right>
								<plx:typeOf dataTypeName=".r8"/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:local name="o" dataTypeName=".r8"/>
					<plx:branch>
						<plx:condition>
							<plx:callStatic name="TryParse" dataTypeName=".r8">
								<plx:passParam>
									<plx:callInstance name="ToString">
										<plx:callObject>
											<plx:nameRef name="FilterValue"/>
										</plx:callObject>
									</plx:callInstance>
								</plx:passParam>
								<plx:passParam type="out">
									<plx:nameRef name="o"/>
								</plx:passParam>
							</plx:callStatic>
						</plx:condition>
						<plx:assign>
							<plx:left>
								<plx:nameRef name="Rt"/>
							</plx:left>
							<plx:right>
								<plx:callThis name="IsOk">
									<plx:passParam>
										<plx:cast dataTypeName=".r8">
											<plx:nameRef name="ObjectPropertyValue" type="parameter"/>
										</plx:cast>
									</plx:passParam>
									<plx:passParam>
										<plx:nameRef name="Operator" type="parameter"/>
									</plx:passParam>
									<plx:passParam>
										<plx:nameRef name="o"/>
									</plx:passParam>
								</plx:callThis>
							</plx:right>
						</plx:assign>
					</plx:branch>
					<plx:fallbackBranch>
						<plx:assign>
							<plx:left>
								<plx:nameRef name="Rt"/>
							</plx:left>
							<plx:right>
								<plx:falseKeyword/>
							</plx:right>
						</plx:assign>
					</plx:fallbackBranch>
					<plx:return>
						<plx:nameRef name="Rt"/>
					</plx:return>
				</plx:branch>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="identityEquality">
							<plx:left>
								<plx:nameRef name="TypeOfValue"/>
							</plx:left>
							<plx:right>
								<plx:typeOf dataTypeName=".decimal"/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:local name="o" dataTypeName=".decimal"/>
					<plx:branch>
						<plx:condition>
							<plx:callStatic name="TryParse" dataTypeName=".decimal">
								<plx:passParam>
									<plx:callInstance name="ToString">
										<plx:callObject>
											<plx:nameRef name="FilterValue"/>
										</plx:callObject>
									</plx:callInstance>
								</plx:passParam>
								<plx:passParam type="out">
									<plx:nameRef name="o"/>
								</plx:passParam>
							</plx:callStatic>
						</plx:condition>
						<plx:assign>
							<plx:left>
								<plx:nameRef name="Rt"/>
							</plx:left>
							<plx:right>
								<plx:callThis name="IsOk">
									<plx:passParam>
										<plx:cast dataTypeName=".decimal">
											<plx:nameRef name="ObjectPropertyValue" type="parameter"/>
										</plx:cast>
									</plx:passParam>
									<plx:passParam>
										<plx:nameRef name="Operator" type="parameter"/>
									</plx:passParam>
									<plx:passParam>
										<plx:nameRef name="o"/>
									</plx:passParam>
								</plx:callThis>
							</plx:right>
						</plx:assign>
					</plx:branch>
					<plx:fallbackBranch>
						<plx:assign>
							<plx:left>
								<plx:nameRef name="Rt"/>
							</plx:left>
							<plx:right>
								<plx:falseKeyword/>
							</plx:right>
						</plx:assign>
					</plx:fallbackBranch>
					<plx:return>
						<plx:nameRef name="Rt"/>
					</plx:return>
				</plx:branch>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="identityEquality">
							<plx:left>
								<plx:nameRef name="TypeOfValue"/>
							</plx:left>
							<plx:right>
								<plx:typeOf dataTypeName=".date"/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:local name="o" dataTypeName=".date"/>
					<plx:branch>
						<plx:condition>
							<plx:callStatic name="TryParse" dataTypeName=".date">
								<plx:passParam>
									<plx:callInstance name="ToString">
										<plx:callObject>
											<plx:nameRef name="FilterValue"/>
										</plx:callObject>
									</plx:callInstance>
								</plx:passParam>
								<plx:passParam type="out">
									<plx:nameRef name="o"/>
								</plx:passParam>
							</plx:callStatic>
						</plx:condition>
						<plx:assign>
							<plx:left>
								<plx:nameRef name="Rt"/>
							</plx:left>
							<plx:right>
								<plx:callThis name="IsOk">
									<plx:passParam>
										<plx:cast dataTypeName=".date">
											<plx:nameRef name="ObjectPropertyValue" type="parameter"/>
										</plx:cast>
									</plx:passParam>
									<plx:passParam>
										<plx:nameRef name="Operator" type="parameter"/>
									</plx:passParam>
									<plx:passParam>
										<plx:nameRef name="o"/>
									</plx:passParam>
								</plx:callThis>
							</plx:right>
						</plx:assign>
					</plx:branch>
					<plx:fallbackBranch>
						<plx:assign>
							<plx:left>
								<plx:nameRef name="Rt"/>
							</plx:left>
							<plx:right>
								<plx:falseKeyword/>
							</plx:right>
						</plx:assign>
					</plx:fallbackBranch>
					<plx:return>
						<plx:nameRef name="Rt"/>
					</plx:return>
				</plx:branch>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="identityEquality">
							<plx:left>
								<plx:nameRef name="TypeOfValue"/>
							</plx:left>
							<plx:right>
								<plx:typeOf dataTypeName=".boolean"/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:local name="o" dataTypeName=".boolean"/>
					<plx:branch>
						<plx:condition>
							<plx:callStatic name="TryParse" dataTypeName=".boolean">
								<plx:passParam>
									<plx:callInstance name="ToString">
										<plx:callObject>
											<plx:nameRef name="FilterValue"/>
										</plx:callObject>
									</plx:callInstance>
								</plx:passParam>
								<plx:passParam type="out">
									<plx:nameRef name="o"/>
								</plx:passParam>
							</plx:callStatic>
						</plx:condition>
						<plx:assign>
							<plx:left>
								<plx:nameRef name="Rt"/>
							</plx:left>
							<plx:right>
								<plx:callThis name="IsOk">
									<plx:passParam>
										<plx:cast dataTypeName=".boolean">
											<plx:nameRef name="ObjectPropertyValue" type="parameter"/>
										</plx:cast>
									</plx:passParam>
									<plx:passParam>
										<plx:nameRef name="Operator" type="parameter"/>
									</plx:passParam>
									<plx:passParam>
										<plx:nameRef name="o"/>
									</plx:passParam>
								</plx:callThis>
							</plx:right>
						</plx:assign>
					</plx:branch>
					<plx:fallbackBranch>
						<plx:assign>
							<plx:left>
								<plx:nameRef name="Rt"/>
							</plx:left>
							<plx:right>
								<plx:falseKeyword/>
							</plx:right>
						</plx:assign>
					</plx:fallbackBranch>
					<plx:return>
						<plx:nameRef name="Rt"/>
					</plx:return>
				</plx:branch>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="identityEquality">
							<plx:left>
								<plx:nameRef name="TypeOfValue"/>
							</plx:left>
							<plx:right>
								<plx:typeOf dataTypeName="Guid" dataTypeQualifier="System"/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:local name="o" dataTypeName="Guid" dataTypeQualifier="System"/>
					<plx:branch>
						<plx:condition>
							<plx:callStatic name="GuidTryParse" dataTypeName="EntityUtil">
								<plx:passParam>
									<plx:callInstance name="ToString">
										<plx:callObject>
											<plx:nameRef name="FilterValue"/>
										</plx:callObject>
									</plx:callInstance>
								</plx:passParam>
								<plx:passParam type="out">
									<plx:nameRef name="o"/>
								</plx:passParam>
							</plx:callStatic>
						</plx:condition>
						<plx:assign>
							<plx:left>
								<plx:nameRef name="Rt"/>
							</plx:left>
							<plx:right>
								<plx:callThis name="IsOk">
									<plx:passParam>
										<plx:cast dataTypeName="Guid" dataTypeQualifier="System">
											<plx:nameRef name="ObjectPropertyValue" type="parameter"/>
										</plx:cast>
									</plx:passParam>
									<plx:passParam>
										<plx:nameRef name="Operator" type="parameter"/>
									</plx:passParam>
									<plx:passParam>
										<plx:nameRef name="o"/>
									</plx:passParam>
								</plx:callThis>
							</plx:right>
						</plx:assign>
					</plx:branch>
					<plx:fallbackBranch>
						<plx:assign>
							<plx:left>
								<plx:nameRef name="Rt"/>
							</plx:left>
							<plx:right>
								<plx:falseKeyword/>
							</plx:right>
						</plx:assign>
					</plx:fallbackBranch>
					<plx:return>
						<plx:nameRef name="Rt"/>
					</plx:return>
				</plx:branch>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="identityEquality">
							<plx:left>
								<plx:nameRef name="TypeOfValue"/>
							</plx:left>
							<plx:right>
								<plx:typeOf dataTypeName=".u1"/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:local name="o" dataTypeName=".u1"/>
					<plx:branch>
						<plx:condition>
							<plx:callStatic name="TryParse" dataTypeName=".u1">
								<plx:passParam>
									<plx:callInstance name="ToString">
										<plx:callObject>
											<plx:nameRef name="FilterValue"/>
										</plx:callObject>
									</plx:callInstance>
								</plx:passParam>
								<plx:passParam type="out">
									<plx:nameRef name="o"/>
								</plx:passParam>
							</plx:callStatic>
						</plx:condition>
						<plx:assign>
							<plx:left>
								<plx:nameRef name="Rt"/>
							</plx:left>
							<plx:right>
								<plx:callThis name="IsOk">
									<plx:passParam>
										<plx:cast dataTypeName=".i4">
											<plx:cast dataTypeName=".u1">
												<plx:nameRef name="ObjectPropertyValue" type="parameter"/>
											</plx:cast>
										</plx:cast>
									</plx:passParam>
									<plx:passParam>
										<plx:nameRef name="Operator" type="parameter"/>
									</plx:passParam>
									<plx:passParam>
										<plx:cast dataTypeName=".i4">
											<plx:nameRef name="o"/>
										</plx:cast>
									</plx:passParam>
								</plx:callThis>
							</plx:right>
						</plx:assign>
					</plx:branch>
					<plx:fallbackBranch>
						<plx:assign>
							<plx:left>
								<plx:nameRef name="Rt"/>
							</plx:left>
							<plx:right>
								<plx:falseKeyword/>
							</plx:right>
						</plx:assign>
					</plx:fallbackBranch>
					<plx:return>
						<plx:nameRef name="Rt"/>
					</plx:return>
				</plx:branch>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="identityEquality">
							<plx:left>
								<plx:nameRef name="TypeOfValue"/>
							</plx:left>
							<plx:right>
								<plx:typeOf dataTypeName=".i8"/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:local name="o" dataTypeName=".i8"/>
					<plx:branch>
						<plx:condition>
							<plx:callStatic name="TryParse" dataTypeName=".i8">
								<plx:passParam>
									<plx:callInstance name="ToString">
										<plx:callObject>
											<plx:nameRef name="FilterValue"/>
										</plx:callObject>
									</plx:callInstance>
								</plx:passParam>
								<plx:passParam type="out">
									<plx:nameRef name="o"/>
								</plx:passParam>
							</plx:callStatic>
						</plx:condition>
						<plx:assign>
							<plx:left>
								<plx:nameRef name="Rt"/>
							</plx:left>
							<plx:right>
								<plx:callThis name="IsOk">
									<plx:passParam>
										<plx:cast dataTypeName=".i8">
											<plx:nameRef name="ObjectPropertyValue" type="parameter"/>
										</plx:cast>
									</plx:passParam>
									<plx:passParam>
										<plx:nameRef name="Operator" type="parameter"/>
									</plx:passParam>
									<plx:passParam>
										<plx:nameRef name="o"/>
									</plx:passParam>
								</plx:callThis>
							</plx:right>
						</plx:assign>
					</plx:branch>
					<plx:fallbackBranch>
						<plx:assign>
							<plx:left>
								<plx:nameRef name="Rt"/>
							</plx:left>
							<plx:right>
								<plx:falseKeyword/>
							</plx:right>
						</plx:assign>
					</plx:fallbackBranch>
					<plx:return>
						<plx:nameRef name="Rt"/>
					</plx:return>
				</plx:branch>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="identityInequality">
							<plx:left>
								<plx:nameRef name="TypeOfValue"/>
							</plx:left>
							<plx:right>
								<plx:typeOf dataTypeName=".i2"/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:throw>
						<plx:callNew dataTypeName="Exception" dataTypeQualifier="System">
							<plx:passParam>
								<plx:callStatic name="Concat" dataTypeName=".string">
									<plx:passParam>
										<plx:string>Filtering is not possible on the type </plx:string>
									</plx:passParam>
									<plx:passParam>
										<plx:callInstance name="ToString">
											<plx:callObject>
												<plx:nameRef name="TypeOfValue"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:passParam>
								</plx:callStatic>
							</plx:passParam>
						</plx:callNew>
					</plx:throw>
				</plx:branch>
				<plx:branch>
					<plx:condition>
						<plx:callStatic name="TryParse" dataTypeName=".i2">
							<plx:passParam>
								<plx:callInstance name="ToString">
									<plx:callObject>
										<plx:nameRef name="FilterValue"/>
									</plx:callObject>
								</plx:callInstance>
							</plx:passParam>
							<plx:passParam type="out">
								<plx:nameRef name="o"/>
							</plx:passParam>
						</plx:callStatic>
					</plx:condition>
					<plx:assign>
						<plx:left>
							<plx:nameRef name="Rt"/>
						</plx:left>
						<plx:right>
							<plx:callThis name="IsOk">
								<plx:passParam>
									<plx:cast dataTypeName=".i4">
										<plx:cast dataTypeName=".i2">
											<plx:nameRef name="ObjectPropertyValue" type="parameter"/>
										</plx:cast>
									</plx:cast>
								</plx:passParam>
								<plx:passParam>
									<plx:nameRef name="Operator" type="parameter"/>
								</plx:passParam>
								<plx:passParam>
									<plx:cast dataTypeName=".i4">
										<plx:nameRef name="o"/>
									</plx:cast>
								</plx:passParam>
							</plx:callThis>
						</plx:right>
					</plx:assign>
				</plx:branch>
				<plx:fallbackBranch>
					<plx:assign>
						<plx:left>
							<plx:nameRef name="Rt"/>
						</plx:left>
						<plx:right>
							<plx:falseKeyword/>
						</plx:right>
					</plx:assign>
				</plx:fallbackBranch>
				<plx:return>
					<plx:nameRef name="Rt"/>
				</plx:return>
			</plx:function>
			<plx:function name="ApplyFilter" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Applies the filter.
</summary>
						<param name="ObjectToFilter">The object to filter.</param>
						<param name="StrFilter">The STR filter.</param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="ObjectToFilter" dataTypeName="T"/>
				<plx:param name="StrFilter" dataTypeName=".string"/>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="identityEquality">
							<plx:left>
								<plx:nameRef name="ObjectToFilter" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:nullKeyword/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:throw>
						<plx:callNew dataTypeName="ArgumentNullException" dataTypeQualifier="System">
							<plx:passParam>
								<plx:string>ObjectToFilter</plx:string>
							</plx:passParam>
						</plx:callNew>
					</plx:throw>
				</plx:branch>
				<plx:branch>
					<plx:condition>
						<plx:callStatic name="IsNullOrEmpty" dataTypeName=".string">
							<plx:passParam>
								<plx:nameRef name="StrFilter" type="parameter"/>
							</plx:passParam>
						</plx:callStatic>
					</plx:condition>
					<plx:throw>
						<plx:callNew dataTypeName="ArgumentNullException" dataTypeQualifier="System">
							<plx:passParam>
								<plx:string>StrFilter</plx:string>
							</plx:passParam>
						</plx:callNew>
					</plx:throw>
				</plx:branch>
				<plx:local name="CountValue" dataTypeName=".i4">
					<plx:initialize>
						<plx:callInstance name="Count" type="property">
							<plx:callObject>
								<plx:nameRef name="ObjectToFilter" type="parameter"/>
							</plx:callObject>
						</plx:callInstance>
					</plx:initialize>
				</plx:local>
				<plx:local name="ListOfExpressions" dataTypeName="Expressions">
					<plx:initialize>
						<plx:callNew dataTypeName="Expressions">
							<plx:passParam>
								<plx:nameRef name="StrFilter" type="parameter"/>
							</plx:passParam>
						</plx:callNew>
					</plx:initialize>
				</plx:local>
				<plx:local name="itemType" dataTypeName="Type" dataTypeQualifier="System">
					<plx:initialize>
						<plx:typeOf dataTypeName="Entity"/>
					</plx:initialize>
				</plx:local>
				<plx:local name="PropsInfo" dataTypeIsSimpleArray="true" dataTypeName="PropertyInfo" dataTypeQualifier="System.Reflection">
					<plx:initialize>
						<plx:callNew dataTypeIsSimpleArray="true" dataTypeName="PropertyInfo" dataTypeQualifier="System.Reflection">
							<plx:passParam>
								<plx:callInstance name="Count" type="property">
									<plx:callObject>
										<plx:nameRef name="ListOfExpressions"/>
									</plx:callObject>
								</plx:callInstance>
							</plx:passParam>
						</plx:callNew>
					</plx:initialize>
				</plx:local>
				<plx:loop>
					<plx:initializeLoop>
						<plx:local name="x" dataTypeName=".i4">
							<plx:initialize>
								<plx:value data="0" type="i4"/>
							</plx:initialize>
						</plx:local>
					</plx:initializeLoop>
					<plx:condition>
						<plx:binaryOperator type="lessThan">
							<plx:left>
								<plx:nameRef name="x"/>
							</plx:left>
							<plx:right>
								<plx:callInstance name="Count" type="property">
									<plx:callObject>
										<plx:nameRef name="ListOfExpressions"/>
									</plx:callObject>
								</plx:callInstance>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:beforeLoop>
						<plx:increment>
							<plx:nameRef name="x"/>
						</plx:increment>
					</plx:beforeLoop>
					<plx:assign>
						<plx:left>
							<plx:callInstance name=".implied" type="arrayIndexer">
								<plx:callObject>
									<plx:nameRef name="PropsInfo"/>
								</plx:callObject>
								<plx:passParam>
									<plx:nameRef name="x"/>
								</plx:passParam>
							</plx:callInstance>
						</plx:left>
						<plx:right>
							<plx:callInstance name="GetProperty">
								<plx:callObject>
									<plx:nameRef name="itemType"/>
								</plx:callObject>
								<plx:passParam>
									<plx:callInstance name="PropertyName" type="property">
										<plx:callObject>
											<plx:callInstance name="Item">
												<plx:callObject>
													<plx:nameRef name="ListOfExpressions"/>
												</plx:callObject>
												<plx:passParam>
													<plx:nameRef name="x"/>
												</plx:passParam>
											</plx:callInstance>
										</plx:callObject>
									</plx:callInstance>
								</plx:passParam>
								<plx:passParam>
									<plx:binaryOperator type="bitwiseOr">
										<plx:left>
											<plx:callStatic name="Public" type="field" dataTypeName="BindingFlags" dataTypeQualifier="System.Reflection"/>
										</plx:left>
										<plx:right>
											<plx:binaryOperator type="bitwiseOr">
												<plx:left>
													<plx:callStatic name="Instance" type="field" dataTypeName="BindingFlags" dataTypeQualifier="System.Reflection"/>
												</plx:left>
												<plx:right>
													<plx:callStatic name="IgnoreCase" type="field" dataTypeName="BindingFlags" dataTypeQualifier="System.Reflection"/>
												</plx:right>
											</plx:binaryOperator>
										</plx:right>
									</plx:binaryOperator>
								</plx:passParam>
							</plx:callInstance>
						</plx:right>
					</plx:assign>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="identityEquality">
								<plx:left>
									<plx:callInstance name=".implied" type="arrayIndexer">
										<plx:callObject>
											<plx:nameRef name="PropsInfo"/>
										</plx:callObject>
										<plx:passParam>
											<plx:nameRef name="x"/>
										</plx:passParam>
									</plx:callInstance>
								</plx:left>
								<plx:right>
									<plx:nullKeyword/>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:throw>
							<plx:callNew dataTypeName="Exception" dataTypeQualifier="System">
								<plx:passParam>
									<plx:callStatic name="Concat" dataTypeName=".string">
										<plx:passParam>
											<plx:string>property </plx:string>
										</plx:passParam>
										<plx:passParam>
											<plx:callInstance name="PropertyName" type="property">
												<plx:callObject>
													<plx:callInstance name="Item">
														<plx:callObject>
															<plx:nameRef name="ListOfExpressions"/>
														</plx:callObject>
														<plx:passParam>
															<plx:nameRef name="x"/>
														</plx:passParam>
													</plx:callInstance>
												</plx:callObject>
											</plx:callInstance>
										</plx:passParam>
										<plx:passParam>
											<plx:string> does not exist!</plx:string>
										</plx:passParam>
									</plx:callStatic>
								</plx:passParam>
							</plx:callNew>
						</plx:throw>
					</plx:branch>
				</plx:loop>
				<plx:loop>
					<plx:initializeLoop>
						<plx:local name="f" dataTypeName=".i4">
							<plx:initialize>
								<plx:value data="0" type="i4"/>
							</plx:initialize>
						</plx:local>
					</plx:initializeLoop>
					<plx:condition>
						<plx:binaryOperator type="lessThanOrEqual">
							<plx:left>
								<plx:nameRef name="f"/>
							</plx:left>
							<plx:right>
								<plx:binaryOperator type="subtract">
									<plx:left>
										<plx:callInstance name="Count" type="property">
											<plx:callObject>
												<plx:nameRef name="ObjectToFilter" type="parameter"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:left>
									<plx:right>
										<plx:value data="1" type="i4"/>
									</plx:right>
								</plx:binaryOperator>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:beforeLoop>
						<plx:increment>
							<plx:nameRef name="f"/>
						</plx:increment>
					</plx:beforeLoop>
					<plx:local name="CollectionItem" dataTypeName=".object">
						<plx:initialize>
							<plx:callInstance name=".implied" type="indexerCall">
								<plx:callObject>
									<plx:nameRef name="ObjectToFilter" type="parameter"/>
								</plx:callObject>
								<plx:passParam>
									<plx:nameRef name="f"/>
								</plx:passParam>
							</plx:callInstance>
						</plx:initialize>
					</plx:local>
					<plx:local name="Validations" dataTypeIsSimpleArray="true" dataTypeName=".boolean">
						<plx:initialize>
							<plx:callNew dataTypeIsSimpleArray="true" dataTypeName=".boolean">
								<plx:passParam>
									<plx:callInstance name="Count" type="property">
										<plx:callObject>
											<plx:nameRef name="ListOfExpressions"/>
										</plx:callObject>
									</plx:callInstance>
								</plx:passParam>
							</plx:callNew>
						</plx:initialize>
					</plx:local>
					<plx:local name="AllIsOK" dataTypeName=".boolean">
						<plx:initialize>
							<plx:trueKeyword/>
						</plx:initialize>
					</plx:local>
					<plx:loop>
						<plx:initializeLoop>
							<plx:local name="t" dataTypeName=".i4">
								<plx:initialize>
									<plx:value data="0" type="i4"/>
								</plx:initialize>
							</plx:local>
						</plx:initializeLoop>
						<plx:condition>
							<plx:binaryOperator type="lessThanOrEqual">
								<plx:left>
									<plx:nameRef name="t"/>
								</plx:left>
								<plx:right>
									<plx:binaryOperator type="subtract">
										<plx:left>
											<plx:callInstance name="Count" type="property">
												<plx:callObject>
													<plx:nameRef name="ListOfExpressions"/>
												</plx:callObject>
											</plx:callInstance>
										</plx:left>
										<plx:right>
											<plx:value data="1" type="i4"/>
										</plx:right>
									</plx:binaryOperator>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:beforeLoop>
							<plx:increment>
								<plx:nameRef name="t"/>
							</plx:increment>
						</plx:beforeLoop>
						<plx:local name="PropertyValue" dataTypeName=".object">
							<plx:initialize>
								<plx:callInstance name="GetValue">
									<plx:callObject>
										<plx:callInstance name=".implied" type="arrayIndexer">
											<plx:callObject>
												<plx:nameRef name="PropsInfo"/>
											</plx:callObject>
											<plx:passParam>
												<plx:nameRef name="t"/>
											</plx:passParam>
										</plx:callInstance>
									</plx:callObject>
									<plx:passParam>
										<plx:nameRef name="CollectionItem"/>
									</plx:passParam>
									<plx:passParam>
										<plx:callNew dataTypeIsSimpleArray="true" dataTypeName=".object">
											<plx:passParam>
												<plx:value data="0" type="i4"/>
											</plx:passParam>
										</plx:callNew>
									</plx:passParam>
								</plx:callInstance>
							</plx:initialize>
						</plx:local>
						<plx:branch>
							<plx:condition>
								<plx:binaryOperator type="identityEquality">
									<plx:left>
										<plx:nameRef name="PropertyValue"/>
									</plx:left>
									<plx:right>
										<plx:nullKeyword/>
									</plx:right>
								</plx:binaryOperator>
							</plx:condition>
							<plx:assign>
								<plx:left>
									<plx:callInstance name=".implied" type="arrayIndexer">
										<plx:callObject>
											<plx:nameRef name="Validations"/>
										</plx:callObject>
										<plx:passParam>
											<plx:nameRef name="t"/>
										</plx:passParam>
									</plx:callInstance>
								</plx:left>
								<plx:right>
									<plx:callThis name="IsOk">
										<plx:passParam>
											<plx:callInstance name="Operator" type="property">
												<plx:callObject>
													<plx:callInstance name="Item">
														<plx:callObject>
															<plx:nameRef name="ListOfExpressions"/>
														</plx:callObject>
														<plx:passParam>
															<plx:nameRef name="t"/>
														</plx:passParam>
													</plx:callInstance>
												</plx:callObject>
											</plx:callInstance>
										</plx:passParam>
										<plx:passParam>
											<plx:callInstance name="UserValue" type="property">
												<plx:callObject>
													<plx:callInstance name="Item">
														<plx:callObject>
															<plx:nameRef name="ListOfExpressions"/>
														</plx:callObject>
														<plx:passParam>
															<plx:nameRef name="t"/>
														</plx:passParam>
													</plx:callInstance>
												</plx:callObject>
											</plx:callInstance>
										</plx:passParam>
									</plx:callThis>
								</plx:right>
							</plx:assign>
						</plx:branch>
						<plx:fallbackBranch>
							<plx:assign>
								<plx:left>
									<plx:callInstance name=".implied" type="arrayIndexer">
										<plx:callObject>
											<plx:nameRef name="Validations"/>
										</plx:callObject>
										<plx:passParam>
											<plx:nameRef name="t"/>
										</plx:passParam>
									</plx:callInstance>
								</plx:left>
								<plx:right>
									<plx:callThis name="IsOk">
										<plx:passParam>
											<plx:nameRef name="PropertyValue"/>
										</plx:passParam>
										<plx:passParam>
											<plx:callInstance name="Operator" type="property">
												<plx:callObject>
													<plx:callInstance name="Item">
														<plx:callObject>
															<plx:nameRef name="ListOfExpressions"/>
														</plx:callObject>
														<plx:passParam>
															<plx:nameRef name="t"/>
														</plx:passParam>
													</plx:callInstance>
												</plx:callObject>
											</plx:callInstance>
										</plx:passParam>
										<plx:passParam>
											<plx:callInstance name="UserValue" type="property">
												<plx:callObject>
													<plx:callInstance name="Item">
														<plx:callObject>
															<plx:nameRef name="ListOfExpressions"/>
														</plx:callObject>
														<plx:passParam>
															<plx:nameRef name="t"/>
														</plx:passParam>
													</plx:callInstance>
												</plx:callObject>
											</plx:callInstance>
										</plx:passParam>
									</plx:callThis>
								</plx:right>
							</plx:assign>
						</plx:fallbackBranch>
						<plx:branch>
							<plx:condition>
								<plx:unaryOperator type="booleanNot">
									<plx:callInstance name=".implied" type="arrayIndexer">
										<plx:callObject>
											<plx:nameRef name="Validations"/>
										</plx:callObject>
										<plx:passParam>
											<plx:nameRef name="t"/>
										</plx:passParam>
									</plx:callInstance>
								</plx:unaryOperator>
							</plx:condition>
							<plx:assign>
								<plx:left>
									<plx:nameRef name="AllIsOK"/>
								</plx:left>
								<plx:right>
									<plx:falseKeyword/>
								</plx:right>
							</plx:assign>
						</plx:branch>
					</plx:loop>
					<plx:branch>
						<plx:condition>
							<plx:unaryOperator type="booleanNot">
								<plx:nameRef name="AllIsOK"/>
							</plx:unaryOperator>
						</plx:condition>
						<plx:callInstance name="RemoveFilteredItem">
							<plx:callObject>
								<plx:nameRef name="ObjectToFilter" type="parameter"/>
							</plx:callObject>
							<plx:passParam>
								<plx:nameRef name="f"/>
							</plx:passParam>
						</plx:callInstance>
						<plx:decrement>
							<plx:nameRef name="CountValue"/>
						</plx:decrement>
						<plx:decrement>
							<plx:nameRef name="f"/>
						</plx:decrement>
					</plx:branch>
				</plx:loop>
			</plx:function>
		</plx:class>
	</xsl:template>
	<xsl:template name="Enum">
		<!-- NOT DONE YET-->
	</xsl:template>
	<xsl:template name="EntityUtil">
		<plx:class name="EntityUtil" visibility="public" modifier="static" partial="true">
			<plx:leadingInfo>
				<plx:docComment>
					<summary>
Provides common utility methods for interacting with objects.
</summary>
				</plx:docComment>
			</plx:leadingInfo>
			<plx:function name="GetNewEntity" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Creates a new instance of the specified type.
</summary>
						<param name="type">The runtime type to instantiate.</param>
						<returns>An instance of the specified type.</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="type" dataTypeName="Type" dataTypeQualifier="System"/>
				<plx:returns dataTypeName=".object"/>
				<plx:return>
					<plx:callStatic name="GetNewEntity" dataTypeName="EntityUtil">
						<plx:passParam>
							<plx:nameRef name="type" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:nullKeyword/>
						</plx:passParam>
					</plx:callStatic>
				</plx:return>
			</plx:function>
			<plx:function name="GetNewEntity" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Creates a new instance of the specified type using the supplied
constructor parameters values.
</summary>
						<param name="type">The runtime type to instantiate.</param>
						<param name="args">The constructor parameter values.</param>
						<returns>An instance of the specified type.</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="type" dataTypeName="Type" dataTypeQualifier="System"/>
				<plx:param name="args" type="params" dataTypeIsSimpleArray="true" dataTypeName=".object"/>
				<plx:returns dataTypeName=".object"/>
				<plx:local name="c" dataTypeName="ConstructorInfo" dataTypeQualifier="System.Reflection">
					<plx:initialize>
						<plx:callStatic name="GetConstructor" dataTypeName="EntityUtil">
							<plx:passParam>
								<plx:nameRef name="type" type="parameter"/>
							</plx:passParam>
							<plx:passParam>
								<plx:callStatic name="GetTypes" dataTypeName="EntityUtil">
									<plx:passParam>
										<plx:nameRef name="args" type="parameter"/>
									</plx:passParam>
								</plx:callStatic>
							</plx:passParam>
						</plx:callStatic>
					</plx:initialize>
				</plx:local>
				<plx:return>
					<plx:inlineStatement dataTypeName=".object">
						<plx:conditionalOperator>
							<plx:condition>
								<plx:binaryOperator type="identityInequality">
									<plx:left>
										<plx:nameRef name="c"/>
									</plx:left>
									<plx:right>
										<plx:nullKeyword/>
									</plx:right>
								</plx:binaryOperator>
							</plx:condition>
							<plx:left>
								<plx:callInstance name="Invoke">
									<plx:callObject>
										<plx:nameRef name="c"/>
									</plx:callObject>
									<plx:passParam>
										<plx:nameRef name="args" type="parameter"/>
									</plx:passParam>
								</plx:callInstance>
							</plx:left>
							<plx:right>
								<plx:nullKeyword/>
							</plx:right>
						</plx:conditionalOperator>
					</plx:inlineStatement>
				</plx:return>
			</plx:function>
			<plx:function name="GetConstructor" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Gets the default constructor for the specified type.
</summary>
						<param name="type">The runtime type.</param>
						<returns>A <see cref="T:System.Reflection.ConstructorInfo" /> object.</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="type" dataTypeName="Type" dataTypeQualifier="System"/>
				<plx:returns dataTypeName="ConstructorInfo" dataTypeQualifier="System.Reflection"/>
				<plx:return>
					<plx:callStatic name="GetConstructor" dataTypeName="EntityUtil">
						<plx:passParam>
							<plx:nameRef name="type" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:nullKeyword/>
						</plx:passParam>
					</plx:callStatic>
				</plx:return>
			</plx:function>
			<plx:function name="GetConstructor" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Gets the constructor for the specified type whose parameters
match the supplied type array.
</summary>
						<param name="type">The runtime type.</param>
						<param name="types">An array of constructor parameter types.</param>
						<returns>A <see cref="T:System.Reflection.ConstructorInfo" /> object.</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="type" dataTypeName="Type" dataTypeQualifier="System"/>
				<plx:param name="types" dataTypeIsSimpleArray="true" dataTypeName="Type" dataTypeQualifier="System"/>
				<plx:returns dataTypeName="ConstructorInfo" dataTypeQualifier="System.Reflection"/>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="identityEquality">
							<plx:left>
								<plx:nameRef name="type" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:nullKeyword/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:return>
						<plx:nullKeyword/>
					</plx:return>
				</plx:branch>
				<plx:return>
					<plx:callInstance name="GetConstructor">
						<plx:callObject>
							<plx:nameRef name="type" type="parameter"/>
						</plx:callObject>
						<plx:passParam>
							<plx:inlineStatement dataTypeIsSimpleArray="true" dataTypeName="Type" dataTypeQualifier="System">
								<plx:nullFallbackOperator>
									<plx:left>
										<plx:nameRef name="types" type="parameter"/>
									</plx:left>
									<plx:right>
										<plx:callStatic name="EmptyTypes" type="field" dataTypeName="Type" dataTypeQualifier="System"/>
									</plx:right>
								</plx:nullFallbackOperator>
							</plx:inlineStatement>
						</plx:passParam>
					</plx:callInstance>
				</plx:return>
			</plx:function>
			<plx:function name="GetProperty" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Gets a <see cref="T:System.Reflection.PropertyInfo" /> object representing the property
belonging to the object having the specified name.
</summary>
						<param name="item">An object instance.</param>
						<param name="propertyName">The property name.</param>
						<returns>A <see cref="T:System.Reflection.PropertyInfo" /> object, or null if the object
            instance does not have a property with the specified name.</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="item" dataTypeName=".object"/>
				<plx:param name="propertyName" dataTypeName=".string"/>
				<plx:returns dataTypeName="PropertyInfo" dataTypeQualifier="System.Reflection"/>
				<plx:local name="prop" dataTypeName="PropertyInfo" dataTypeQualifier="System.Reflection">
					<plx:initialize>
						<plx:nullKeyword/>
					</plx:initialize>
				</plx:local>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="identityInequality">
							<plx:left>
								<plx:nameRef name="item" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:nullKeyword/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:assign>
						<plx:left>
							<plx:nameRef name="prop"/>
						</plx:left>
						<plx:right>
							<plx:callStatic name="GetProperty" dataTypeName="EntityUtil">
								<plx:passParam>
									<plx:callInstance name="GetType">
										<plx:callObject>
											<plx:nameRef name="item" type="parameter"/>
										</plx:callObject>
									</plx:callInstance>
								</plx:passParam>
								<plx:passParam>
									<plx:nameRef name="propertyName" type="parameter"/>
								</plx:passParam>
							</plx:callStatic>
						</plx:right>
					</plx:assign>
				</plx:branch>
				<plx:return>
					<plx:nameRef name="prop"/>
				</plx:return>
			</plx:function>
			<plx:function name="GetProperty" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Gets a <see cref="T:System.Reflection.PropertyInfo" /> object representing the property
belonging to the runtime type having the specified name.
</summary>
						<param name="type">The runtime type.</param>
						<param name="propertyName">The property name.</param>
						<returns>A <see cref="T:System.Reflection.PropertyInfo" /> object, or null if the runtime
            type does not have a property with the specified name.</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="type" dataTypeName="Type" dataTypeQualifier="System"/>
				<plx:param name="propertyName" dataTypeName=".string"/>
				<plx:returns dataTypeName="PropertyInfo" dataTypeQualifier="System.Reflection"/>
				<plx:local name="prop" dataTypeName="PropertyInfo" dataTypeQualifier="System.Reflection">
					<plx:initialize>
						<plx:nullKeyword/>
					</plx:initialize>
				</plx:local>
				<plx:branch>
					<plx:condition>
						<plx:unaryOperator type="booleanNot">
							<plx:binaryOperator type="booleanOr">
								<plx:left>
									<plx:binaryOperator type="identityEquality">
										<plx:left>
											<plx:nameRef name="type" type="parameter"/>
										</plx:left>
										<plx:right>
											<plx:nullKeyword/>
										</plx:right>
									</plx:binaryOperator>
								</plx:left>
								<plx:right>
									<plx:callStatic name="IsNullOrEmpty" dataTypeName=".string">
										<plx:passParam>
											<plx:nameRef name="propertyName" type="parameter"/>
										</plx:passParam>
									</plx:callStatic>
								</plx:right>
							</plx:binaryOperator>
						</plx:unaryOperator>
					</plx:condition>
					<plx:assign>
						<plx:left>
							<plx:nameRef name="prop"/>
						</plx:left>
						<plx:right>
							<plx:callInstance name="GetProperty">
								<plx:callObject>
									<plx:nameRef name="type" type="parameter"/>
								</plx:callObject>
								<plx:passParam>
									<plx:nameRef name="propertyName" type="parameter"/>
								</plx:passParam>
							</plx:callInstance>
						</plx:right>
					</plx:assign>
				</plx:branch>
				<plx:return>
					<plx:nameRef name="prop"/>
				</plx:return>
			</plx:function>
			<plx:function name="GetMethod" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Gets a <see cref="T:System.Reflection.MethodInfo" /> object representing the method
belonging to the object having the specified name.
</summary>
						<param name="item">An object instance.</param>
						<param name="methodName">The method name.</param>
						<returns>A <see cref="T:System.Reflection.MethodInfo" /> object, or null if the object
            instance does not have a method with the specified name.</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="item" dataTypeName=".object"/>
				<plx:param name="methodName" dataTypeName=".string"/>
				<plx:returns dataTypeName="MethodInfo" dataTypeQualifier="System.Reflection"/>
				<plx:return>
					<plx:callStatic name="GetMethod" dataTypeName="EntityUtil">
						<plx:passParam>
							<plx:nameRef name="item" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:nameRef name="methodName" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:nullKeyword/>
						</plx:passParam>
					</plx:callStatic>
				</plx:return>
			</plx:function>
			<plx:function name="GetMethod" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Gets a <see cref="T:System.Reflection.MethodInfo" /> object representing the method
belonging to the object having the specified name and whose
parameters match the specified types.
</summary>
						<param name="item">An object instance.</param>
						<param name="methodName">The method name.</param>
						<param name="types">The parameter types.</param>
						<returns>
A <see cref="T:System.Reflection.MethodInfo" /> object, or null if the object
instance does not have a method with the specified name.</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="item" dataTypeName=".object"/>
				<plx:param name="methodName" dataTypeName=".string"/>
				<plx:param name="types" type="params" dataTypeIsSimpleArray="true" dataTypeName="Type" dataTypeQualifier="System"/>
				<plx:returns dataTypeName="MethodInfo" dataTypeQualifier="System.Reflection"/>
				<plx:local name="m" dataTypeName="MethodInfo" dataTypeQualifier="System.Reflection">
					<plx:initialize>
						<plx:nullKeyword/>
					</plx:initialize>
				</plx:local>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="identityInequality">
							<plx:left>
								<plx:nameRef name="item" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:nullKeyword/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:assign>
						<plx:left>
							<plx:nameRef name="m"/>
						</plx:left>
						<plx:right>
							<plx:callStatic name="GetMethod" dataTypeName="EntityUtil">
								<plx:passParam>
									<plx:callInstance name="GetType">
										<plx:callObject>
											<plx:nameRef name="item" type="parameter"/>
										</plx:callObject>
									</plx:callInstance>
								</plx:passParam>
								<plx:passParam>
									<plx:nameRef name="methodName" type="parameter"/>
								</plx:passParam>
								<plx:passParam>
									<plx:nameRef name="types" type="parameter"/>
								</plx:passParam>
							</plx:callStatic>
						</plx:right>
					</plx:assign>
				</plx:branch>
				<plx:return>
					<plx:nameRef name="m"/>
				</plx:return>
			</plx:function>
			<plx:function name="GetMethod" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Gets a <see cref="T:System.Reflection.MethodInfo" /> object representing the method
belonging to the runtime type having the specified name.
</summary>
						<param name="type">The runtime type.</param>
						<param name="methodName">The method name.</param>
						<returns>
A <see cref="T:System.Reflection.MethodInfo" /> object, or null if the runtime
type does not have a method with the specified name.</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="type" dataTypeName="Type" dataTypeQualifier="System"/>
				<plx:param name="methodName" dataTypeName=".string"/>
				<plx:returns dataTypeName="MethodInfo" dataTypeQualifier="System.Reflection"/>
				<plx:return>
					<plx:callStatic name="GetMethod" dataTypeName="EntityUtil">
						<plx:passParam>
							<plx:nameRef name="type" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:nameRef name="methodName" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:nullKeyword/>
						</plx:passParam>
					</plx:callStatic>
				</plx:return>
			</plx:function>
			<plx:function name="GetMethod" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Gets a <see cref="T:System.Reflection.MethodInfo" /> object representing the method
belonging to the runtime type having the specified name and whose
parameters match the specified types.
</summary>
						<param name="type">The runtime type.</param>
						<param name="methodName">The method name.</param>
						<param name="types">The parameter types.</param>
						<returns>
A <see cref="T:System.Reflection.MethodInfo" /> object, or null if the runtime
type does not have a method with the specified name.</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="type" dataTypeName="Type" dataTypeQualifier="System"/>
				<plx:param name="methodName" dataTypeName=".string"/>
				<plx:param name="types" type="params" dataTypeIsSimpleArray="true" dataTypeName="Type" dataTypeQualifier="System"/>
				<plx:returns dataTypeName="MethodInfo" dataTypeQualifier="System.Reflection"/>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="booleanOr">
							<plx:left>
								<plx:binaryOperator type="identityEquality">
									<plx:left>
										<plx:nameRef name="type" type="parameter"/>
									</plx:left>
									<plx:right>
										<plx:nullKeyword/>
									</plx:right>
								</plx:binaryOperator>
							</plx:left>
							<plx:right>
								<plx:callStatic name="IsNullOrEmpty" dataTypeName=".string">
									<plx:passParam>
										<plx:nameRef name="methodName" type="parameter"/>
									</plx:passParam>
								</plx:callStatic>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:return>
						<plx:nullKeyword/>
					</plx:return>
				</plx:branch>
				<plx:return>
					<plx:callInstance name="GetMethod">
						<plx:callObject>
							<plx:nameRef name="type" type="parameter"/>
						</plx:callObject>
						<plx:passParam>
							<plx:nameRef name="methodName" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:inlineStatement dataTypeIsSimpleArray="true" dataTypeName="Type" dataTypeQualifier="System">
								<plx:nullFallbackOperator>
									<plx:left>
										<plx:nameRef name="types" type="parameter"/>
									</plx:left>
									<plx:right>
										<plx:callStatic name="EmptyTypes" type="field" dataTypeName="Type" dataTypeQualifier="System"/>
									</plx:right>
								</plx:nullFallbackOperator>
							</plx:inlineStatement>
						</plx:passParam>
					</plx:callInstance>
				</plx:return>
			</plx:function>
			<plx:function name="InvokeMethod" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Invokes the specified method on the object using reflection.
</summary>
						<param name="entity">An object instance.</param>
						<param name="methodName">The method name.</param>
						<returns>The result of the method invocation.</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="entity" dataTypeName=".object"/>
				<plx:param name="methodName" dataTypeName=".string"/>
				<plx:returns dataTypeName=".object"/>
				<plx:return>
					<plx:callStatic name="InvokeMethod" dataTypeName="EntityUtil">
						<plx:passParam>
							<plx:nameRef name="entity" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:nameRef name="methodName" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:nullKeyword/>
						</plx:passParam>
						<plx:passParam>
							<plx:nullKeyword/>
						</plx:passParam>
					</plx:callStatic>
				</plx:return>
			</plx:function>
			<plx:function name="InvokeMethod" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Invokes the specified method on the object using reflection.
Passes the supplied arguments as method parameters.
</summary>
						<param name="entity">An object instance.</param>
						<param name="methodName">The method name.</param>
						<param name="args">The method parameters.</param>
						<returns>The result of the method invocation.</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="entity" dataTypeName=".object"/>
				<plx:param name="methodName" dataTypeName=".string"/>
				<plx:param name="args" dataTypeIsSimpleArray="true" dataTypeName=".object"/>
				<plx:returns dataTypeName=".object"/>
				<plx:return>
					<plx:callStatic name="InvokeMethod" dataTypeName="EntityUtil">
						<plx:passParam>
							<plx:nameRef name="entity" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:nameRef name="methodName" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:nameRef name="args" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:callStatic name="GetTypes" dataTypeName="EntityUtil">
								<plx:passParam>
									<plx:nameRef name="args" type="parameter"/>
								</plx:passParam>
							</plx:callStatic>
						</plx:passParam>
					</plx:callStatic>
				</plx:return>
			</plx:function>
			<plx:function name="InvokeMethod" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Invokes the specified method on the object using reflection.
Passes the supplied arguments as method parameters.
</summary>
						<param name="entity">An object instance.</param>
						<param name="methodName">The method name.</param>
						<param name="args">The method parameters.</param>
						<param name="types">The method parameter types.</param>
						<returns>The result of the method invocation.</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="entity" dataTypeName=".object"/>
				<plx:param name="methodName" dataTypeName=".string"/>
				<plx:param name="args" dataTypeIsSimpleArray="true" dataTypeName=".object"/>
				<plx:param name="types" dataTypeIsSimpleArray="true" dataTypeName="Type" dataTypeQualifier="System"/>
				<plx:returns dataTypeName=".object"/>
				<plx:local name="m" dataTypeName="MethodInfo" dataTypeQualifier="System.Reflection">
					<plx:initialize>
						<plx:callStatic name="GetMethod" dataTypeName="EntityUtil">
							<plx:passParam>
								<plx:nameRef name="entity" type="parameter"/>
							</plx:passParam>
							<plx:passParam>
								<plx:nameRef name="methodName" type="parameter"/>
							</plx:passParam>
							<plx:passParam>
								<plx:nameRef name="types" type="parameter"/>
							</plx:passParam>
						</plx:callStatic>
					</plx:initialize>
				</plx:local>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="identityEquality">
							<plx:left>
								<plx:nameRef name="m"/>
							</plx:left>
							<plx:right>
								<plx:nullKeyword/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:local name="format" dataTypeName=".string">
						<plx:initialize>
							<plx:string>The method '{0}' with arguments '{1}' could not be located on the specified entity.</plx:string>
						</plx:initialize>
					</plx:local>
					<plx:local name="typesValue" dataTypeName=".string">
						<plx:initialize>
							<plx:inlineStatement dataTypeName=".string">
								<plx:conditionalOperator>
									<plx:condition>
										<plx:binaryOperator type="identityEquality">
											<plx:left>
												<plx:nameRef name="types" type="parameter"/>
											</plx:left>
											<plx:right>
												<plx:nullKeyword/>
											</plx:right>
										</plx:binaryOperator>
									</plx:condition>
									<plx:left>
										<plx:string>()</plx:string>
									</plx:left>
									<plx:right>
										<plx:callStatic name="Concat" dataTypeName=".string">
											<plx:passParam>
												<plx:string>(</plx:string>
											</plx:passParam>
											<plx:passParam>
												<plx:callStatic name="GetTypeNames" dataTypeName="EntityUtil">
													<plx:passParam>
														<plx:nameRef name="types" type="parameter"/>
													</plx:passParam>
												</plx:callStatic>
											</plx:passParam>
											<plx:passParam>
												<plx:string>)</plx:string>
											</plx:passParam>
										</plx:callStatic>
									</plx:right>
								</plx:conditionalOperator>
							</plx:inlineStatement>
						</plx:initialize>
					</plx:local>
					<plx:throw>
						<plx:callNew dataTypeName="ArgumentException" dataTypeQualifier="System">
							<plx:passParam>
								<plx:callStatic name="Format" dataTypeName=".string">
									<plx:passParam>
										<plx:nameRef name="format"/>
									</plx:passParam>
									<plx:passParam>
										<plx:nameRef name="methodName" type="parameter"/>
									</plx:passParam>
									<plx:passParam>
										<plx:nameRef name="typesValue"/>
									</plx:passParam>
								</plx:callStatic>
							</plx:passParam>
						</plx:callNew>
					</plx:throw>
				</plx:branch>
				<plx:return>
					<plx:callInstance name="Invoke">
						<plx:callObject>
							<plx:nameRef name="m"/>
						</plx:callObject>
						<plx:passParam>
							<plx:nameRef name="entity" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:nameRef name="args" type="parameter"/>
						</plx:passParam>
					</plx:callInstance>
				</plx:return>
			</plx:function>
			<plx:function name="GetType" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Gets the System.Type with the specified name.
</summary>
						<param name="typeName">The name of the type to get.</param>
						<returns>The System.Type with the specified name, if found; otherwise, null.</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="typeName" dataTypeName=".string"/>
				<plx:returns dataTypeName="Type" dataTypeQualifier="System"/>
				<plx:local name="type" dataTypeName="Type" dataTypeQualifier="System">
					<plx:initialize>
						<plx:nullKeyword/>
					</plx:initialize>
				</plx:local>
				<plx:branch>
					<plx:condition>
						<plx:unaryOperator type="booleanNot">
							<plx:callStatic name="IsNullOrEmpty" dataTypeName=".string">
								<plx:passParam>
									<plx:nameRef name="typeName" type="parameter"/>
								</plx:passParam>
							</plx:callStatic>
						</plx:unaryOperator>
					</plx:condition>
					<plx:assign>
						<plx:left>
							<plx:nameRef name="type"/>
						</plx:left>
						<plx:right>
							<plx:callStatic name="GetType" dataTypeName="Type" dataTypeQualifier="System">
								<plx:passParam>
									<plx:nameRef name="typeName" type="parameter"/>
								</plx:passParam>
								<plx:passParam>
									<plx:trueKeyword/>
								</plx:passParam>
							</plx:callStatic>
						</plx:right>
					</plx:assign>
				</plx:branch>
				<plx:return>
					<plx:nameRef name="type"/>
				</plx:return>
			</plx:function>
			<plx:function name="GetTypes" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Gets an array of System.Type objects which match the specified objects.
NOTE: this method will throw an exception if any of the values held
within the args array are null.
</summary>
						<param name="args">An array of objects.</param>
						<returns>An array of System.Type objects.</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="args" type="params" dataTypeIsSimpleArray="true" dataTypeName=".object"/>
				<plx:returns dataTypeIsSimpleArray="true" dataTypeName="Type" dataTypeQualifier="System"/>
				<plx:local name="types" dataTypeIsSimpleArray="true" dataTypeName="Type" dataTypeQualifier="System">
					<plx:initialize>
						<plx:callStatic name="EmptyTypes" type="field" dataTypeName="Type" dataTypeQualifier="System"/>
					</plx:initialize>
				</plx:local>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="identityInequality">
							<plx:left>
								<plx:nameRef name="args" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:nullKeyword/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:assign>
						<plx:left>
							<plx:nameRef name="types"/>
						</plx:left>
						<plx:right>
							<plx:callStatic name="GetTypeArray" dataTypeName="Type" dataTypeQualifier="System">
								<plx:passParam>
									<plx:nameRef name="args" type="parameter"/>
								</plx:passParam>
							</plx:callStatic>
						</plx:right>
					</plx:assign>
				</plx:branch>
				<plx:return>
					<plx:nameRef name="types"/>
				</plx:return>
			</plx:function>
			<plx:function name="GetPropertyValue" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Gets the value of the property with the specified name.
</summary>
						<param name="item">An object instance.</param>
						<param name="propertyName">The property name.</param>
						<returns>The property value.</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="item" dataTypeName=".object"/>
				<plx:param name="propertyName" dataTypeName=".string"/>
				<plx:returns dataTypeName=".object"/>
				<plx:local name="property" dataTypeName="PropertyInfo" dataTypeQualifier="System.Reflection">
					<plx:initialize>
						<plx:nullKeyword/>
					</plx:initialize>
				</plx:local>
				<plx:return>
					<plx:callStatic name="GetPropertyValue" dataTypeName="EntityUtil">
						<plx:passParam>
							<plx:nameRef name="item" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:nameRef name="propertyName" type="parameter"/>
						</plx:passParam>
						<plx:passParam type="out">
							<plx:nameRef name="property"/>
						</plx:passParam>
					</plx:callStatic>
				</plx:return>
			</plx:function>
			<plx:function name="GetPropertyValue" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Gets the value of the property with the specified name.
</summary>
						<param name="item">An object instance.</param>
						<param name="propertyName">The property name.</param>
						<param name="property">A reference to the <see cref="T:System.Reflection.PropertyInfo" /> object.</param>
						<returns>The property value.</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="item" dataTypeName=".object"/>
				<plx:param name="propertyName" dataTypeName=".string"/>
				<plx:param name="property" type="out" dataTypeName="PropertyInfo" dataTypeQualifier="System.Reflection"/>
				<plx:returns dataTypeName=".object"/>
				<plx:local name="value" dataTypeName=".object">
					<plx:initialize>
						<plx:nullKeyword/>
					</plx:initialize>
				</plx:local>
				<plx:assign>
					<plx:left>
						<plx:nameRef name="property" type="parameter"/>
					</plx:left>
					<plx:right>
						<plx:callStatic name="GetProperty" dataTypeName="EntityUtil">
							<plx:passParam>
								<plx:nameRef name="item" type="parameter"/>
							</plx:passParam>
							<plx:passParam>
								<plx:nameRef name="propertyName" type="parameter"/>
							</plx:passParam>
						</plx:callStatic>
					</plx:right>
				</plx:assign>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="booleanAnd">
							<plx:left>
								<plx:binaryOperator type="identityInequality">
									<plx:left>
										<plx:nameRef name="property" type="parameter"/>
									</plx:left>
									<plx:right>
										<plx:nullKeyword/>
									</plx:right>
								</plx:binaryOperator>
							</plx:left>
							<plx:right>
								<plx:callInstance name="CanRead" type="property">
									<plx:callObject>
										<plx:nameRef name="property" type="parameter"/>
									</plx:callObject>
								</plx:callInstance>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:assign>
						<plx:left>
							<plx:nameRef name="value"/>
						</plx:left>
						<plx:right>
							<plx:callInstance name="GetValue">
								<plx:callObject>
									<plx:nameRef name="property" type="parameter"/>
								</plx:callObject>
								<plx:passParam>
									<plx:nameRef name="item" type="parameter"/>
								</plx:passParam>
								<plx:passParam>
									<plx:nullKeyword/>
								</plx:passParam>
							</plx:callInstance>
						</plx:right>
					</plx:assign>
				</plx:branch>
				<plx:return>
					<plx:nameRef name="value"/>
				</plx:return>
			</plx:function>
			<plx:function name="GetStaticPropertyValue" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Gets the value of the static property with the specified name.
</summary>
						<param name="type">The runtime type.</param>
						<param name="propertyName">The property name.</param>
						<returns>The property value.</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="type" dataTypeName="Type" dataTypeQualifier="System"/>
				<plx:param name="propertyName" dataTypeName=".string"/>
				<plx:returns dataTypeName=".object"/>
				<plx:local name="property" dataTypeName="PropertyInfo" dataTypeQualifier="System.Reflection">
					<plx:initialize>
						<plx:nullKeyword/>
					</plx:initialize>
				</plx:local>
				<plx:return>
					<plx:callStatic name="GetStaticPropertyValue" dataTypeName="EntityUtil">
						<plx:passParam>
							<plx:nameRef name="type" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:nameRef name="propertyName" type="parameter"/>
						</plx:passParam>
						<plx:passParam type="out">
							<plx:nameRef name="property"/>
						</plx:passParam>
					</plx:callStatic>
				</plx:return>
			</plx:function>
			<plx:function name="GetStaticPropertyValue" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Gets the value of the static property with the specified name.
</summary>
						<param name="type">The runtime type.</param>
						<param name="propertyName">The property name.</param>
						<param name="property">A reference to the <see cref="T:System.Reflection.PropertyInfo" /> object.</param>
						<returns>The property value.</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="type" dataTypeName="Type" dataTypeQualifier="System"/>
				<plx:param name="propertyName" dataTypeName=".string"/>
				<plx:param name="property" type="out" dataTypeName="PropertyInfo" dataTypeQualifier="System.Reflection"/>
				<plx:returns dataTypeName=".object"/>
				<plx:local name="value" dataTypeName=".object">
					<plx:initialize>
						<plx:nullKeyword/>
					</plx:initialize>
				</plx:local>
				<plx:assign>
					<plx:left>
						<plx:nameRef name="property" type="parameter"/>
					</plx:left>
					<plx:right>
						<plx:callStatic name="GetProperty" dataTypeName="EntityUtil">
							<plx:passParam>
								<plx:nameRef name="type" type="parameter"/>
							</plx:passParam>
							<plx:passParam>
								<plx:nameRef name="propertyName" type="parameter"/>
							</plx:passParam>
						</plx:callStatic>
					</plx:right>
				</plx:assign>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="booleanAnd">
							<plx:left>
								<plx:binaryOperator type="identityInequality">
									<plx:left>
										<plx:nameRef name="property" type="parameter"/>
									</plx:left>
									<plx:right>
										<plx:nullKeyword/>
									</plx:right>
								</plx:binaryOperator>
							</plx:left>
							<plx:right>
								<plx:callInstance name="CanRead" type="property">
									<plx:callObject>
										<plx:nameRef name="property" type="parameter"/>
									</plx:callObject>
								</plx:callInstance>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:assign>
						<plx:left>
							<plx:nameRef name="value"/>
						</plx:left>
						<plx:right>
							<plx:callInstance name="GetValue">
								<plx:callObject>
									<plx:nameRef name="property" type="parameter"/>
								</plx:callObject>
								<plx:passParam>
									<plx:nullKeyword/>
								</plx:passParam>
								<plx:passParam>
									<plx:nullKeyword/>
								</plx:passParam>
							</plx:callInstance>
						</plx:right>
					</plx:assign>
				</plx:branch>
				<plx:return>
					<plx:nameRef name="value"/>
				</plx:return>
			</plx:function>
			<plx:function name="SetPropertyValue" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Sets the value of the property with the specified name.
</summary>
						<param name="item">An object instance.</param>
						<param name="propertyName">The property name.</param>
						<param name="propertyValue">The property value.</param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="item" dataTypeName=".object"/>
				<plx:param name="propertyName" dataTypeName=".string"/>
				<plx:param name="propertyValue" dataTypeName=".object"/>
				<plx:callStatic name="SetPropertyValue" dataTypeName="EntityUtil">
					<plx:passParam>
						<plx:nameRef name="item" type="parameter"/>
					</plx:passParam>
					<plx:passParam>
						<plx:nameRef name="propertyName" type="parameter"/>
					</plx:passParam>
					<plx:passParam>
						<plx:nameRef name="propertyValue" type="parameter"/>
					</plx:passParam>
					<plx:passParam>
						<plx:trueKeyword/>
					</plx:passParam>
				</plx:callStatic>
			</plx:function>
			<plx:function name="SetPropertyValue" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Sets the value of the property with the specified name.
</summary>
						<param name="item">An object instance.</param>
						<param name="propertyName">The property name.</param>
						<param name="propertyValue">The property value.</param>
						<param name="convertBlankToNull">Boolean indicating whether empty strings should be converted to null values.</param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="item" dataTypeName=".object"/>
				<plx:param name="propertyName" dataTypeName=".string"/>
				<plx:param name="propertyValue" dataTypeName=".object"/>
				<plx:param name="convertBlankToNull" dataTypeName=".boolean"/>
				<plx:local name="property" dataTypeName="PropertyInfo" dataTypeQualifier="System.Reflection">
					<plx:initialize>
						<plx:nullKeyword/>
					</plx:initialize>
				</plx:local>
				<plx:callStatic name="SetPropertyValue" dataTypeName="EntityUtil">
					<plx:passParam>
						<plx:nameRef name="item" type="parameter"/>
					</plx:passParam>
					<plx:passParam>
						<plx:nameRef name="propertyName" type="parameter"/>
					</plx:passParam>
					<plx:passParam>
						<plx:nameRef name="propertyValue" type="parameter"/>
					</plx:passParam>
					<plx:passParam type="out">
						<plx:nameRef name="property"/>
					</plx:passParam>
					<plx:passParam>
						<plx:nameRef name="convertBlankToNull" type="parameter"/>
					</plx:passParam>
				</plx:callStatic>
			</plx:function>
			<plx:function name="SetPropertyValue" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Sets the value of the property with the specified name.
</summary>
						<param name="item">An object instance.</param>
						<param name="propertyName">The property name.</param>
						<param name="propertyValue">The property value.</param>
						<param name="property">A reference to the <see cref="T:System.Reflection.PropertyInfo" /> object.</param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="item" dataTypeName=".object"/>
				<plx:param name="propertyName" dataTypeName=".string"/>
				<plx:param name="propertyValue" dataTypeName=".object"/>
				<plx:param name="property" type="out" dataTypeName="PropertyInfo" dataTypeQualifier="System.Reflection"/>
				<plx:callStatic name="SetPropertyValue" dataTypeName="EntityUtil">
					<plx:passParam>
						<plx:nameRef name="item" type="parameter"/>
					</plx:passParam>
					<plx:passParam>
						<plx:nameRef name="propertyName" type="parameter"/>
					</plx:passParam>
					<plx:passParam>
						<plx:nameRef name="propertyValue" type="parameter"/>
					</plx:passParam>
					<plx:passParam type="out">
						<plx:nameRef name="property" type="parameter"/>
					</plx:passParam>
					<plx:passParam>
						<plx:trueKeyword/>
					</plx:passParam>
				</plx:callStatic>
			</plx:function>
			<plx:function name="SetPropertyValue" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Sets the value of the property with the specified name.
</summary>
						<param name="item">An object instance.</param>
						<param name="propertyName">The property name.</param>
						<param name="propertyValue">The property value.</param>
						<param name="property">A reference to the <see cref="T:System.Reflection.PropertyInfo" /> object.</param>
						<param name="convertBlankToNull">Boolean indicating whether empty strings should be converted to null values.</param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="item" dataTypeName=".object"/>
				<plx:param name="propertyName" dataTypeName=".string"/>
				<plx:param name="propertyValue" dataTypeName=".object"/>
				<plx:param name="property" type="out" dataTypeName="PropertyInfo" dataTypeQualifier="System.Reflection"/>
				<plx:param name="convertBlankToNull" dataTypeName=".boolean"/>
				<plx:assign>
					<plx:left>
						<plx:nameRef name="property" type="parameter"/>
					</plx:left>
					<plx:right>
						<plx:callStatic name="GetProperty" dataTypeName="EntityUtil">
							<plx:passParam>
								<plx:nameRef name="item" type="parameter"/>
							</plx:passParam>
							<plx:passParam>
								<plx:nameRef name="propertyName" type="parameter"/>
							</plx:passParam>
						</plx:callStatic>
					</plx:right>
				</plx:assign>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="booleanAnd">
							<plx:left>
								<plx:binaryOperator type="identityInequality">
									<plx:left>
										<plx:nameRef name="property" type="parameter"/>
									</plx:left>
									<plx:right>
										<plx:nullKeyword/>
									</plx:right>
								</plx:binaryOperator>
							</plx:left>
							<plx:right>
								<plx:callInstance name="CanWrite" type="property">
									<plx:callObject>
										<plx:nameRef name="property" type="parameter"/>
									</plx:callObject>
								</plx:callInstance>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:local name="value" dataTypeName=".object">
						<plx:initialize>
							<plx:callStatic name="ChangeType" dataTypeName="EntityUtil">
								<plx:passParam>
									<plx:nameRef name="propertyValue" type="parameter"/>
								</plx:passParam>
								<plx:passParam>
									<plx:callInstance name="PropertyType" type="property">
										<plx:callObject>
											<plx:nameRef name="property" type="parameter"/>
										</plx:callObject>
									</plx:callInstance>
								</plx:passParam>
								<plx:passParam>
									<plx:nameRef name="convertBlankToNull" type="parameter"/>
								</plx:passParam>
							</plx:callStatic>
						</plx:initialize>
					</plx:local>
					<plx:callInstance name="SetValue">
						<plx:callObject>
							<plx:nameRef name="property" type="parameter"/>
						</plx:callObject>
						<plx:passParam>
							<plx:nameRef name="item" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:nameRef name="value"/>
						</plx:passParam>
						<plx:passParam>
							<plx:nullKeyword/>
						</plx:passParam>
					</plx:callInstance>
				</plx:branch>
			</plx:function>
			<plx:function name="SetEntityKeyValue" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Sets the value of the property with the specified name to the value
returned by the Guid.NewGuid() method.
</summary>
						<param name="entity">An object instance.</param>
						<param name="entityKeyName">The property name.</param>
						<returns>The property value.</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="entity" dataTypeName=".object"/>
				<plx:param name="entityKeyName" dataTypeName=".string"/>
				<plx:returns dataTypeName="Guid" dataTypeQualifier="System"/>
				<plx:local name="property" dataTypeName="PropertyInfo" dataTypeQualifier="System.Reflection">
					<plx:initialize>
						<plx:nullKeyword/>
					</plx:initialize>
				</plx:local>
				<plx:local name="objId" dataTypeName=".object">
					<plx:initialize>
						<plx:callStatic name="GetPropertyValue" dataTypeName="EntityUtil">
							<plx:passParam>
								<plx:nameRef name="entity" type="parameter"/>
							</plx:passParam>
							<plx:passParam>
								<plx:nameRef name="entityKeyName" type="parameter"/>
							</plx:passParam>
							<plx:passParam type="out">
								<plx:nameRef name="property"/>
							</plx:passParam>
						</plx:callStatic>
					</plx:initialize>
				</plx:local>
				<plx:local name="entityId" dataTypeName="Guid" dataTypeQualifier="System">
					<plx:initialize>
						<plx:callStatic name="Empty" type="field" dataTypeName="Guid" dataTypeQualifier="System"/>
					</plx:initialize>
				</plx:local>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="booleanAnd">
							<plx:left>
								<plx:binaryOperator type="booleanAnd">
									<plx:left>
										<plx:binaryOperator type="identityInequality">
											<plx:left>
												<plx:nameRef name="property"/>
											</plx:left>
											<plx:right>
												<plx:nullKeyword/>
											</plx:right>
										</plx:binaryOperator>
									</plx:left>
									<plx:right>
										<plx:callInstance name="IsAssignableFrom">
											<plx:callObject>
												<plx:callInstance name="PropertyType" type="property">
													<plx:callObject>
														<plx:nameRef name="property"/>
													</plx:callObject>
												</plx:callInstance>
											</plx:callObject>
											<plx:passParam>
												<plx:typeOf dataTypeName="Guid" dataTypeQualifier="System"/>
											</plx:passParam>
										</plx:callInstance>
									</plx:right>
								</plx:binaryOperator>
							</plx:left>
							<plx:right>
								<plx:binaryOperator type="booleanAnd">
									<plx:left>
										<plx:callInstance name="Equals">
											<plx:callObject>
												<plx:callStatic name="Empty" type="field" dataTypeName="Guid" dataTypeQualifier="System"/>
											</plx:callObject>
											<plx:passParam>
												<plx:nameRef name="objId"/>
											</plx:passParam>
										</plx:callInstance>
									</plx:left>
									<plx:right>
										<plx:callInstance name="CanWrite" type="property">
											<plx:callObject>
												<plx:nameRef name="property"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:right>
								</plx:binaryOperator>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:assign>
						<plx:left>
							<plx:nameRef name="entityId"/>
						</plx:left>
						<plx:right>
							<plx:callStatic name="NewGuid" dataTypeName="Guid" dataTypeQualifier="System"/>
						</plx:right>
					</plx:assign>
					<plx:callInstance name="SetValue">
						<plx:callObject>
							<plx:nameRef name="property"/>
						</plx:callObject>
						<plx:passParam>
							<plx:nameRef name="entity" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:nameRef name="entityId"/>
						</plx:passParam>
						<plx:passParam>
							<plx:nullKeyword/>
						</plx:passParam>
					</plx:callInstance>
				</plx:branch>
				<plx:return>
					<plx:nameRef name="entityId"/>
				</plx:return>
			</plx:function>
			<plx:function name="SetEntityValues" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Sets the properties of the specified entity based on the
name/value pairs found in the specified collection.
</summary>
						<param name="entity">The instance of an object to set the properties on.</param>
						<param name="values">An instance of System.Collections.IDictionary containing the name/value pairs.</param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="entity" dataTypeName=".object"/>
				<plx:param name="values" dataTypeName="IDictionary" dataTypeQualifier="System.Collections"/>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="booleanAnd">
							<plx:left>
								<plx:binaryOperator type="identityInequality">
									<plx:left>
										<plx:nameRef name="entity" type="parameter"/>
									</plx:left>
									<plx:right>
										<plx:nullKeyword/>
									</plx:right>
								</plx:binaryOperator>
							</plx:left>
							<plx:right>
								<plx:binaryOperator type="identityInequality">
									<plx:left>
										<plx:nameRef name="values" type="parameter"/>
									</plx:left>
									<plx:right>
										<plx:nullKeyword/>
									</plx:right>
								</plx:binaryOperator>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:iterator localName="oKey" dataTypeName=".object">
						<plx:initialize>
							<plx:callInstance name="Keys" type="property">
								<plx:callObject>
									<plx:nameRef name="values" type="parameter"/>
								</plx:callObject>
							</plx:callInstance>
						</plx:initialize>
						<plx:branch>
							<plx:condition>
								<plx:binaryOperator type="typeEquality">
									<plx:left>
										<plx:nameRef name="oKey"/>
									</plx:left>
									<plx:right>
										<plx:directTypeReference dataTypeName=".string"/>
									</plx:right>
								</plx:binaryOperator>
							</plx:condition>
							<plx:local name="oValue" dataTypeName=".object">
								<plx:initialize>
									<plx:callInstance name=".implied" type="indexerCall">
										<plx:callObject>
											<plx:nameRef name="values" type="parameter"/>
										</plx:callObject>
										<plx:passParam>
											<plx:nameRef name="oKey"/>
										</plx:passParam>
									</plx:callInstance>
								</plx:initialize>
							</plx:local>
							<plx:callStatic name="SetPropertyValue" dataTypeName="EntityUtil">
								<plx:passParam>
									<plx:nameRef name="entity" type="parameter"/>
								</plx:passParam>
								<plx:passParam>
									<plx:callInstance name="ToString">
										<plx:callObject>
											<plx:nameRef name="oKey"/>
										</plx:callObject>
									</plx:callInstance>
								</plx:passParam>
								<plx:passParam>
									<plx:nameRef name="oValue"/>
								</plx:passParam>
							</plx:callStatic>
						</plx:branch>
					</plx:iterator>
				</plx:branch>
			</plx:function>
			<plx:function name="InitEntityDateTimeValues" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Initializes the properties specified in propertyNames
with the value of DateTime.Now for the specified entity.
</summary>
						<param name="entity">The instance of an object to set the properties on.</param>
						<param name="propertyNames">The list of property names to initialize.</param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="entity" dataTypeName=".object"/>
				<plx:param name="propertyNames" type="params" dataTypeIsSimpleArray="true" dataTypeName=".string"/>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="booleanAnd">
							<plx:left>
								<plx:binaryOperator type="identityInequality">
									<plx:left>
										<plx:nameRef name="entity" type="parameter"/>
									</plx:left>
									<plx:right>
										<plx:nullKeyword/>
									</plx:right>
								</plx:binaryOperator>
							</plx:left>
							<plx:right>
								<plx:binaryOperator type="identityInequality">
									<plx:left>
										<plx:nameRef name="propertyNames" type="parameter"/>
									</plx:left>
									<plx:right>
										<plx:nullKeyword/>
									</plx:right>
								</plx:binaryOperator>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:iterator localName="name" dataTypeName=".string">
						<plx:initialize>
							<plx:nameRef name="propertyNames" type="parameter"/>
						</plx:initialize>
						<plx:local name="prop" dataTypeName="PropertyInfo" dataTypeQualifier="System.Reflection">
							<plx:initialize>
								<plx:callStatic name="GetProperty" dataTypeName="EntityUtil">
									<plx:passParam>
										<plx:nameRef name="entity" type="parameter"/>
									</plx:passParam>
									<plx:passParam>
										<plx:nameRef name="name"/>
									</plx:passParam>
								</plx:callStatic>
							</plx:initialize>
						</plx:local>
						<plx:branch>
							<plx:condition>
								<plx:binaryOperator type="booleanAnd">
									<plx:left>
										<plx:binaryOperator type="booleanAnd">
											<plx:left>
												<plx:binaryOperator type="identityInequality">
													<plx:left>
														<plx:nameRef name="prop"/>
													</plx:left>
													<plx:right>
														<plx:nullKeyword/>
													</plx:right>
												</plx:binaryOperator>
											</plx:left>
											<plx:right>
												<plx:callInstance name="CanWrite" type="property">
													<plx:callObject>
														<plx:nameRef name="prop"/>
													</plx:callObject>
												</plx:callInstance>
											</plx:right>
										</plx:binaryOperator>
									</plx:left>
									<plx:right>
										<plx:callInstance name="IsAssignableFrom">
											<plx:callObject>
												<plx:callInstance name="PropertyType" type="property">
													<plx:callObject>
														<plx:nameRef name="prop"/>
													</plx:callObject>
												</plx:callInstance>
											</plx:callObject>
											<plx:passParam>
												<plx:typeOf dataTypeName=".date"/>
											</plx:passParam>
										</plx:callInstance>
									</plx:right>
								</plx:binaryOperator>
							</plx:condition>
							<plx:callInstance name="SetValue">
								<plx:callObject>
									<plx:nameRef name="prop"/>
								</plx:callObject>
								<plx:passParam>
									<plx:nameRef name="entity" type="parameter"/>
								</plx:passParam>
								<plx:passParam>
									<plx:callStatic name="Now" type="property" dataTypeName=".date"/>
								</plx:passParam>
								<plx:passParam>
									<plx:nullKeyword/>
								</plx:passParam>
							</plx:callInstance>
						</plx:branch>
					</plx:iterator>
				</plx:branch>
			</plx:function>
			<plx:function name="IsPropertyValueEqual" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Determines if the property with the specified name equals the specified value.
</summary>
						<param name="item">An object instance.</param>
						<param name="propertyName">The property name.</param>
						<param name="propertyValue">The property value.</param>
						<returns>True if the property value matches the specified value; otherwise, false.</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="item" dataTypeName=".object"/>
				<plx:param name="propertyName" dataTypeName=".string"/>
				<plx:param name="propertyValue" dataTypeName=".object"/>
				<plx:returns dataTypeName=".boolean"/>
				<plx:local name="property" dataTypeName="PropertyInfo" dataTypeQualifier="System.Reflection">
					<plx:initialize>
						<plx:nullKeyword/>
					</plx:initialize>
				</plx:local>
				<plx:local name="prevValue" dataTypeName=".object">
					<plx:initialize>
						<plx:callStatic name="GetPropertyValue" dataTypeName="EntityUtil">
							<plx:passParam>
								<plx:nameRef name="item" type="parameter"/>
							</plx:passParam>
							<plx:passParam>
								<plx:nameRef name="propertyName" type="parameter"/>
							</plx:passParam>
							<plx:passParam type="out">
								<plx:nameRef name="property"/>
							</plx:passParam>
						</plx:callStatic>
					</plx:initialize>
				</plx:local>
				<plx:local name="currValue" dataTypeName=".object">
					<plx:initialize>
						<plx:nullKeyword/>
					</plx:initialize>
				</plx:local>
				<plx:local name="isEqual" dataTypeName=".boolean">
					<plx:initialize>
						<plx:falseKeyword/>
					</plx:initialize>
				</plx:local>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="identityInequality">
							<plx:left>
								<plx:nameRef name="property"/>
							</plx:left>
							<plx:right>
								<plx:nullKeyword/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:assign>
						<plx:left>
							<plx:nameRef name="currValue"/>
						</plx:left>
						<plx:right>
							<plx:callStatic name="ChangeType" dataTypeName="EntityUtil">
								<plx:passParam>
									<plx:nameRef name="propertyValue" type="parameter"/>
								</plx:passParam>
								<plx:passParam>
									<plx:callInstance name="PropertyType" type="property">
										<plx:callObject>
											<plx:nameRef name="property"/>
										</plx:callObject>
									</plx:callInstance>
								</plx:passParam>
							</plx:callStatic>
						</plx:right>
					</plx:assign>
					<plx:assign>
						<plx:left>
							<plx:nameRef name="isEqual"/>
						</plx:left>
						<plx:right>
							<plx:callStatic name="Equals" dataTypeName=".object">
								<plx:passParam>
									<plx:nameRef name="prevValue"/>
								</plx:passParam>
								<plx:passParam>
									<plx:nameRef name="currValue"/>
								</plx:passParam>
							</plx:callStatic>
						</plx:right>
					</plx:assign>
				</plx:branch>
				<plx:return>
					<plx:nameRef name="isEqual"/>
				</plx:return>
			</plx:function>
			<plx:function name="ChangeType" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Converts the specified value to the specified type.
</summary>
						<param name="value">The value to convert.</param>
						<param name="conversionType">A System.Type to convert to.</param>
						<returns>The results of the conversion.</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="value" dataTypeName=".object"/>
				<plx:param name="conversionType" dataTypeName="Type" dataTypeQualifier="System"/>
				<plx:returns dataTypeName=".object"/>
				<plx:return>
					<plx:callStatic name="ChangeType" dataTypeName="EntityUtil">
						<plx:passParam>
							<plx:nameRef name="value" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:nameRef name="conversionType" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:trueKeyword/>
						</plx:passParam>
					</plx:callStatic>
				</plx:return>
			</plx:function>
			<plx:function name="ChangeType" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Converts the specified value to the specified type.
</summary>
						<param name="value">The value to convert.</param>
						<param name="conversionType">A System.Type to convert to.</param>
						<param name="convertBlankToNull">A value indicating whether to treat empty string objects as null values.</param>
						<returns>The results of the conversion.</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="value" dataTypeName=".object"/>
				<plx:param name="conversionType" dataTypeName="Type" dataTypeQualifier="System"/>
				<plx:param name="convertBlankToNull" dataTypeName=".boolean"/>
				<plx:returns dataTypeName=".object"/>
				<plx:local name="newValue" dataTypeName=".object">
					<plx:initialize>
						<plx:nullKeyword/>
					</plx:initialize>
				</plx:local>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="booleanAnd">
							<plx:left>
								<plx:binaryOperator type="booleanAnd">
									<plx:left>
										<plx:binaryOperator type="booleanAnd">
											<plx:left>
												<plx:nameRef name="convertBlankToNull" type="parameter"/>
											</plx:left>
											<plx:right>
												<plx:binaryOperator type="identityInequality">
													<plx:left>
														<plx:nameRef name="value" type="parameter"/>
													</plx:left>
													<plx:right>
														<plx:nullKeyword/>
													</plx:right>
												</plx:binaryOperator>
											</plx:right>
										</plx:binaryOperator>
									</plx:left>
									<plx:right>
										<plx:binaryOperator type="typeEquality">
											<plx:left>
												<plx:nameRef name="value" type="parameter"/>
											</plx:left>
											<plx:right>
												<plx:directTypeReference dataTypeName=".string"/>
											</plx:right>
										</plx:binaryOperator>
									</plx:right>
								</plx:binaryOperator>
							</plx:left>
							<plx:right>
								<plx:callStatic name="IsNullOrEmpty" dataTypeName=".string">
									<plx:passParam>
										<plx:callInstance name="Trim">
											<plx:callObject>
												<plx:callInstance name="ToString">
													<plx:callObject>
														<plx:nameRef name="value" type="parameter"/>
													</plx:callObject>
												</plx:callInstance>
											</plx:callObject>
										</plx:callInstance>
									</plx:passParam>
								</plx:callStatic>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:assign>
						<plx:left>
							<plx:nameRef name="value" type="parameter"/>
						</plx:left>
						<plx:right>
							<plx:nullKeyword/>
						</plx:right>
					</plx:assign>
				</plx:branch>
				<plx:branch>
					<plx:condition>
						<plx:callInstance name="IsGenericType" type="property">
							<plx:callObject>
								<plx:nameRef name="conversionType" type="parameter"/>
							</plx:callObject>
						</plx:callInstance>
					</plx:condition>
					<plx:return>
						<plx:callStatic name="ChangeGenericType" dataTypeName="EntityUtil">
							<plx:passParam>
								<plx:nameRef name="value" type="parameter"/>
							</plx:passParam>
							<plx:passParam>
								<plx:nameRef name="conversionType" type="parameter"/>
							</plx:passParam>
							<plx:passParam>
								<plx:nameRef name="convertBlankToNull" type="parameter"/>
							</plx:passParam>
						</plx:callStatic>
					</plx:return>
				</plx:branch>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="identityEquality">
							<plx:left>
								<plx:nameRef name="value" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:nullKeyword/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:return>
						<plx:nameRef name="newValue"/>
					</plx:return>
				</plx:branch>
				<plx:branch>
					<plx:condition>
						<plx:unaryOperator type="booleanNot">
							<plx:binaryOperator type="typeEquality">
								<plx:left>
									<plx:nameRef name="value" type="parameter"/>
								</plx:left>
								<plx:right>
									<plx:directTypeReference dataTypeName="IConvertible" dataTypeQualifier="System"/>
								</plx:right>
							</plx:binaryOperator>
						</plx:unaryOperator>
					</plx:condition>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="identityEquality">
								<plx:left>
									<plx:nameRef name="conversionType" type="parameter"/>
								</plx:left>
								<plx:right>
									<plx:typeOf dataTypeIsSimpleArray="true" dataTypeName=".u1"/>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:assign>
							<plx:left>
								<plx:nameRef name="newValue"/>
							</plx:left>
							<plx:right>
								<plx:nameRef name="value" type="parameter"/>
							</plx:right>
						</plx:assign>
					</plx:branch>
					<plx:fallbackBranch>
						<plx:assign>
							<plx:left>
								<plx:nameRef name="value" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:callInstance name="ToString">
									<plx:callObject>
										<plx:nameRef name="value" type="parameter"/>
									</plx:callObject>
								</plx:callInstance>
							</plx:right>
						</plx:assign>
					</plx:fallbackBranch>
				</plx:branch>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="identityEquality">
							<plx:left>
								<plx:nameRef name="conversionType" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:typeOf dataTypeName="Guid" dataTypeQualifier="System"/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:branch>
						<plx:condition>
							<plx:unaryOperator type="booleanNot">
								<plx:callStatic name="IsNullOrEmpty" dataTypeName=".string">
									<plx:passParam>
										<plx:callInstance name="ToString">
											<plx:callObject>
												<plx:nameRef name="value" type="parameter"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:passParam>
								</plx:callStatic>
							</plx:unaryOperator>
						</plx:condition>
						<plx:assign>
							<plx:left>
								<plx:nameRef name="newValue"/>
							</plx:left>
							<plx:right>
								<plx:callNew dataTypeName="Guid" dataTypeQualifier="System">
									<plx:passParam>
										<plx:callInstance name="ToString">
											<plx:callObject>
												<plx:nameRef name="value" type="parameter"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:passParam>
								</plx:callNew>
							</plx:right>
						</plx:assign>
					</plx:branch>
					<plx:return>
						<plx:nameRef name="newValue"/>
					</plx:return>
				</plx:branch>
				<plx:return>
					<plx:callStatic name="ChangeType" dataTypeName="Convert" dataTypeQualifier="System">
						<plx:passParam>
							<plx:nameRef name="value" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:nameRef name="conversionType" type="parameter"/>
						</plx:passParam>
					</plx:callStatic>
				</plx:return>
			</plx:function>
			<plx:function name="ChangeGenericType" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Converts the specified value to the specified generic type.
</summary>
						<param name="value">The value to convert.</param>
						<param name="conversionType">A System.Type to convert to.</param>
						<returns>The result of the conversion.</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="value" dataTypeName=".object"/>
				<plx:param name="conversionType" dataTypeName="Type" dataTypeQualifier="System"/>
				<plx:returns dataTypeName=".object"/>
				<plx:return>
					<plx:callStatic name="ChangeGenericType" dataTypeName="EntityUtil">
						<plx:passParam>
							<plx:nameRef name="value" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:nameRef name="conversionType" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:trueKeyword/>
						</plx:passParam>
					</plx:callStatic>
				</plx:return>
			</plx:function>
			<plx:function name="ChangeGenericType" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Converts the specified value to the specified generic type.
</summary>
						<param name="value">The value to convert.</param>
						<param name="conversionType">A System.Type to convert to.</param>
						<param name="convertBlankToNull">A value indicating whether to treat empty string objects as null values.</param>
						<returns>The results of the conversion.</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="value" dataTypeName=".object"/>
				<plx:param name="conversionType" dataTypeName="Type" dataTypeQualifier="System"/>
				<plx:param name="convertBlankToNull" dataTypeName=".boolean"/>
				<plx:returns dataTypeName=".object"/>
				<plx:local name="newValue" dataTypeName=".object">
					<plx:initialize>
						<plx:nullKeyword/>
					</plx:initialize>
				</plx:local>
				<plx:branch>
					<plx:condition>
						<plx:callInstance name="IsGenericType" type="property">
							<plx:callObject>
								<plx:nameRef name="conversionType" type="parameter"/>
							</plx:callObject>
						</plx:callInstance>
					</plx:condition>
					<plx:local name="typeDef" dataTypeName="Type" dataTypeQualifier="System">
						<plx:initialize>
							<plx:callInstance name="GetGenericTypeDefinition">
								<plx:callObject>
									<plx:nameRef name="conversionType" type="parameter"/>
								</plx:callObject>
							</plx:callInstance>
						</plx:initialize>
					</plx:local>
					<plx:local name="typeArgs" dataTypeIsSimpleArray="true" dataTypeName="Type" dataTypeQualifier="System">
						<plx:initialize>
							<plx:callInstance name="GetGenericArguments">
								<plx:callObject>
									<plx:nameRef name="conversionType" type="parameter"/>
								</plx:callObject>
							</plx:callInstance>
						</plx:initialize>
					</plx:local>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="equality">
								<plx:left>
									<plx:callInstance name="Length" type="property">
										<plx:callObject>
											<plx:nameRef name="typeArgs"/>
										</plx:callObject>
									</plx:callInstance>
								</plx:left>
								<plx:right>
									<plx:value data="1" type="i4"/>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:local name="newType" dataTypeName="Type" dataTypeQualifier="System">
							<plx:initialize>
								<plx:callInstance name=".implied" type="arrayIndexer">
									<plx:callObject>
										<plx:nameRef name="typeArgs"/>
									</plx:callObject>
									<plx:passParam>
										<plx:value data="0" type="i4"/>
									</plx:passParam>
								</plx:callInstance>
							</plx:initialize>
						</plx:local>
						<plx:local name="arg" dataTypeName=".object">
							<plx:initialize>
								<plx:callStatic name="ChangeType" dataTypeName="EntityUtil">
									<plx:passParam>
										<plx:nameRef name="value" type="parameter"/>
									</plx:passParam>
									<plx:passParam>
										<plx:nameRef name="newType"/>
									</plx:passParam>
									<plx:passParam>
										<plx:nameRef name="convertBlankToNull" type="parameter"/>
									</plx:passParam>
								</plx:callStatic>
							</plx:initialize>
						</plx:local>
						<plx:assign>
							<plx:left>
								<plx:nameRef name="newValue"/>
							</plx:left>
							<plx:right>
								<plx:callStatic name="GetNewGenericEntity" dataTypeName="EntityUtil">
									<plx:passParam>
										<plx:nameRef name="typeDef"/>
									</plx:passParam>
									<plx:passParam>
										<plx:nameRef name="typeArgs"/>
									</plx:passParam>
									<plx:passParamArray dataTypeIsSimpleArray="true" dataTypeName=".object">
										<plx:passParam>
											<plx:nameRef name="arg"/>
										</plx:passParam>
									</plx:passParamArray>
								</plx:callStatic>
							</plx:right>
						</plx:assign>
					</plx:branch>
				</plx:branch>
				<plx:return>
					<plx:nameRef name="newValue"/>
				</plx:return>
			</plx:function>
			<plx:function name="MakeGenericType" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Creates a reference to a generic type using the specified type definition
and the supplied type arguments.
</summary>
						<param name="typeDefinition">A generic type definition.</param>
						<param name="typeArguments">An array of System.Type arguments.</param>
						<returns>A System.Type representing the generic type.</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="typeDefinition" dataTypeName="Type" dataTypeQualifier="System"/>
				<plx:param name="typeArguments" dataTypeIsSimpleArray="true" dataTypeName="Type" dataTypeQualifier="System"/>
				<plx:returns dataTypeName="Type" dataTypeQualifier="System"/>
				<plx:local name="genericType" dataTypeName="Type" dataTypeQualifier="System">
					<plx:initialize>
						<plx:nullKeyword/>
					</plx:initialize>
				</plx:local>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="booleanAnd">
							<plx:left>
								<plx:binaryOperator type="booleanAnd">
									<plx:left>
										<plx:binaryOperator type="identityInequality">
											<plx:left>
												<plx:nameRef name="typeDefinition" type="parameter"/>
											</plx:left>
											<plx:right>
												<plx:nullKeyword/>
											</plx:right>
										</plx:binaryOperator>
									</plx:left>
									<plx:right>
										<plx:binaryOperator type="identityInequality">
											<plx:left>
												<plx:nameRef name="typeArguments" type="parameter"/>
											</plx:left>
											<plx:right>
												<plx:nullKeyword/>
											</plx:right>
										</plx:binaryOperator>
									</plx:right>
								</plx:binaryOperator>
							</plx:left>
							<plx:right>
								<plx:binaryOperator type="greaterThan">
									<plx:left>
										<plx:callInstance name="Length" type="property">
											<plx:callObject>
												<plx:nameRef name="typeArguments" type="parameter"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:left>
									<plx:right>
										<plx:value data="0" type="i4"/>
									</plx:right>
								</plx:binaryOperator>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:assign>
						<plx:left>
							<plx:nameRef name="genericType"/>
						</plx:left>
						<plx:right>
							<plx:callInstance name="MakeGenericType">
								<plx:callObject>
									<plx:nameRef name="typeDefinition" type="parameter"/>
								</plx:callObject>
								<plx:passParam>
									<plx:nameRef name="typeArguments" type="parameter"/>
								</plx:passParam>
							</plx:callInstance>
						</plx:right>
					</plx:assign>
				</plx:branch>
				<plx:return>
					<plx:nameRef name="genericType"/>
				</plx:return>
			</plx:function>
			<plx:function name="GetNewGenericEntity" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Creates a new instance of the specified generic type.
</summary>
						<param name="typeDefinition">A generic type definition.</param>
						<param name="typeArguments">An array of System.Type arguments.</param>
						<param name="args">An array of constructor parameters values.</param>
						<returns>An instance of the generic type.</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="typeDefinition" dataTypeName="Type" dataTypeQualifier="System"/>
				<plx:param name="typeArguments" dataTypeIsSimpleArray="true" dataTypeName="Type" dataTypeQualifier="System"/>
				<plx:param name="args" type="params" dataTypeIsSimpleArray="true" dataTypeName=".object"/>
				<plx:returns dataTypeName=".object"/>
				<plx:return>
					<plx:callStatic name="GetNewGenericEntity" dataTypeName="EntityUtil">
						<plx:passParam>
							<plx:callStatic name="MakeGenericType" dataTypeName="EntityUtil">
								<plx:passParam>
									<plx:nameRef name="typeDefinition" type="parameter"/>
								</plx:passParam>
								<plx:passParam>
									<plx:nameRef name="typeArguments" type="parameter"/>
								</plx:passParam>
							</plx:callStatic>
						</plx:passParam>
						<plx:passParam>
							<plx:nameRef name="args" type="parameter"/>
						</plx:passParam>
					</plx:callStatic>
				</plx:return>
			</plx:function>
			<plx:function name="GetNewGenericEntity" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Creates a new instance of the specified generic type.
</summary>
						<param name="genericType">The runtime type.</param>
						<returns>An instance of the generic type.</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="genericType" dataTypeName="Type" dataTypeQualifier="System"/>
				<plx:returns dataTypeName=".object"/>
				<plx:return>
					<plx:callStatic name="GetNewGenericEntity" dataTypeName="EntityUtil">
						<plx:passParam>
							<plx:nameRef name="genericType" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:nullKeyword/>
						</plx:passParam>
						<plx:passParamArray dataTypeIsSimpleArray="true" dataTypeName=".object"/>
					</plx:callStatic>
				</plx:return>
			</plx:function>
			<plx:function name="GetNewGenericEntity" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Creates a new instance of the specified generic type.
</summary>
						<param name="genericType">The runtime type.</param>
						<param name="args">An array of constructor parameters values.</param>
						<returns>An instance of the generic type.</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="genericType" dataTypeName="Type" dataTypeQualifier="System"/>
				<plx:param name="args" type="params" dataTypeIsSimpleArray="true" dataTypeName=".object"/>
				<plx:returns dataTypeName=".object"/>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="identityEquality">
							<plx:left>
								<plx:nameRef name="genericType" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:nullKeyword/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:return>
						<plx:nullKeyword/>
					</plx:return>
				</plx:branch>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="booleanAnd">
							<plx:left>
								<plx:binaryOperator type="booleanAnd">
									<plx:left>
										<plx:binaryOperator type="identityInequality">
											<plx:left>
												<plx:nameRef name="args" type="parameter"/>
											</plx:left>
											<plx:right>
												<plx:nullKeyword/>
											</plx:right>
										</plx:binaryOperator>
									</plx:left>
									<plx:right>
										<plx:binaryOperator type="equality">
											<plx:left>
												<plx:callInstance name="Length" type="property">
													<plx:callObject>
														<plx:nameRef name="args" type="parameter"/>
													</plx:callObject>
												</plx:callInstance>
											</plx:left>
											<plx:right>
												<plx:value data="1" type="i4"/>
											</plx:right>
										</plx:binaryOperator>
									</plx:right>
								</plx:binaryOperator>
							</plx:left>
							<plx:right>
								<plx:binaryOperator type="identityEquality">
									<plx:left>
										<plx:callInstance name=".implied" type="arrayIndexer">
											<plx:callObject>
												<plx:nameRef name="args" type="parameter"/>
											</plx:callObject>
											<plx:passParam>
												<plx:value data="0" type="i4"/>
											</plx:passParam>
										</plx:callInstance>
									</plx:left>
									<plx:right>
										<plx:nullKeyword/>
									</plx:right>
								</plx:binaryOperator>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:assign>
						<plx:left>
							<plx:nameRef name="args" type="parameter"/>
						</plx:left>
						<plx:right>
							<plx:nullKeyword/>
						</plx:right>
					</plx:assign>
				</plx:branch>
				<plx:return>
					<plx:callStatic name="CreateInstance" dataTypeName="Activator" dataTypeQualifier="System">
						<plx:passParam>
							<plx:nameRef name="genericType" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:nameRef name="args" type="parameter"/>
						</plx:passParam>
					</plx:callStatic>
				</plx:return>
			</plx:function>
			<plx:function name="HasEntities" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Gets a value indicating whether the specified list contains any items.
</summary>
						<param name="entities">A collection of objects.</param>
						<returns>True if the collection is not null and contains at least one item; otherwise false.</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="entities" dataTypeName="IList" dataTypeQualifier="System.Collections"/>
				<plx:returns dataTypeName=".boolean"/>
				<plx:return>
					<plx:binaryOperator type="booleanAnd">
						<plx:left>
							<plx:binaryOperator type="identityInequality">
								<plx:left>
									<plx:nameRef name="entities" type="parameter"/>
								</plx:left>
								<plx:right>
									<plx:nullKeyword/>
								</plx:right>
							</plx:binaryOperator>
						</plx:left>
						<plx:right>
							<plx:binaryOperator type="greaterThan">
								<plx:left>
									<plx:callInstance name="Count" type="property">
										<plx:callObject>
											<plx:nameRef name="entities" type="parameter"/>
										</plx:callObject>
									</plx:callInstance>
								</plx:left>
								<plx:right>
									<plx:value data="0" type="i4"/>
								</plx:right>
							</plx:binaryOperator>
						</plx:right>
					</plx:binaryOperator>
				</plx:return>
			</plx:function>
			<plx:function name="GetEntity" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Gets the item within entityList whose property value matches the specifed value.
</summary>
						<param name="entities">A collection of objects.</param>
						<param name="propertyName">The property name.</param>
						<param name="propertyValue">The property value.</param>
						<returns>The object whose property value matches the specified value.</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="entities" dataTypeName="IList" dataTypeQualifier="System.Collections"/>
				<plx:param name="propertyName" dataTypeName=".string"/>
				<plx:param name="propertyValue" dataTypeName=".object"/>
				<plx:returns dataTypeName=".object"/>
				<plx:branch>
					<plx:condition>
						<plx:callStatic name="HasEntities" dataTypeName="EntityUtil">
							<plx:passParam>
								<plx:nameRef name="entities" type="parameter"/>
							</plx:passParam>
						</plx:callStatic>
					</plx:condition>
					<plx:iterator localName="entity" dataTypeName=".object">
						<plx:initialize>
							<plx:nameRef name="entities" type="parameter"/>
						</plx:initialize>
						<plx:branch>
							<plx:condition>
								<plx:callStatic name="IsPropertyValueEqual" dataTypeName="EntityUtil">
									<plx:passParam>
										<plx:nameRef name="entity"/>
									</plx:passParam>
									<plx:passParam>
										<plx:nameRef name="propertyName" type="parameter"/>
									</plx:passParam>
									<plx:passParam>
										<plx:nameRef name="propertyValue" type="parameter"/>
									</plx:passParam>
								</plx:callStatic>
							</plx:condition>
							<plx:return>
								<plx:nameRef name="entity"/>
							</plx:return>
						</plx:branch>
					</plx:iterator>
				</plx:branch>
				<plx:return>
					<plx:nullKeyword/>
				</plx:return>
			</plx:function>
			<plx:function name="GetEntity" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Gets the item within entityList at the position specified by index.
</summary>
						<param name="entityList">The collection of business objects.</param>
						<param name="index">The position within entityList that contains the current item.</param>
						<returns>The current business object.</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="entityList" dataTypeName="IEnumerable" dataTypeQualifier="System.Collections"/>
				<plx:param name="index" dataTypeName=".i4"/>
				<plx:returns dataTypeName=".object"/>
				<plx:local name="list" dataTypeName="IList" dataTypeQualifier="System.Collections">
					<plx:initialize>
						<plx:callStatic name="GetEntityList" dataTypeName="EntityUtil">
							<plx:passParam>
								<plx:nameRef name="entityList" type="parameter"/>
							</plx:passParam>
						</plx:callStatic>
					</plx:initialize>
				</plx:local>
				<plx:local name="entity" dataTypeName=".object">
					<plx:initialize>
						<plx:nullKeyword/>
					</plx:initialize>
				</plx:local>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="greaterThan">
							<plx:left>
								<plx:callInstance name="Count" type="property">
									<plx:callObject>
										<plx:nameRef name="list"/>
									</plx:callObject>
								</plx:callInstance>
							</plx:left>
							<plx:right>
								<plx:nameRef name="index" type="parameter"/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:assign>
						<plx:left>
							<plx:nameRef name="entity"/>
						</plx:left>
						<plx:right>
							<plx:callInstance name=".implied" type="indexerCall">
								<plx:callObject>
									<plx:nameRef name="list"/>
								</plx:callObject>
								<plx:passParam>
									<plx:nameRef name="index" type="parameter"/>
								</plx:passParam>
							</plx:callInstance>
						</plx:right>
					</plx:assign>
				</plx:branch>
				<plx:return>
					<plx:nameRef name="entity"/>
				</plx:return>
			</plx:function>
			<plx:function name="GetEntityList" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Gets the value of the property with the specified name and returns
it as a collection of objects.
</summary>
						<param name="entity">An object instance.</param>
						<param name="propertyName">The property name.</param>
						<returns>A collection of objects.</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="entity" dataTypeName=".object"/>
				<plx:param name="propertyName" dataTypeName=".string"/>
				<plx:returns dataTypeName="IList" dataTypeQualifier="System.Collections"/>
				<plx:return>
					<plx:callStatic name="GetEntityList" dataTypeName="EntityUtil">
						<plx:passParam>
							<plx:callStatic name="GetPropertyValue" dataTypeName="EntityUtil">
								<plx:passParam>
									<plx:nameRef name="entity" type="parameter"/>
								</plx:passParam>
								<plx:passParam>
									<plx:nameRef name="propertyName" type="parameter"/>
								</plx:passParam>
							</plx:callStatic>
						</plx:passParam>
					</plx:callStatic>
				</plx:return>
			</plx:function>
			<plx:function name="GetEntityList" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Converts the specified object into a collection of objects.
</summary>
						<param name="entityList">An object instance.</param>
						<returns>A collection of objects.</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="entityList" dataTypeName=".object"/>
				<plx:returns dataTypeName="IList" dataTypeQualifier="System.Collections"/>
				<plx:local name="list" dataTypeName="IList" dataTypeQualifier="System.Collections">
					<plx:initialize>
						<plx:nullKeyword/>
					</plx:initialize>
				</plx:local>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="identityEquality">
							<plx:left>
								<plx:nameRef name="entityList" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:nullKeyword/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:return>
						<plx:callNew dataTypeName="ArrayList" dataTypeQualifier="System.Collections"/>
					</plx:return>
				</plx:branch>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="typeEquality">
							<plx:left>
								<plx:nameRef name="entityList" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:directTypeReference dataTypeName="IList" dataTypeQualifier="System.Collections"/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:return>
						<plx:cast dataTypeName="IList" dataTypeQualifier="System.Collections">
							<plx:nameRef name="entityList" type="parameter"/>
						</plx:cast>
					</plx:return>
				</plx:branch>
				<plx:assign>
					<plx:left>
						<plx:nameRef name="list"/>
					</plx:left>
					<plx:right>
						<plx:callNew dataTypeName="ArrayList" dataTypeQualifier="System.Collections"/>
					</plx:right>
				</plx:assign>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="typeEquality">
							<plx:left>
								<plx:nameRef name="entityList" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:directTypeReference dataTypeName="IEnumerable" dataTypeQualifier="System.Collections"/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:local name="temp" dataTypeName="IEnumerable" dataTypeQualifier="System.Collections">
						<plx:initialize>
							<plx:cast type="testCast" dataTypeName="IEnumerable" dataTypeQualifier="System.Collections">
								<plx:nameRef name="entityList" type="parameter"/>
							</plx:cast>
						</plx:initialize>
					</plx:local>
					<plx:iterator localName="item" dataTypeName=".object">
						<plx:initialize>
							<plx:nameRef name="temp"/>
						</plx:initialize>
						<plx:branch>
							<plx:condition>
								<plx:binaryOperator type="identityInequality">
									<plx:left>
										<plx:nameRef name="item"/>
									</plx:left>
									<plx:right>
										<plx:nullKeyword/>
									</plx:right>
								</plx:binaryOperator>
							</plx:condition>
							<plx:callInstance name="Add">
								<plx:callObject>
									<plx:nameRef name="list"/>
								</plx:callObject>
								<plx:passParam>
									<plx:nameRef name="item"/>
								</plx:passParam>
							</plx:callInstance>
						</plx:branch>
					</plx:iterator>
					<plx:return>
						<plx:nameRef name="list"/>
					</plx:return>
				</plx:branch>
				<plx:callInstance name="Add">
					<plx:callObject>
						<plx:nameRef name="list"/>
					</plx:callObject>
					<plx:passParam>
						<plx:nameRef name="entityList" type="parameter"/>
					</plx:passParam>
				</plx:callInstance>
				<plx:return>
					<plx:nameRef name="list"/>
				</plx:return>
			</plx:function>
			<plx:function name="Add" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Adds the specified object to the collection of objects.
</summary>
						<param name="list">A collection of objects.</param>
						<param name="item">The obejct to add.</param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="list" dataTypeName="IList" dataTypeQualifier="System.Collections"/>
				<plx:param name="item" dataTypeName=".object"/>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="booleanAnd">
							<plx:left>
								<plx:binaryOperator type="identityInequality">
									<plx:left>
										<plx:nameRef name="list" type="parameter"/>
									</plx:left>
									<plx:right>
										<plx:nullKeyword/>
									</plx:right>
								</plx:binaryOperator>
							</plx:left>
							<plx:right>
								<plx:binaryOperator type="identityInequality">
									<plx:left>
										<plx:nameRef name="item" type="parameter"/>
									</plx:left>
									<plx:right>
										<plx:nullKeyword/>
									</plx:right>
								</plx:binaryOperator>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:callInstance name="Add">
						<plx:callObject>
							<plx:nameRef name="list" type="parameter"/>
						</plx:callObject>
						<plx:passParam>
							<plx:nameRef name="item" type="parameter"/>
						</plx:passParam>
					</plx:callInstance>
				</plx:branch>
			</plx:function>
			<plx:function name="Remove" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Removes the specified object from the collection of objects.
</summary>
						<param name="list">A collection of objects.</param>
						<param name="item">The object to remove.</param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="list" dataTypeName="IList" dataTypeQualifier="System.Collections"/>
				<plx:param name="item" dataTypeName=".object"/>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="booleanAnd">
							<plx:left>
								<plx:binaryOperator type="identityInequality">
									<plx:left>
										<plx:nameRef name="list" type="parameter"/>
									</plx:left>
									<plx:right>
										<plx:nullKeyword/>
									</plx:right>
								</plx:binaryOperator>
							</plx:left>
							<plx:right>
								<plx:binaryOperator type="identityInequality">
									<plx:left>
										<plx:nameRef name="item" type="parameter"/>
									</plx:left>
									<plx:right>
										<plx:nullKeyword/>
									</plx:right>
								</plx:binaryOperator>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="typeEquality">
								<plx:left>
									<plx:nameRef name="item" type="parameter"/>
								</plx:left>
								<plx:right>
									<plx:directTypeReference dataTypeName="IEntity"/>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:callInstance name="MarkToDelete">
							<plx:callObject>
								<plx:cast dataTypeName="IEntity">
									<plx:nameRef name="item" type="parameter"/>
								</plx:cast>
							</plx:callObject>
						</plx:callInstance>
					</plx:branch>
					<plx:callInstance name="Remove">
						<plx:callObject>
							<plx:nameRef name="list" type="parameter"/>
						</plx:callObject>
						<plx:passParam>
							<plx:nameRef name="item" type="parameter"/>
						</plx:passParam>
					</plx:callInstance>
				</plx:branch>
			</plx:function>
			<plx:function name="GuidTryParse" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Converts the string representation of a Guid to its Guid 
equivalent. A return value indicates whether the operation 
succeeded. 
</summary>
						<param name="s">A string containing a Guid to convert.</param>
						<param name="result">
When this method returns, contains the Guid value equivalent to 
the Guid contained in <paramref name="s" />, if the conversion 
succeeded, or <see cref="F:System.Guid.Empty" /> if the conversion failed. 
The conversion fails if the <paramref name="s" /> parameter is a 
<see langword="null" /> reference (<see langword="Nothing" /> in 
Visual Basic), or is not of the correct format. 
</param>
						<value>
&lt;see langword="true" /&gt; if <paramref name="s" /> was converted 
successfully; otherwise, <see langword="false" />.
</value>
						<exception cref="T:System.ArgumentNullException">
Thrown if <pararef name="s" /> is <see langword="null" />.
</exception>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="s" dataTypeName=".string"/>
				<plx:param name="result" type="out" dataTypeName="Guid" dataTypeQualifier="System"/>
				<plx:returns dataTypeName=".boolean"/>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="identityEquality">
							<plx:left>
								<plx:nameRef name="s" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:nullKeyword/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:throw>
						<plx:callNew dataTypeName="ArgumentNullException" dataTypeQualifier="System">
							<plx:passParam>
								<plx:string>s</plx:string>
							</plx:passParam>
						</plx:callNew>
					</plx:throw>
				</plx:branch>
				<plx:local name="format" dataTypeName="Regex" dataTypeQualifier="System.Text.RegularExpressions">
					<plx:initialize>
						<plx:callNew dataTypeName="Regex" dataTypeQualifier="System.Text.RegularExpressions">
							<plx:passParam>
								<plx:string>^[A-Fa-f0-9]{32}$|^({|\()?[A-Fa-f0-9]{8}-([A-Fa-f0-9]{4}-){3}[A-Fa-f0-9]{12}(}|\))?$|^({)?[0xA-Fa-f0-9]{3,10}(, {0,1}[0xA-Fa-f0-9]{3,6}){2}, {0,1}({)([0xA-Fa-f0-9]{3,4}, {0,1}){7}[0xA-Fa-f0-9]{3,4}(}})$</plx:string>
							</plx:passParam>
						</plx:callNew>
					</plx:initialize>
				</plx:local>
				<plx:branch>
					<plx:condition>
						<plx:callInstance name="Success" type="property">
							<plx:callObject>
								<plx:callInstance name="Match">
									<plx:callObject>
										<plx:nameRef name="format"/>
									</plx:callObject>
									<plx:passParam>
										<plx:nameRef name="s" type="parameter"/>
									</plx:passParam>
								</plx:callInstance>
							</plx:callObject>
						</plx:callInstance>
					</plx:condition>
					<plx:assign>
						<plx:left>
							<plx:nameRef name="result" type="parameter"/>
						</plx:left>
						<plx:right>
							<plx:callNew dataTypeName="Guid" dataTypeQualifier="System">
								<plx:passParam>
									<plx:nameRef name="s" type="parameter"/>
								</plx:passParam>
							</plx:callNew>
						</plx:right>
					</plx:assign>
					<plx:return>
						<plx:trueKeyword/>
					</plx:return>
				</plx:branch>
				<plx:assign>
					<plx:left>
						<plx:nameRef name="result" type="parameter"/>
					</plx:left>
					<plx:right>
						<plx:callStatic name="Empty" type="field" dataTypeName="Guid" dataTypeQualifier="System"/>
					</plx:right>
				</plx:assign>
				<plx:return>
					<plx:falseKeyword/>
				</plx:return>
			</plx:function>
			<plx:function name="GetTypeNames" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>Outputs a string containing the type names, delimited by ", "</summary>
						<param name="types" type="System.Type[]">
							<para>The types to show.</para>
						</param>
						<returns>A string value...</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="types" type="params" dataTypeIsSimpleArray="true" dataTypeName="Type" dataTypeQualifier="System"/>
				<plx:returns dataTypeName=".string"/>
				<plx:local name="builder" dataTypeName="StringBuilder" dataTypeQualifier="System.Text">
					<plx:initialize>
						<plx:callNew dataTypeName="StringBuilder" dataTypeQualifier="System.Text"/>
					</plx:initialize>
				</plx:local>
				<plx:iterator localName="type" dataTypeName="Type" dataTypeQualifier="System">
					<plx:initialize>
						<plx:nameRef name="types" type="parameter"/>
					</plx:initialize>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="greaterThan">
								<plx:left>
									<plx:callInstance name="Length" type="property">
										<plx:callObject>
											<plx:nameRef name="builder"/>
										</plx:callObject>
									</plx:callInstance>
								</plx:left>
								<plx:right>
									<plx:value data="0" type="i4"/>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:callInstance name="Append">
							<plx:callObject>
								<plx:nameRef name="builder"/>
							</plx:callObject>
							<plx:passParam>
								<plx:string>, </plx:string>
							</plx:passParam>
						</plx:callInstance>
					</plx:branch>
					<plx:callInstance name="Append">
						<plx:callObject>
							<plx:nameRef name="builder"/>
						</plx:callObject>
						<plx:passParam>
							<plx:callInstance name="Name" type="property">
								<plx:callObject>
									<plx:nameRef name="type"/>
								</plx:callObject>
							</plx:callInstance>
						</plx:passParam>
					</plx:callInstance>
				</plx:iterator>
				<plx:return>
					<plx:callInstance name="ToString">
						<plx:callObject>
							<plx:nameRef name="builder"/>
						</plx:callObject>
					</plx:callInstance>
				</plx:return>
			</plx:function>
		</plx:class>
	</xsl:template>
	<xsl:template name="EntityPropertyComparer">
		<plx:class name="EntityPropertyComparer" visibility="public">
			<plx:leadingInfo>
				<plx:docComment>
					<summary>
Provide a generic comparer for our entity objects.
</summary>
				</plx:docComment>
			</plx:leadingInfo>
			<plx:implementsInterface dataTypeName="IComparer" dataTypeQualifier="System.Collections"/>
			<plx:field name="PropertyName" visibility="private" dataTypeName=".string"/>
			<plx:function name=".construct" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Provides Comparison opreations.
</summary>
						<param name="propertyName">The property to compare</param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="propertyName" dataTypeName=".string"/>
				<plx:assign>
					<plx:left>
						<plx:callThis name="PropertyName" type="field"/>
					</plx:left>
					<plx:right>
						<plx:nameRef name="propertyName" type="parameter"/>
					</plx:right>
				</plx:assign>
			</plx:function>
			<plx:function name="Compare" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Compares 2 objects by their properties, given on the constructor
</summary>
						<param name="x">First value to compare</param>
						<param name="y">Second value to compare</param>
						<returns></returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:interfaceMember memberName="Compare" dataTypeName="IComparer" dataTypeQualifier="System.Collections"/>
				<plx:param name="x" dataTypeName=".object"/>
				<plx:param name="y" dataTypeName=".object"/>
				<plx:returns dataTypeName=".i4"/>
				<plx:local name="a" dataTypeName=".object">
					<plx:initialize>
						<plx:callInstance name="GetValue">
							<plx:callObject>
								<plx:callInstance name="GetProperty">
									<plx:callObject>
										<plx:callInstance name="GetType">
											<plx:callObject>
												<plx:nameRef name="x" type="parameter"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:callObject>
									<plx:passParam>
										<plx:callThis name="PropertyName" type="field"/>
									</plx:passParam>
								</plx:callInstance>
							</plx:callObject>
							<plx:passParam>
								<plx:nameRef name="x" type="parameter"/>
							</plx:passParam>
							<plx:passParam>
								<plx:nullKeyword/>
							</plx:passParam>
						</plx:callInstance>
					</plx:initialize>
				</plx:local>
				<plx:local name="b" dataTypeName=".object">
					<plx:initialize>
						<plx:callInstance name="GetValue">
							<plx:callObject>
								<plx:callInstance name="GetProperty">
									<plx:callObject>
										<plx:callInstance name="GetType">
											<plx:callObject>
												<plx:nameRef name="y" type="parameter"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:callObject>
									<plx:passParam>
										<plx:callThis name="PropertyName" type="field"/>
									</plx:passParam>
								</plx:callInstance>
							</plx:callObject>
							<plx:passParam>
								<plx:nameRef name="y" type="parameter"/>
							</plx:passParam>
							<plx:passParam>
								<plx:nullKeyword/>
							</plx:passParam>
						</plx:callInstance>
					</plx:initialize>
				</plx:local>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="booleanAnd">
							<plx:left>
								<plx:binaryOperator type="identityInequality">
									<plx:left>
										<plx:nameRef name="a"/>
									</plx:left>
									<plx:right>
										<plx:nullKeyword/>
									</plx:right>
								</plx:binaryOperator>
							</plx:left>
							<plx:right>
								<plx:binaryOperator type="identityEquality">
									<plx:left>
										<plx:nameRef name="b"/>
									</plx:left>
									<plx:right>
										<plx:nullKeyword/>
									</plx:right>
								</plx:binaryOperator>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:return>
						<plx:value data="1" type="i4"/>
					</plx:return>
				</plx:branch>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="booleanAnd">
							<plx:left>
								<plx:binaryOperator type="identityEquality">
									<plx:left>
										<plx:nameRef name="a"/>
									</plx:left>
									<plx:right>
										<plx:nullKeyword/>
									</plx:right>
								</plx:binaryOperator>
							</plx:left>
							<plx:right>
								<plx:binaryOperator type="identityInequality">
									<plx:left>
										<plx:nameRef name="b"/>
									</plx:left>
									<plx:right>
										<plx:nullKeyword/>
									</plx:right>
								</plx:binaryOperator>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:return>
						<plx:value data="-1" type="i4"/>
					</plx:return>
				</plx:branch>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="booleanAnd">
							<plx:left>
								<plx:binaryOperator type="identityEquality">
									<plx:left>
										<plx:nameRef name="a"/>
									</plx:left>
									<plx:right>
										<plx:nullKeyword/>
									</plx:right>
								</plx:binaryOperator>
							</plx:left>
							<plx:right>
								<plx:binaryOperator type="identityEquality">
									<plx:left>
										<plx:nameRef name="b"/>
									</plx:left>
									<plx:right>
										<plx:nullKeyword/>
									</plx:right>
								</plx:binaryOperator>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:return>
						<plx:value data="0" type="i4"/>
					</plx:return>
				</plx:branch>
				<plx:return>
					<plx:callInstance name="CompareTo">
						<plx:callObject>
							<plx:cast dataTypeName="IComparable" dataTypeQualifier="System">
								<plx:nameRef name="a"/>
							</plx:cast>
						</plx:callObject>
						<plx:passParam>
							<plx:nameRef name="b"/>
						</plx:passParam>
					</plx:callInstance>
				</plx:return>
			</plx:function>
		</plx:class>
	</xsl:template>
	<xsl:template name="EntityManager">
		<plx:class name="EntityManager" visibility="public" modifier="static" partial="true">
			<plx:leadingInfo>
				<plx:docComment>
					<summary>
Entity Manager provides the management of entity location and creation.
This is responsible for providing the health and validity of entities as a whole.
</summary>
				</plx:docComment>
			</plx:leadingInfo>
			<plx:field name="syncObject" visibility="private" static="true" dataTypeName=".object"/>
			<plx:field name="entityFactoryList" visibility="private" static="true" dataTypeName="Dictionary" dataTypeQualifier="System.Collections.Generic">
				<plx:passTypeParam dataTypeName=".string"/>
				<plx:passTypeParam dataTypeName="IEntityFactory"/>
			</plx:field>
			<plx:field name="entityLocator" visibility="private" static="true" dataTypeName="EntityLocator"/>
			<plx:field name="trackingPolicy" visibility="private" static="true" dataTypeName="TrackingPolicy"/>
			<plx:property name="TrackChangedEntities" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Get or set whether an entity should stop being tracked if it is modified or not.
If true entities are tracked until saved even if modified. If false entities are
stopped being tracked when they are modified.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:returns dataTypeName=".boolean"/>
				<plx:get>
					<plx:return>
						<plx:binaryOperator type="equality">
							<plx:left>
								<plx:binaryOperator type="bitwiseAnd">
									<plx:left>
										<plx:callStatic name="trackingPolicy" type="field" dataTypeName="EntityManager"/>
									</plx:left>
									<plx:right>
										<plx:callStatic name="TrackingChanged" type="field" dataTypeName="TrackingPolicy"/>
									</plx:right>
								</plx:binaryOperator>
							</plx:left>
							<plx:right>
								<plx:callStatic name="TrackingChanged" type="field" dataTypeName="TrackingPolicy"/>
							</plx:right>
						</plx:binaryOperator>
					</plx:return>
				</plx:get>
				<plx:set>
					<plx:branch>
						<plx:condition>
							<plx:nameRef name="value" type="parameter"/>
						</plx:condition>
						<plx:assign>
							<plx:left>
								<plx:callStatic name="trackingPolicy" type="field" dataTypeName="EntityManager"/>
							</plx:left>
							<plx:right>
								<plx:binaryOperator type="bitwiseOr">
									<plx:left>
										<plx:callStatic name="trackingPolicy" type="field" dataTypeName="EntityManager"/>
									</plx:left>
									<plx:right>
										<plx:callStatic name="TrackingChanged" type="field" dataTypeName="TrackingPolicy"/>
									</plx:right>
								</plx:binaryOperator>
							</plx:right>
						</plx:assign>
					</plx:branch>
					<plx:fallbackBranch>
						<plx:assign>
							<plx:left>
								<plx:callStatic name="trackingPolicy" type="field" dataTypeName="EntityManager"/>
							</plx:left>
							<plx:right>
								<plx:callStatic name="TrackingUnchanged" type="field" dataTypeName="TrackingPolicy"/>
							</plx:right>
						</plx:assign>
					</plx:fallbackBranch>
				</plx:set>
			</plx:property>
			<plx:property name="EntityFactories" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Exposes the current entity factory instance.
</summary>
						<value>The entity factories.</value>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:returns dataTypeName="Dictionary" dataTypeQualifier="System.Collections.Generic">
					<plx:passTypeParam dataTypeName=".string"/>
					<plx:passTypeParam dataTypeName="IEntityFactory"/>
				</plx:returns>
				<plx:get>
					<plx:return>
						<plx:callStatic name="entityFactoryList" type="field" dataTypeName="EntityManager"/>
					</plx:return>
				</plx:get>
				<plx:set>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="identityInequality">
								<plx:left>
									<plx:nameRef name="value" type="parameter"/>
								</plx:left>
								<plx:right>
									<plx:nullKeyword/>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:lock>
							<plx:initialize>
								<plx:callStatic name="syncObject" type="field" dataTypeName="EntityManager"/>
							</plx:initialize>
							<plx:assign>
								<plx:left>
									<plx:callStatic name="entityFactoryList" type="field" dataTypeName="EntityManager"/>
								</plx:left>
								<plx:right>
									<plx:nameRef name="value" type="parameter"/>
								</plx:right>
							</plx:assign>
						</plx:lock>
					</plx:branch>
				</plx:set>
			</plx:property>
			<plx:property name="EntityLocator" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Expose the current entity locator for consumption by the API.
</summary>
						<value>The entity locator.</value>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:returns dataTypeName="EntityLocator"/>
				<plx:get>
					<plx:return>
						<plx:callStatic name="entityLocator" type="field" dataTypeName="EntityManager"/>
					</plx:return>
				</plx:get>
			</plx:property>
			<plx:function name="LocateOrCreate" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Locates an entity for retrieval from the <see cref="T:Microsoft.Practices.ObjectBuilder.Locator" />, or instatiates a new instance 
of the entity if not currently being tracked.
</summary>
						<typeparam name="Entity">Must implement <see cref="T:Tiers.AdventureWorks.Entities.IEntity" /> and is the default type to create, and will be the return type.</typeparam>
						<param name="key">primary key representation</param>
						<param name="typeString">type string to create</param>
						<param name="entityFactoryType">factory used to try to create this entity.</param>
						<returns>Created entity of T</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:typeParam name="Entity" requireReferenceType="true" requireDefaultConstructor="true">
					<plx:typeConstraint dataTypeName="IEntity"/>
				</plx:typeParam>
				<plx:param name="key" dataTypeName=".string"/>
				<plx:param name="typeString" dataTypeName=".string"/>
				<plx:param name="entityFactoryType" dataTypeName="Type" dataTypeQualifier="System"/>
				<plx:returns dataTypeName="Entity"/>
				<plx:return>
					<plx:callStatic name="LocateOrCreate" dataTypeName="EntityManager">
						<plx:passMemberTypeParam dataTypeName="Entity"/>
						<plx:passParam>
							<plx:nameRef name="key" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:nameRef name="typeString" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:nameRef name="entityFactoryType" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:trueKeyword/>
						</plx:passParam>
					</plx:callStatic>
				</plx:return>
			</plx:function>
			<plx:function name="LocateOrCreate" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Locates an entity for retrieval from the <see cref="T:Microsoft.Practices.ObjectBuilder.Locator" />, or instatiates a new instance 
of the entity if not currently being tracked.
</summary>
						<typeparam name="Entity">Must implement <see cref="T:Tiers.AdventureWorks.Entities.IEntity" /> and is the default type to create, and will be the return type.</typeparam>
						<param name="key">primary key representation</param>
						<param name="typeString">type string to create</param>
						<param name="entityFactoryType">factory used to try to create this entity.</param>
						<param name="isLocatorEnabled">bool determining whether to use Entity Locating.</param>
						<returns>Created entity of T</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:typeParam name="Entity" requireReferenceType="true" requireDefaultConstructor="true">
					<plx:typeConstraint dataTypeName="IEntity"/>
				</plx:typeParam>
				<plx:param name="key" dataTypeName=".string"/>
				<plx:param name="typeString" dataTypeName=".string"/>
				<plx:param name="entityFactoryType" dataTypeName="Type" dataTypeQualifier="System"/>
				<plx:param name="isLocatorEnabled" dataTypeName=".boolean"/>
				<plx:returns dataTypeName="Entity"/>
				<plx:branch>
					<plx:condition>
						<plx:callStatic name="IsNullOrEmpty" dataTypeName=".string">
							<plx:passParam>
								<plx:nameRef name="typeString" type="parameter"/>
							</plx:passParam>
						</plx:callStatic>
					</plx:condition>
					<plx:throw>
						<plx:callNew dataTypeName="ArgumentException" dataTypeQualifier="System">
							<plx:passParam>
								<plx:string>typeString</plx:string>
							</plx:passParam>
						</plx:callNew>
					</plx:throw>
				</plx:branch>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="identityEquality">
							<plx:left>
								<plx:nameRef name="entityFactoryType" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:nullKeyword/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:throw>
						<plx:callNew dataTypeName="ArgumentException" dataTypeQualifier="System">
							<plx:passParam>
								<plx:string>entityFactoryType</plx:string>
							</plx:passParam>
						</plx:callNew>
					</plx:throw>
				</plx:branch>
				<plx:local name="entity" dataTypeName="Entity">
					<plx:initialize>
						<plx:defaultValueOf dataTypeName="Entity"/>
					</plx:initialize>
				</plx:local>
				<plx:lock>
					<plx:initialize>
						<plx:callStatic name="syncObject" type="field" dataTypeName="EntityManager"/>
					</plx:initialize>
					<plx:local name="defaultType" dataTypeName="Type" dataTypeQualifier="System">
						<plx:initialize>
							<plx:typeOf dataTypeName="Entity"/>
						</plx:initialize>
					</plx:local>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="identityInequality">
								<plx:left>
									<plx:callInstance name="GetInterface">
										<plx:callObject>
											<plx:nameRef name="defaultType"/>
										</plx:callObject>
										<plx:passParam>
											<plx:string>IEntityCacheItem</plx:string>
										</plx:passParam>
									</plx:callInstance>
								</plx:left>
								<plx:right>
									<plx:nullKeyword/>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:assign>
							<plx:left>
								<plx:nameRef name="entity"/>
							</plx:left>
							<plx:right>
								<plx:callStatic name="GetItem" dataTypeName="EntityCache">
									<plx:passMemberTypeParam dataTypeName="Entity"/>
									<plx:passParam>
										<plx:callInstance name="ToString">
											<plx:callObject>
												<plx:nameRef name="key" type="parameter"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:passParam>
								</plx:callStatic>
							</plx:right>
						</plx:assign>
					</plx:branch>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="identityInequality">
								<plx:left>
									<plx:nameRef name="entity"/>
								</plx:left>
								<plx:right>
									<plx:nullKeyword/>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:return>
							<plx:nameRef name="entity"/>
						</plx:return>
					</plx:branch>
					<plx:local name="factory" dataTypeName="IEntityFactory">
						<plx:initialize>
							<plx:nullKeyword/>
						</plx:initialize>
					</plx:local>
					<plx:lock>
						<plx:initialize>
							<plx:callStatic name="syncObject" type="field" dataTypeName="EntityManager"/>
						</plx:initialize>
						<plx:branch>
							<plx:condition>
								<plx:callInstance name="ContainsKey">
									<plx:callObject>
										<plx:callStatic name="EntityFactories" type="property" dataTypeName="EntityManager"/>
									</plx:callObject>
									<plx:passParam>
										<plx:callInstance name="FullName" type="property">
											<plx:callObject>
												<plx:nameRef name="entityFactoryType" type="parameter"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:passParam>
								</plx:callInstance>
							</plx:condition>
							<plx:assign>
								<plx:left>
									<plx:nameRef name="factory"/>
								</plx:left>
								<plx:right>
									<plx:callInstance name=".implied" type="indexerCall">
										<plx:callObject>
											<plx:callStatic name="EntityFactories" type="property" dataTypeName="EntityManager"/>
										</plx:callObject>
										<plx:passParam>
											<plx:callInstance name="FullName" type="property">
												<plx:callObject>
													<plx:nameRef name="entityFactoryType" type="parameter"/>
												</plx:callObject>
											</plx:callInstance>
										</plx:passParam>
									</plx:callInstance>
								</plx:right>
							</plx:assign>
						</plx:branch>
						<plx:fallbackBranch>
							<plx:assign>
								<plx:left>
									<plx:nameRef name="factory"/>
								</plx:left>
								<plx:right>
									<plx:callStatic name="TryAddEntityFactory" dataTypeName="EntityManager">
										<plx:passParam>
											<plx:nameRef name="entityFactoryType" type="parameter"/>
										</plx:passParam>
									</plx:callStatic>
								</plx:right>
							</plx:assign>
						</plx:fallbackBranch>
					</plx:lock>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="booleanAnd">
								<plx:left>
									<plx:binaryOperator type="identityInequality">
										<plx:left>
											<plx:nameRef name="key" type="parameter"/>
										</plx:left>
										<plx:right>
											<plx:nullKeyword/>
										</plx:right>
									</plx:binaryOperator>
								</plx:left>
								<plx:right>
									<plx:nameRef name="isLocatorEnabled" type="parameter"/>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:lock>
							<plx:initialize>
								<plx:callStatic name="syncObject" type="field" dataTypeName="EntityManager"/>
							</plx:initialize>
							<plx:branch>
								<plx:condition>
									<plx:callInstance name="Contains">
										<plx:callObject>
											<plx:callStatic name="EntityLocator" type="property" dataTypeName="EntityManager"/>
										</plx:callObject>
										<plx:passParam>
											<plx:nameRef name="key" type="parameter"/>
										</plx:passParam>
									</plx:callInstance>
								</plx:condition>
								<plx:assign>
									<plx:left>
										<plx:nameRef name="entity"/>
									</plx:left>
									<plx:right>
										<plx:cast type="testCast" dataTypeName="Entity">
											<plx:callInstance name="Get">
												<plx:callObject>
													<plx:callStatic name="EntityLocator" type="property" dataTypeName="EntityManager"/>
												</plx:callObject>
												<plx:passParam>
													<plx:nameRef name="key" type="parameter"/>
												</plx:passParam>
											</plx:callInstance>
										</plx:cast>
									</plx:right>
								</plx:assign>
							</plx:branch>
						</plx:lock>
					</plx:branch>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="identityEquality">
								<plx:left>
									<plx:nameRef name="entity"/>
								</plx:left>
								<plx:right>
									<plx:nullKeyword/>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:assign>
							<plx:left>
								<plx:nameRef name="entity"/>
							</plx:left>
							<plx:right>
								<plx:cast type="testCast" dataTypeName="Entity">
									<plx:callInstance name="CreateEntity">
										<plx:callObject>
											<plx:nameRef name="factory"/>
										</plx:callObject>
										<plx:passParam>
											<plx:nameRef name="typeString" type="parameter"/>
										</plx:passParam>
										<plx:passParam>
											<plx:nameRef name="defaultType"/>
										</plx:passParam>
									</plx:callInstance>
								</plx:cast>
							</plx:right>
						</plx:assign>
					</plx:branch>
					<plx:branch>
						<plx:condition>
							<plx:unaryOperator type="booleanNot">
								<plx:callInstance name="IsEntityTracked" type="property">
									<plx:callObject>
										<plx:nameRef name="entity"/>
									</plx:callObject>
								</plx:callInstance>
							</plx:unaryOperator>
						</plx:condition>
						<plx:callStatic name="StartTracking" dataTypeName="EntityManager">
							<plx:passParam>
								<plx:nameRef name="key" type="parameter"/>
							</plx:passParam>
							<plx:passParam>
								<plx:nameRef name="entity"/>
							</plx:passParam>
							<plx:passParam>
								<plx:nameRef name="isLocatorEnabled" type="parameter"/>
							</plx:passParam>
						</plx:callStatic>
					</plx:branch>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="identityInequality">
								<plx:left>
									<plx:callInstance name="GetInterface">
										<plx:callObject>
											<plx:callInstance name="GetType">
												<plx:callObject>
													<plx:nameRef name="entity"/>
												</plx:callObject>
											</plx:callInstance>
										</plx:callObject>
										<plx:passParam>
											<plx:string>IEntityCacheItem</plx:string>
										</plx:passParam>
									</plx:callInstance>
								</plx:left>
								<plx:right>
									<plx:nullKeyword/>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:callStatic name="AddCache" dataTypeName="EntityCache">
							<plx:passParam>
								<plx:nameRef name="key" type="parameter"/>
							</plx:passParam>
							<plx:passParam>
								<plx:nameRef name="entity"/>
							</plx:passParam>
						</plx:callStatic>
					</plx:branch>
				</plx:lock>
				<plx:return>
					<plx:nameRef name="entity"/>
				</plx:return>
			</plx:function>
			<plx:function name="CreateViewEntity" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
instatiates a new instance of the entity for view entities that don't implement IEntity and can't be tracked
</summary>
						<typeparam name="Entity">is the default type to create, and will be the return type.</typeparam>
						<param name="typeString">type string to create</param>
						<param name="entityFactoryType">factory used to try to create this entity.</param>
						<returns>Created entity of T</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:typeParam name="Entity" requireReferenceType="true" requireDefaultConstructor="true"/>
				<plx:param name="typeString" dataTypeName=".string"/>
				<plx:param name="entityFactoryType" dataTypeName="Type" dataTypeQualifier="System"/>
				<plx:returns dataTypeName="Entity"/>
				<plx:branch>
					<plx:condition>
						<plx:callStatic name="IsNullOrEmpty" dataTypeName=".string">
							<plx:passParam>
								<plx:nameRef name="typeString" type="parameter"/>
							</plx:passParam>
						</plx:callStatic>
					</plx:condition>
					<plx:throw>
						<plx:callNew dataTypeName="ArgumentException" dataTypeQualifier="System">
							<plx:passParam>
								<plx:string>typeString</plx:string>
							</plx:passParam>
						</plx:callNew>
					</plx:throw>
				</plx:branch>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="identityEquality">
							<plx:left>
								<plx:nameRef name="entityFactoryType" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:nullKeyword/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:throw>
						<plx:callNew dataTypeName="ArgumentException" dataTypeQualifier="System">
							<plx:passParam>
								<plx:string>entityFactoryType</plx:string>
							</plx:passParam>
						</plx:callNew>
					</plx:throw>
				</plx:branch>
				<plx:local name="entity" dataTypeName="Entity">
					<plx:initialize>
						<plx:defaultValueOf dataTypeName="Entity"/>
					</plx:initialize>
				</plx:local>
				<plx:local name="defaultType" dataTypeName="Type" dataTypeQualifier="System">
					<plx:initialize>
						<plx:typeOf dataTypeName="Entity"/>
					</plx:initialize>
				</plx:local>
				<plx:local name="factory" dataTypeName="IEntityFactory">
					<plx:initialize>
						<plx:nullKeyword/>
					</plx:initialize>
				</plx:local>
				<plx:lock>
					<plx:initialize>
						<plx:callStatic name="syncObject" type="field" dataTypeName="EntityManager"/>
					</plx:initialize>
					<plx:branch>
						<plx:condition>
							<plx:callInstance name="ContainsKey">
								<plx:callObject>
									<plx:callStatic name="EntityFactories" type="property" dataTypeName="EntityManager"/>
								</plx:callObject>
								<plx:passParam>
									<plx:callInstance name="FullName" type="property">
										<plx:callObject>
											<plx:nameRef name="entityFactoryType" type="parameter"/>
										</plx:callObject>
									</plx:callInstance>
								</plx:passParam>
							</plx:callInstance>
						</plx:condition>
						<plx:assign>
							<plx:left>
								<plx:nameRef name="factory"/>
							</plx:left>
							<plx:right>
								<plx:callInstance name=".implied" type="indexerCall">
									<plx:callObject>
										<plx:callStatic name="EntityFactories" type="property" dataTypeName="EntityManager"/>
									</plx:callObject>
									<plx:passParam>
										<plx:callInstance name="FullName" type="property">
											<plx:callObject>
												<plx:nameRef name="entityFactoryType" type="parameter"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:passParam>
								</plx:callInstance>
							</plx:right>
						</plx:assign>
					</plx:branch>
					<plx:fallbackBranch>
						<plx:assign>
							<plx:left>
								<plx:nameRef name="factory"/>
							</plx:left>
							<plx:right>
								<plx:callStatic name="TryAddEntityFactory" dataTypeName="EntityManager">
									<plx:passParam>
										<plx:nameRef name="entityFactoryType" type="parameter"/>
									</plx:passParam>
								</plx:callStatic>
							</plx:right>
						</plx:assign>
					</plx:fallbackBranch>
				</plx:lock>
				<plx:return>
					<plx:cast type="testCast" dataTypeName="Entity">
						<plx:callInstance name="CreateViewEntity">
							<plx:callObject>
								<plx:nameRef name="factory"/>
							</plx:callObject>
							<plx:passParam>
								<plx:nameRef name="typeString" type="parameter"/>
							</plx:passParam>
							<plx:passParam>
								<plx:nameRef name="defaultType"/>
							</plx:passParam>
						</plx:callInstance>
					</plx:cast>
				</plx:return>
			</plx:function>
			<plx:function name="LocateEntity" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Locates an entity for retrieval from the <see cref="T:Microsoft.Practices.ObjectBuilder.Locator" /> if tracking is enabled.
</summary>
						<typeparam name="Entity">Must implement <see cref="T:Tiers.AdventureWorks.Entities.IEntity" /> and is the default type to create, and will be the return type.</typeparam>
						<param name="key">primary key representation</param>
						<param name="isLocatorEnabled">bool determining whether to use Entity Locating.</param>
						<returns>found entity of T, or null</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:typeParam name="Entity" requireReferenceType="true" requireDefaultConstructor="true">
					<plx:typeConstraint dataTypeName="IEntity"/>
				</plx:typeParam>
				<plx:param name="key" dataTypeName=".string"/>
				<plx:param name="isLocatorEnabled" dataTypeName=".boolean"/>
				<plx:returns dataTypeName="Entity"/>
				<plx:local name="entity" dataTypeName="Entity">
					<plx:initialize>
						<plx:defaultValueOf dataTypeName="Entity"/>
					</plx:initialize>
				</plx:local>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="booleanAnd">
							<plx:left>
								<plx:binaryOperator type="identityInequality">
									<plx:left>
										<plx:nameRef name="key" type="parameter"/>
									</plx:left>
									<plx:right>
										<plx:nullKeyword/>
									</plx:right>
								</plx:binaryOperator>
							</plx:left>
							<plx:right>
								<plx:nameRef name="isLocatorEnabled" type="parameter"/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:lock>
						<plx:initialize>
							<plx:callStatic name="syncObject" type="field" dataTypeName="EntityManager"/>
						</plx:initialize>
						<plx:branch>
							<plx:condition>
								<plx:callInstance name="Contains">
									<plx:callObject>
										<plx:callStatic name="EntityLocator" type="property" dataTypeName="EntityManager"/>
									</plx:callObject>
									<plx:passParam>
										<plx:nameRef name="key" type="parameter"/>
									</plx:passParam>
								</plx:callInstance>
							</plx:condition>
							<plx:assign>
								<plx:left>
									<plx:nameRef name="entity"/>
								</plx:left>
								<plx:right>
									<plx:cast type="testCast" dataTypeName="Entity">
										<plx:callInstance name="Get">
											<plx:callObject>
												<plx:callStatic name="EntityLocator" type="property" dataTypeName="EntityManager"/>
											</plx:callObject>
											<plx:passParam>
												<plx:nameRef name="key" type="parameter"/>
											</plx:passParam>
										</plx:callInstance>
									</plx:cast>
								</plx:right>
							</plx:assign>
						</plx:branch>
					</plx:lock>
				</plx:branch>
				<plx:return>
					<plx:nameRef name="entity"/>
				</plx:return>
			</plx:function>
			<plx:function name="StopTracking" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Stops Tracking an Entity, it will be re-added in the next round.
</summary>
						<param name="key">Entity Key used in the Locator's Bucket</param>
						<returns>true if found, false if not found</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="key" dataTypeName=".string"/>
				<plx:returns dataTypeName=".boolean"/>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="identityEquality">
							<plx:left>
								<plx:nameRef name="key" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:nullKeyword/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:throw>
						<plx:callNew dataTypeName="ArgumentNullException" dataTypeQualifier="System">
							<plx:passParam>
								<plx:string>key</plx:string>
							</plx:passParam>
						</plx:callNew>
					</plx:throw>
				</plx:branch>
				<plx:return>
					<plx:callInstance name="Remove">
						<plx:callObject>
							<plx:callStatic name="EntityLocator" type="property" dataTypeName="EntityManager"/>
						</plx:callObject>
						<plx:passParam>
							<plx:nameRef name="key" type="parameter"/>
						</plx:passParam>
					</plx:callInstance>
				</plx:return>
			</plx:function>
			<plx:function name="StartTracking" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Starts Tracking an Entity, it will be tracked until modified or persisted.
</summary>
						<param name="key">Entity Key used in the Locator's Bucket</param>
						<param name="entity">entity to be tracked</param>
						<param name="isTrackingEnabled">Determines whether tracking is enabled</param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="key" dataTypeName=".string"/>
				<plx:param name="entity" dataTypeName="IEntity"/>
				<plx:param name="isTrackingEnabled" dataTypeName=".boolean"/>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="identityEquality">
							<plx:left>
								<plx:nameRef name="key" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:nullKeyword/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:throw>
						<plx:callNew dataTypeName="ArgumentNullException" dataTypeQualifier="System">
							<plx:passParam>
								<plx:string>key</plx:string>
							</plx:passParam>
						</plx:callNew>
					</plx:throw>
				</plx:branch>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="identityEquality">
							<plx:left>
								<plx:nameRef name="entity" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:nullKeyword/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:throw>
						<plx:callNew dataTypeName="ArgumentNullException" dataTypeQualifier="System">
							<plx:passParam>
								<plx:string>entity</plx:string>
							</plx:passParam>
						</plx:callNew>
					</plx:throw>
				</plx:branch>
				<plx:branch>
					<plx:condition>
						<plx:unaryOperator type="booleanNot">
							<plx:binaryOperator type="booleanOr">
								<plx:left>
									<plx:callInstance name="IsEntityTracked" type="property">
										<plx:callObject>
											<plx:nameRef name="entity" type="parameter"/>
										</plx:callObject>
									</plx:callInstance>
								</plx:left>
								<plx:right>
									<plx:unaryOperator type="booleanNot">
										<plx:nameRef name="isTrackingEnabled" type="parameter"/>
									</plx:unaryOperator>
								</plx:right>
							</plx:binaryOperator>
						</plx:unaryOperator>
					</plx:condition>
					<plx:callInstance name="Add">
						<plx:callObject>
							<plx:callStatic name="EntityLocator" type="property" dataTypeName="EntityManager"/>
						</plx:callObject>
						<plx:passParam>
							<plx:nameRef name="key" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:nameRef name="entity" type="parameter"/>
						</plx:passParam>
					</plx:callInstance>
					<plx:assign>
						<plx:left>
							<plx:callInstance name="IsEntityTracked" type="property">
								<plx:callObject>
									<plx:nameRef name="entity" type="parameter"/>
								</plx:callObject>
							</plx:callInstance>
						</plx:left>
						<plx:right>
							<plx:trueKeyword/>
						</plx:right>
					</plx:assign>
					<plx:assign>
						<plx:left>
							<plx:callInstance name="EntityTrackingKey" type="property">
								<plx:callObject>
									<plx:nameRef name="entity" type="parameter"/>
								</plx:callObject>
							</plx:callInstance>
						</plx:left>
						<plx:right>
							<plx:nameRef name="key" type="parameter"/>
						</plx:right>
					</plx:assign>
				</plx:branch>
			</plx:function>
			<plx:function name="TryAddEntityFactory" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Adds a factory to the EntityFactories property if the parameter type is valid.
</summary>
						<param name="entityFactoryTypeToCreate">The entity factory type to create.</param>
						<returns>true if successful.</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="entityFactoryTypeToCreate" dataTypeName="Type" dataTypeQualifier="System"/>
				<plx:returns dataTypeName="IEntityFactory"/>
				<plx:lock>
					<plx:initialize>
						<plx:callStatic name="syncObject" type="field" dataTypeName="EntityManager"/>
					</plx:initialize>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="identityEquality">
								<plx:left>
									<plx:nameRef name="entityFactoryTypeToCreate" type="parameter"/>
								</plx:left>
								<plx:right>
									<plx:nullKeyword/>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:throw>
							<plx:callNew dataTypeName="ArgumentException" dataTypeQualifier="System">
								<plx:passParam>
									<plx:string>entityFactoryTypeToCreate</plx:string>
								</plx:passParam>
							</plx:callNew>
						</plx:throw>
					</plx:branch>
					<plx:branch>
						<plx:condition>
							<plx:unaryOperator type="booleanNot">
								<plx:callInstance name="ContainsKey">
									<plx:callObject>
										<plx:callStatic name="EntityFactories" type="property" dataTypeName="EntityManager"/>
									</plx:callObject>
									<plx:passParam>
										<plx:callInstance name="FullName" type="property">
											<plx:callObject>
												<plx:nameRef name="entityFactoryTypeToCreate" type="parameter"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:passParam>
								</plx:callInstance>
							</plx:unaryOperator>
						</plx:condition>
						<plx:local name="createdFactory" dataTypeName="IEntityFactory">
							<plx:initialize>
								<plx:cast type="testCast" dataTypeName="IEntityFactory">
									<plx:callStatic name="CreateInstance" dataTypeName="Activator" dataTypeQualifier="System">
										<plx:passParam>
											<plx:nameRef name="entityFactoryTypeToCreate" type="parameter"/>
										</plx:passParam>
									</plx:callStatic>
								</plx:cast>
							</plx:initialize>
						</plx:local>
						<plx:branch>
							<plx:condition>
								<plx:binaryOperator type="identityEquality">
									<plx:left>
										<plx:nameRef name="createdFactory"/>
									</plx:left>
									<plx:right>
										<plx:nullKeyword/>
									</plx:right>
								</plx:binaryOperator>
							</plx:condition>
							<plx:throw>
								<plx:callNew dataTypeName="ArgumentException" dataTypeQualifier="System">
									<plx:passParam>
										<plx:string>This factory can not be found.  Please ensure that you are using a valid Entity Factory.</plx:string>
									</plx:passParam>
									<plx:passParam>
										<plx:string>entityFactoryType</plx:string>
									</plx:passParam>
								</plx:callNew>
							</plx:throw>
						</plx:branch>
						<plx:callInstance name="Add">
							<plx:callObject>
								<plx:callStatic name="EntityFactories" type="property" dataTypeName="EntityManager"/>
							</plx:callObject>
							<plx:passParam>
								<plx:callInstance name="FullName" type="property">
									<plx:callObject>
										<plx:nameRef name="entityFactoryTypeToCreate" type="parameter"/>
									</plx:callObject>
								</plx:callInstance>
							</plx:passParam>
							<plx:passParam>
								<plx:nameRef name="createdFactory"/>
							</plx:passParam>
						</plx:callInstance>
					</plx:branch>
				</plx:lock>
				<plx:return>
					<plx:callInstance name=".implied" type="indexerCall">
						<plx:callObject>
							<plx:callStatic name="EntityFactories" type="property" dataTypeName="EntityManager"/>
						</plx:callObject>
						<plx:passParam>
							<plx:callInstance name="FullName" type="property">
								<plx:callObject>
									<plx:nameRef name="entityFactoryTypeToCreate" type="parameter"/>
								</plx:callObject>
							</plx:callInstance>
						</plx:passParam>
					</plx:callInstance>
				</plx:return>
			</plx:function>
			<plx:function name=".construct" visibility="private" modifier="static">
				<plx:assign>
					<plx:left>
						<plx:callStatic name="syncObject" type="field" dataTypeName="EntityManager"/>
					</plx:left>
					<plx:right>
						<plx:callNew dataTypeName=".object"/>
					</plx:right>
				</plx:assign>
				<plx:assign>
					<plx:left>
						<plx:callStatic name="entityFactoryList" type="field" dataTypeName="EntityManager"/>
					</plx:left>
					<plx:right>
						<plx:callNew dataTypeName="Dictionary" dataTypeQualifier="System.Collections.Generic">
							<plx:passTypeParam dataTypeName=".string"/>
							<plx:passTypeParam dataTypeName="IEntityFactory"/>
						</plx:callNew>
					</plx:right>
				</plx:assign>
				<plx:assign>
					<plx:left>
						<plx:callStatic name="entityLocator" type="field" dataTypeName="EntityManager"/>
					</plx:left>
					<plx:right>
						<plx:callNew dataTypeName="EntityLocator"/>
					</plx:right>
				</plx:assign>
				<plx:assign>
					<plx:left>
						<plx:callStatic name="trackingPolicy" type="field" dataTypeName="EntityManager"/>
					</plx:left>
					<plx:right>
						<plx:binaryOperator type="bitwiseOr">
							<plx:left>
								<plx:callStatic name="TrackingChanged" type="field" dataTypeName="TrackingPolicy"/>
							</plx:left>
							<plx:right>
								<plx:callStatic name="TrackingUnchanged" type="field" dataTypeName="TrackingPolicy"/>
							</plx:right>
						</plx:binaryOperator>
					</plx:right>
				</plx:assign>
			</plx:function>
		</plx:class>
		<plx:class name="EntityNotValidException" visibility="public">
			<plx:leadingInfo>
				<plx:docComment>
					<summary>
Exception used to pass information along to the UI when an entity is not valid. <see cref="Entities.EntityBase" />.IsValid.
</summary>
				</plx:docComment>
			</plx:leadingInfo>
			<plx:derivesFromClass dataTypeName="Exception" dataTypeQualifier="System"/>
			<plx:field name="entity" visibility="private" dataTypeName="EntityBase"/>
			<plx:field name="entityList" visibility="private" dataTypeName="IList" dataTypeQualifier="System.Collections"/>
			<plx:field name="executingMethod" visibility="private" dataTypeName=".string"/>
			<plx:field name="defaultMessage" visibility="private" static="true" readOnly="true" dataTypeName=".string"/>
			<plx:property name="Entity" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Gets or sets the entity.
</summary>
						<value>The entity.</value>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:returns dataTypeName="EntityBase"/>
				<plx:get>
					<plx:return>
						<plx:callThis name="entity" type="field"/>
					</plx:return>
				</plx:get>
				<plx:set>
					<plx:assign>
						<plx:left>
							<plx:callThis name="entity" type="field"/>
						</plx:left>
						<plx:right>
							<plx:nameRef name="value" type="parameter"/>
						</plx:right>
					</plx:assign>
				</plx:set>
			</plx:property>
			<plx:property name="EntityList" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Gets or sets the entity list.
</summary>
						<value>The entity list.</value>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:returns dataTypeName="IList" dataTypeQualifier="System.Collections"/>
				<plx:get>
					<plx:return>
						<plx:callThis name="entityList" type="field"/>
					</plx:return>
				</plx:get>
				<plx:set>
					<plx:assign>
						<plx:left>
							<plx:callThis name="entityList" type="field"/>
						</plx:left>
						<plx:right>
							<plx:nameRef name="value" type="parameter"/>
						</plx:right>
					</plx:assign>
				</plx:set>
			</plx:property>
			<plx:property name="ExecutingMethod" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Gets or sets the executing method.
</summary>
						<value>The executing method.</value>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:returns dataTypeName=".string"/>
				<plx:get>
					<plx:return>
						<plx:callThis name="executingMethod" type="field"/>
					</plx:return>
				</plx:get>
				<plx:set>
					<plx:assign>
						<plx:left>
							<plx:callThis name="executingMethod" type="field"/>
						</plx:left>
						<plx:right>
							<plx:nameRef name="value" type="parameter"/>
						</plx:right>
					</plx:assign>
				</plx:set>
			</plx:property>
			<plx:function name=".construct" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Initializes a new instance of the <see cref="Entities.EntityNotValidException" /> class.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:initialize>
					<plx:callThis name=".implied" accessor="base">
						<plx:passParam>
							<plx:callStatic name="defaultMessage" type="field" dataTypeName="EntityNotValidException"/>
						</plx:passParam>
					</plx:callThis>
				</plx:initialize>
			</plx:function>
			<plx:function name=".construct" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Initializes a new instance of the <see cref="Entities.EntityNotValidException" /> class.
</summary>
						<param name="message">The message.</param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="message" dataTypeName=".string"/>
				<plx:initialize>
					<plx:callThis name=".implied" accessor="base">
						<plx:passParam>
							<plx:nameRef name="message" type="parameter"/>
						</plx:passParam>
					</plx:callThis>
				</plx:initialize>
			</plx:function>
			<plx:function name=".construct" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Initializes a new instance of the <see cref="Entities.EntityNotValidException" /> class.
</summary>
						<param name="message">The message.</param>
						<param name="exception">The exception.</param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="message" dataTypeName=".string"/>
				<plx:param name="exception" dataTypeName="Exception" dataTypeQualifier="System"/>
				<plx:initialize>
					<plx:callThis name=".implied" accessor="base">
						<plx:passParam>
							<plx:nameRef name="message" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:nameRef name="exception" type="parameter"/>
						</plx:passParam>
					</plx:callThis>
				</plx:initialize>
			</plx:function>
			<plx:function name=".construct" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Initializes a new instance of the <see cref="Entities.EntityNotValidException" /> class.
</summary>
						<param name="entity">The entity.</param>
						<param name="method">The method.</param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="entity" dataTypeName="EntityBase"/>
				<plx:param name="method" dataTypeName=".string"/>
				<plx:initialize>
					<plx:callThis name=".implied">
						<plx:passParam>
							<plx:nameRef name="entity" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:nameRef name="method" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:callStatic name="Format" dataTypeName=".string">
								<plx:passParam>
									<plx:callStatic name="Concat" dataTypeName=".string">
										<plx:passParam>
											<plx:callStatic name="defaultMessage" type="field" dataTypeName="EntityNotValidException"/>
										</plx:passParam>
										<plx:passParam>
											<plx:string> for {0} during {1}.</plx:string>
										</plx:passParam>
									</plx:callStatic>
								</plx:passParam>
								<plx:passParam>
									<plx:inlineStatement dataTypeName=".string">
										<plx:conditionalOperator>
											<plx:condition>
												<plx:binaryOperator type="identityInequality">
													<plx:left>
														<plx:nameRef name="entity" type="parameter"/>
													</plx:left>
													<plx:right>
														<plx:nullKeyword/>
													</plx:right>
												</plx:binaryOperator>
											</plx:condition>
											<plx:left>
												<plx:callInstance name="Name" type="property">
													<plx:callObject>
														<plx:callInstance name="GetType">
															<plx:callObject>
																<plx:nameRef name="entity" type="parameter"/>
															</plx:callObject>
														</plx:callInstance>
													</plx:callObject>
												</plx:callInstance>
											</plx:left>
											<plx:right>
												<plx:string/>
											</plx:right>
										</plx:conditionalOperator>
									</plx:inlineStatement>
								</plx:passParam>
								<plx:passParam>
									<plx:nameRef name="method" type="parameter"/>
								</plx:passParam>
							</plx:callStatic>
						</plx:passParam>
					</plx:callThis>
				</plx:initialize>
			</plx:function>
			<plx:function name=".construct" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Initializes a new instance of the <see cref="Entities.EntityNotValidException" /> class.
</summary>
						<param name="entity">The entity.</param>
						<param name="method">The method.</param>
						<param name="message">The message.</param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="entity" dataTypeName="EntityBase"/>
				<plx:param name="method" dataTypeName=".string"/>
				<plx:param name="message" dataTypeName=".string"/>
				<plx:initialize>
					<plx:callThis name=".implied" accessor="base">
						<plx:passParam>
							<plx:nameRef name="message" type="parameter"/>
						</plx:passParam>
					</plx:callThis>
				</plx:initialize>
				<plx:assign>
					<plx:left>
						<plx:callThis name="entity" type="field"/>
					</plx:left>
					<plx:right>
						<plx:nameRef name="entity" type="parameter"/>
					</plx:right>
				</plx:assign>
				<plx:assign>
					<plx:left>
						<plx:callThis name="executingMethod" type="field"/>
					</plx:left>
					<plx:right>
						<plx:nameRef name="method" type="parameter"/>
					</plx:right>
				</plx:assign>
			</plx:function>
			<plx:function name=".construct" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Initializes a new instance of the <see cref="Entities.EntityNotValidException" /> class.
</summary>
						<param name="entityList">The entity list.</param>
						<param name="method">The method.</param>
						<param name="message">The message.</param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="entityList" dataTypeName="IList" dataTypeQualifier="System.Collections"/>
				<plx:param name="method" dataTypeName=".string"/>
				<plx:param name="message" dataTypeName=".string"/>
				<plx:initialize>
					<plx:callThis name=".implied" accessor="base">
						<plx:passParam>
							<plx:nameRef name="message" type="parameter"/>
						</plx:passParam>
					</plx:callThis>
				</plx:initialize>
				<plx:assign>
					<plx:left>
						<plx:callThis name="entityList" type="field"/>
					</plx:left>
					<plx:right>
						<plx:nameRef name="entityList" type="parameter"/>
					</plx:right>
				</plx:assign>
				<plx:assign>
					<plx:left>
						<plx:callThis name="executingMethod" type="field"/>
					</plx:left>
					<plx:right>
						<plx:nameRef name="method" type="parameter"/>
					</plx:right>
				</plx:assign>
			</plx:function>
			<plx:function name=".construct" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Initializes a new instance of the <see cref="Entities.EntityNotValidException" /> class.
</summary>
						<param name="entityList">The entity list.</param>
						<param name="method">The method.</param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="entityList" dataTypeName="IList" dataTypeQualifier="System.Collections"/>
				<plx:param name="method" dataTypeName=".string"/>
				<plx:initialize>
					<plx:callThis name=".implied">
						<plx:passParam>
							<plx:nameRef name="entityList" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:nameRef name="method" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:callStatic name="Format" dataTypeName=".string">
								<plx:passParam>
									<plx:callStatic name="Concat" dataTypeName=".string">
										<plx:passParam>
											<plx:callStatic name="defaultMessage" type="field" dataTypeName="EntityNotValidException"/>
										</plx:passParam>
										<plx:passParam>
											<plx:string> for {0} during {1}.</plx:string>
										</plx:passParam>
									</plx:callStatic>
								</plx:passParam>
								<plx:passParam>
									<plx:inlineStatement dataTypeName=".string">
										<plx:conditionalOperator>
											<plx:condition>
												<plx:binaryOperator type="identityInequality">
													<plx:left>
														<plx:nameRef name="entityList" type="parameter"/>
													</plx:left>
													<plx:right>
														<plx:nullKeyword/>
													</plx:right>
												</plx:binaryOperator>
											</plx:condition>
											<plx:left>
												<plx:callInstance name="Name" type="property">
													<plx:callObject>
														<plx:callInstance name="GetType">
															<plx:callObject>
																<plx:nameRef name="entityList" type="parameter"/>
															</plx:callObject>
														</plx:callInstance>
													</plx:callObject>
												</plx:callInstance>
											</plx:left>
											<plx:right>
												<plx:string/>
											</plx:right>
										</plx:conditionalOperator>
									</plx:inlineStatement>
								</plx:passParam>
								<plx:passParam>
									<plx:nameRef name="method" type="parameter"/>
								</plx:passParam>
							</plx:callStatic>
						</plx:passParam>
					</plx:callThis>
				</plx:initialize>
			</plx:function>
			<plx:function name=".construct" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Initializes a new instance of the <see cref="Entities.EntityNotValidException" /> class.
</summary>
						<param name="info">The <see cref="T:System.Runtime.Serialization.SerializationInfo"></see> that holds the serialized object data about the exception being thrown.</param>
						<param name="context">The <see cref="T:System.Runtime.Serialization.StreamingContext"></see> that contains contextual information about the source or destination.</param>
						<exception cref="T:System.Runtime.Serialization.SerializationException">The class name is null or <see cref="P:System.Exception.HResult"></see> is zero (0). </exception>
						<exception cref="T:System.ArgumentNullException">The info parameter is null. </exception>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="info" dataTypeName="SerializationInfo" dataTypeQualifier="System.Runtime.Serialization"/>
				<plx:param name="context" dataTypeName="StreamingContext" dataTypeQualifier="System.Runtime.Serialization"/>
				<plx:initialize>
					<plx:callThis name=".implied" accessor="base">
						<plx:passParam>
							<plx:nameRef name="info" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:nameRef name="context" type="parameter"/>
						</plx:passParam>
					</plx:callThis>
				</plx:initialize>
				<plx:assign>
					<plx:left>
						<plx:callThis name="Entity" type="property"/>
					</plx:left>
					<plx:right>
						<plx:cast dataTypeName="EntityBase">
							<plx:callInstance name="GetValue">
								<plx:callObject>
									<plx:nameRef name="info" type="parameter"/>
								</plx:callObject>
								<plx:passParam>
									<plx:string>Entity</plx:string>
								</plx:passParam>
								<plx:passParam>
									<plx:typeOf dataTypeName="EntityBase"/>
								</plx:passParam>
							</plx:callInstance>
						</plx:cast>
					</plx:right>
				</plx:assign>
				<plx:assign>
					<plx:left>
						<plx:callThis name="EntityList" type="property"/>
					</plx:left>
					<plx:right>
						<plx:cast dataTypeName="IList" dataTypeQualifier="System.Collections">
							<plx:callInstance name="GetValue">
								<plx:callObject>
									<plx:nameRef name="info" type="parameter"/>
								</plx:callObject>
								<plx:passParam>
									<plx:string>EntityList</plx:string>
								</plx:passParam>
								<plx:passParam>
									<plx:typeOf dataTypeName="IList" dataTypeQualifier="System.Collections"/>
								</plx:passParam>
							</plx:callInstance>
						</plx:cast>
					</plx:right>
				</plx:assign>
				<plx:assign>
					<plx:left>
						<plx:callThis name="ExecutingMethod" type="property"/>
					</plx:left>
					<plx:right>
						<plx:callInstance name="GetString">
							<plx:callObject>
								<plx:nameRef name="info" type="parameter"/>
							</plx:callObject>
							<plx:passParam>
								<plx:string>ExecutingMethod</plx:string>
							</plx:passParam>
						</plx:callInstance>
					</plx:right>
				</plx:assign>
			</plx:function>
			<plx:function name=".construct" visibility="private" modifier="static">
				<plx:assign>
					<plx:left>
						<plx:callStatic name="defaultMessage" type="field" dataTypeName="EntityNotValidException"/>
					</plx:left>
					<plx:right>
						<plx:string>One or more entities is in an invalid state while trying to persist the entity</plx:string>
					</plx:right>
				</plx:assign>
			</plx:function>
		</plx:class>
		<plx:enum name="TrackingPolicy" visibility="public">
			<plx:leadingInfo>
				<plx:docComment>
					<summary>
Determines what entities are tracked with respect to Entity.EntityState.
</summary>
					<remarks>TrackingPolicy is marked with Flags to allow future extensions, for example tracking of inserted items.</remarks>
				</plx:docComment>
			</plx:leadingInfo>
			<plx:attribute dataTypeName="FlagsAttribute" dataTypeQualifier="System"/>
			<plx:enumItem name="TrackingUnchanged">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Track unchanged entities (default). 
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:initialize>
					<plx:value data="1" type="i4"/>
				</plx:initialize>
			</plx:enumItem>
			<plx:enumItem name="TrackingChanged">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Track changed entities. 
</summary>
						<remarks>Normally an entity stops being tracked when it is modified unless TrackingChanged is specified.</remarks>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:initialize>
					<plx:value data="2" type="i4"/>
				</plx:initialize>
			</plx:enumItem>
		</plx:enum>
	</xsl:template>
	<xsl:template name="EntityLocator">
		<plx:class name="EntityLocator" visibility="public" partial="true">
			<plx:leadingInfo>
				<plx:docComment>
					<summary>
Provides a means to weak reference and already created and untouched locate entities.
</summary>
				</plx:docComment>
			</plx:leadingInfo>
			<plx:derivesFromClass dataTypeName="Locator" dataTypeQualifier="Microsoft.Practices.ObjectBuilder"/>
			<plx:function name=".construct" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Initializes a new instance of the <see cref="Entities.EntityLocator" /> class.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:initialize>
					<plx:callThis name=".implied" accessor="base">
						<plx:passParam>
							<plx:nullKeyword/>
						</plx:passParam>
					</plx:callThis>
				</plx:initialize>
			</plx:function>
			<plx:function name="Add" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Adds the specified key.
</summary>
						<param name="key">The key.</param>
						<param name="value">The value.</param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="key" dataTypeName=".string"/>
				<plx:param name="value" dataTypeName=".object"/>
				<plx:callThis name="Add" accessor="base">
					<plx:passParam>
						<plx:nameRef name="key" type="parameter"/>
					</plx:passParam>
					<plx:passParam>
						<plx:nameRef name="value" type="parameter"/>
					</plx:passParam>
				</plx:callThis>
			</plx:function>
			<plx:function name="Contains" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Determines whether [contains] [the specified key].
</summary>
						<param name="key">The key.</param>
						<param name="options">The options.</param>
						<returns>
<c>true</c> if [contains] [the specified key]; otherwise, <c>false</c>.
</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="key" dataTypeName=".string"/>
				<plx:param name="options" dataTypeName="SearchMode" dataTypeQualifier="Microsoft.Practices.ObjectBuilder"/>
				<plx:returns dataTypeName=".boolean"/>
				<plx:return>
					<plx:callThis name="Contains" accessor="base">
						<plx:passParam>
							<plx:nameRef name="key" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:nameRef name="options" type="parameter"/>
						</plx:passParam>
					</plx:callThis>
				</plx:return>
			</plx:function>
			<plx:function name="Get" visibility="public" modifier="override">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Gets the specified key of any object.
</summary>
						<param name="key">The key.</param>
						<param name="options">The options.</param>
						<returns>object if available, else null </returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="key" dataTypeName=".object"/>
				<plx:param name="options" dataTypeName="SearchMode" dataTypeQualifier="Microsoft.Practices.ObjectBuilder"/>
				<plx:returns dataTypeName=".object"/>
				<plx:return>
					<plx:callThis name="Get" accessor="base">
						<plx:passParam>
							<plx:nameRef name="key" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:nameRef name="options" type="parameter"/>
						</plx:passParam>
					</plx:callThis>
				</plx:return>
			</plx:function>
			<plx:function name="GetEntity" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Get's an Entity from the Tracking Locator
</summary>
						<typeparam name="Entity">A type that implements IEntity</typeparam>
						<param name="key">locator list key to fetch, best used 
if it's the (TypeName or TableName) + EntityKey of the this entity</param>
						<returns>Entity from Locator if available.</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:typeParam name="Entity" requireDefaultConstructor="true">
					<plx:typeConstraint dataTypeName="EntityBase"/>
				</plx:typeParam>
				<plx:param name="key" dataTypeName=".string"/>
				<plx:returns dataTypeName="Entity"/>
				<plx:return>
					<plx:cast type="testCast" dataTypeName="Entity">
						<plx:callThis name="Get">
							<plx:passParam>
								<plx:nameRef name="key" type="parameter"/>
							</plx:passParam>
							<plx:passParam>
								<plx:callStatic name="Local" type="field" dataTypeName="SearchMode" dataTypeQualifier="Microsoft.Practices.ObjectBuilder"/>
							</plx:passParam>
						</plx:callThis>
					</plx:cast>
				</plx:return>
			</plx:function>
			<plx:function name="GetList" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Get's a List of Entities from the Tracking Locator
</summary>
						<typeparam name="EntityList"> a type that implements ListBase&lt;IEntity&gt;</typeparam>
						<param name="key">locator list key to fetch, best used 
if it's like the criteria of the method used to populate this list
</param>
						<returns>ListBase&lt;IEntity&gt; if available</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:typeParam name="EntityList" requireDefaultConstructor="true">
					<plx:typeConstraint dataTypeName="ListBase">
						<plx:passTypeParam dataTypeName="IEntity"/>
					</plx:typeConstraint>
				</plx:typeParam>
				<plx:param name="key" dataTypeName=".string"/>
				<plx:returns dataTypeName="EntityList"/>
				<plx:return>
					<plx:cast type="testCast" dataTypeName="EntityList">
						<plx:callThis name="Get">
							<plx:passParam>
								<plx:nameRef name="key" type="parameter"/>
							</plx:passParam>
							<plx:passParam>
								<plx:callStatic name="Local" type="field" dataTypeName="SearchMode" dataTypeQualifier="Microsoft.Practices.ObjectBuilder"/>
							</plx:passParam>
						</plx:callThis>
					</plx:cast>
				</plx:return>
			</plx:function>
			<plx:function name="ConstructKeyFromPkItems" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Re-Creates the key based on primary key values.
</summary>
						<param name="type">The type.</param>
						<param name="pkItems">The pk items.</param>
						<returns></returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="type" dataTypeName="Type" dataTypeQualifier="System"/>
				<plx:param name="pkItems" type="params" dataTypeIsSimpleArray="true" dataTypeName=".object"/>
				<plx:returns dataTypeName=".string"/>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="identityEquality">
							<plx:left>
								<plx:nameRef name="type" type="parameter"/>
							</plx:left>
							<plx:right>
								<plx:nullKeyword/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:throw>
						<plx:callNew dataTypeName="ArgumentNullException" dataTypeQualifier="System">
							<plx:passParam>
								<plx:string>type</plx:string>
							</plx:passParam>
						</plx:callNew>
					</plx:throw>
				</plx:branch>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="equality">
							<plx:left>
								<plx:callInstance name="Length" type="property">
									<plx:callObject>
										<plx:nameRef name="pkItems" type="parameter"/>
									</plx:callObject>
								</plx:callInstance>
							</plx:left>
							<plx:right>
								<plx:value data="0" type="i4"/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:throw>
						<plx:callNew dataTypeName="ArgumentNullException" dataTypeQualifier="System">
							<plx:passParam>
								<plx:string>pkItems</plx:string>
							</plx:passParam>
						</plx:callNew>
					</plx:throw>
				</plx:branch>
				<plx:local name="sb" dataTypeName="StringBuilder" dataTypeQualifier="System.Text">
					<plx:initialize>
						<plx:callNew dataTypeName="StringBuilder" dataTypeQualifier="System.Text"/>
					</plx:initialize>
				</plx:local>
				<plx:callInstance name="Append">
					<plx:callObject>
						<plx:nameRef name="sb"/>
					</plx:callObject>
					<plx:passParam>
						<plx:callInstance name="Name" type="property">
							<plx:callObject>
								<plx:nameRef name="type" type="parameter"/>
							</plx:callObject>
						</plx:callInstance>
					</plx:passParam>
				</plx:callInstance>
				<plx:loop>
					<plx:initializeLoop>
						<plx:local name="i" dataTypeName=".i4">
							<plx:initialize>
								<plx:value data="0" type="i4"/>
							</plx:initialize>
						</plx:local>
					</plx:initializeLoop>
					<plx:condition>
						<plx:binaryOperator type="lessThan">
							<plx:left>
								<plx:nameRef name="i"/>
							</plx:left>
							<plx:right>
								<plx:callInstance name="Length" type="property">
									<plx:callObject>
										<plx:nameRef name="pkItems" type="parameter"/>
									</plx:callObject>
								</plx:callInstance>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:beforeLoop>
						<plx:increment>
							<plx:nameRef name="i"/>
						</plx:increment>
					</plx:beforeLoop>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="identityInequality">
								<plx:left>
									<plx:callInstance name=".implied" type="arrayIndexer">
										<plx:callObject>
											<plx:nameRef name="pkItems" type="parameter"/>
										</plx:callObject>
										<plx:passParam>
											<plx:nameRef name="i"/>
										</plx:passParam>
									</plx:callInstance>
								</plx:left>
								<plx:right>
									<plx:nullKeyword/>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:callInstance name="Append">
							<plx:callObject>
								<plx:callInstance name="Append">
									<plx:callObject>
										<plx:nameRef name="sb"/>
									</plx:callObject>
									<plx:passParam>
										<plx:string>|</plx:string>
									</plx:passParam>
								</plx:callInstance>
							</plx:callObject>
							<plx:passParam>
								<plx:callInstance name="ToString">
									<plx:callObject>
										<plx:callInstance name=".implied" type="arrayIndexer">
											<plx:callObject>
												<plx:nameRef name="pkItems" type="parameter"/>
											</plx:callObject>
											<plx:passParam>
												<plx:nameRef name="i"/>
											</plx:passParam>
										</plx:callInstance>
									</plx:callObject>
								</plx:callInstance>
							</plx:passParam>
						</plx:callInstance>
					</plx:branch>
				</plx:loop>
				<plx:return>
					<plx:callInstance name="ToString">
						<plx:callObject>
							<plx:nameRef name="sb"/>
						</plx:callObject>
					</plx:callInstance>
				</plx:return>
			</plx:function>
		</plx:class>
	</xsl:template>
	<xsl:template name="EntityKeyBaseCore.generated">
		<plx:class name="EntityKeyBaseCore" visibility="public" modifier="abstract" partial="true">
			<plx:leadingInfo>
				<plx:docComment>
					<summary>
The base object for each database table's unique identifier.
</summary>
				</plx:docComment>
			</plx:leadingInfo>
			<plx:attribute dataTypeName="SerializableAttribute" dataTypeQualifier="System"/>
			<plx:attribute dataTypeName="CLSCompliantAttribute" dataTypeQualifier="System">
				<plx:passParam>
					<plx:trueKeyword/>
				</plx:passParam>
			</plx:attribute>
			<plx:implementsInterface dataTypeName="IEntityKey"/>
			<plx:function name="Load" visibility="public" modifier="abstract">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Reads values from the supplied IDictionary object into
properties of the current object.
</summary>
						<param name="values">An IDictionary instance that contains the key/value
pairs to be used as property values.</param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:interfaceMember memberName="Load" dataTypeName="IEntityKey"/>
				<plx:param name="values" dataTypeName="IDictionary" dataTypeQualifier="System.Collections"/>
			</plx:function>
			<plx:function name="ToDictionary" visibility="public" modifier="abstract">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Creates a new <see cref="T:System.Collections.IDictionary" /> object and populates it
with the property values of the current object.
</summary>
						<returns>A collection of name/value pairs.</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:interfaceMember memberName="ToDictionary" dataTypeName="IEntityKey"/>
				<plx:returns dataTypeName="IDictionary" dataTypeQualifier="System.Collections"/>
			</plx:function>
			<plx:function name="Equals" visibility="public" modifier="override">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Determines whether the specified System.Object is equal to the current object.
</summary>
						<param name="obj">The System.Object to compare with the current object.</param>
						<returns>Returns true if the specified System.Object is equal to the current object; otherwise, false.</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="obj" dataTypeName=".object"/>
				<plx:returns dataTypeName=".boolean"/>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="booleanOr">
							<plx:left>
								<plx:binaryOperator type="identityEquality">
									<plx:left>
										<plx:nameRef name="obj" type="parameter"/>
									</plx:left>
									<plx:right>
										<plx:nullKeyword/>
									</plx:right>
								</plx:binaryOperator>
							</plx:left>
							<plx:right>
								<plx:binaryOperator type="identityInequality">
									<plx:left>
										<plx:callThis name="GetType" accessor="base"/>
									</plx:left>
									<plx:right>
										<plx:callInstance name="GetType">
											<plx:callObject>
												<plx:nameRef name="obj" type="parameter"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:right>
								</plx:binaryOperator>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:return>
						<plx:falseKeyword/>
					</plx:return>
				</plx:branch>
				<plx:return>
					<plx:binaryOperator type="equality">
						<plx:left>
							<plx:callThis name="ToString"/>
						</plx:left>
						<plx:right>
							<plx:callInstance name="ToString">
								<plx:callObject>
									<plx:nameRef name="obj" type="parameter"/>
								</plx:callObject>
							</plx:callInstance>
						</plx:right>
					</plx:binaryOperator>
				</plx:return>
			</plx:function>
			<plx:function name="GetHashCode" visibility="public" modifier="override">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Serves as a hash function for a particular type. GetHashCode() is suitable
for use in hashing algorithms and data structures like a hash table.
</summary>
						<returns>A hash code for the current object.</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:returns dataTypeName=".i4"/>
				<plx:return>
					<plx:callInstance name="GetHashCode">
						<plx:callObject>
							<plx:callThis name="ToString"/>
						</plx:callObject>
					</plx:callInstance>
				</plx:return>
			</plx:function>
		</plx:class>
	</xsl:template>
	<xsl:template name="EntityKeyBase">
		<plx:class name="EntityKeyBase" visibility="public" modifier="abstract" partial="true">
			<plx:leadingInfo>
				<plx:docComment>
					<summary>
The base object for each database table's unique identifier.
</summary>
					<remarks>
This file is generated once and will never be overwritten.
</remarks>
				</plx:docComment>
			</plx:leadingInfo>
			<plx:attribute dataTypeName="SerializableAttribute" dataTypeQualifier="System"/>
			<plx:attribute dataTypeName="CLSCompliantAttribute" dataTypeQualifier="System">
				<plx:passParam>
					<plx:trueKeyword/>
				</plx:passParam>
			</plx:attribute>
			<plx:derivesFromClass dataTypeName="EntityKeyBaseCore"/>
		</plx:class>
	</xsl:template>
	<xsl:template name="EntityInstanceBase.generated">
		<!-- Loop through each table to make EventArgs -->
		<xsl:for-each select="se:databaseSchema/se:tables/se:table">
			<xsl:variable name="entityClassName" select="csc:GetClassNameForTable(@owner, @name, '')"/>
			<xsl:variable name="structName" select="concat($entityClassName, 'EntityData')"/>
			<xsl:variable name="updatableColumnsFragment">
				<xsl:for-each select="se:columns/se:column[not(@isComputed='true')][not(@isIdentity='true')]">
					<xsl:copy-of select="."/>
				</xsl:for-each>
			</xsl:variable>
			<xsl:variable name="updatableColumns" select="exsl:node-set($updatableColumnsFragment)/child::*"/>
			<xsl:variable name="primaryKeyColumnsFragment">
				<xsl:for-each select="se:columns/se:column[@name=current()/se:indexes/se:index[@isPrimary='true']/se:column/@ref]">
					<xsl:copy-of select="."/>
				</xsl:for-each>
			</xsl:variable>
			<xsl:variable name="primaryKeyColumns" select="exsl:node-set($primaryKeyColumnsFragment)/child::*"/>
			<xsl:variable name="nameColumnsFragment">
				<xsl:for-each select="$updatableColumns">
					<plx:param name="{@name}">
						<xsl:attribute name="privateName">
							<xsl:value-of select="csc:GetPrivateName(@name)"/>
						</xsl:attribute>
						<xsl:attribute name="propertyName">
							<xsl:value-of select="csc:GetPropertyName(@name)"/>
						</xsl:attribute>
						<xsl:call-template name="ApplyPLiXDataType">
							<xsl:with-param name="nativeType" select="@nativeType"/>
							<xsl:with-param name="nullable" select="@nullable='true' or @nullable='1'"/>
						</xsl:call-template>
					</plx:param>
				</xsl:for-each>
			</xsl:variable>
			<xsl:variable name="nameColumns" select="exsl:node-set($nameColumnsFragment)/child::*"/>

			<plx:class name="{$entityClassName}EventArgs" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Provides data for the ColumnChanging and ColumnChanged events.
</summary>
						<remarks>
The ColumnChanging and ColumnChanged events occur when a change is made to the value 
of a property of a &lt;see cref="Entities.<xsl:value-of select="$entityClassName"/> /&gt; object.
</remarks>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:derivesFromClass dataTypeName="EventArgs" dataTypeQualifier="System"/>
				<plx:field name="column" visibility="private" dataTypeName="{$entityClassName}Column"/>
				<plx:field name="value" visibility="private" dataTypeName=".object"/>
				<plx:property name="Column" visibility="public">
					<plx:leadingInfo>
						<plx:docComment>
							<summary>
The <xsl:value-of select="$entityClassName"/>Column that was modified, which has raised the event.
</summary>
							<value cref="Entities.{$entityClassName}Column" />
						</plx:docComment>
					</plx:leadingInfo>
					<plx:returns dataTypeName="{$entityClassName}Column"/>
					<plx:get>
						<plx:return>
							<plx:callThis name="column" type="field"/>
						</plx:return>
					</plx:get>
				</plx:property>
				<plx:property name="Value" visibility="public">
					<plx:leadingInfo>
						<plx:docComment>
							<summary>
Gets the current value of the column.
</summary>
							<value>The current value of the column.</value>
						</plx:docComment>
					</plx:leadingInfo>
					<plx:returns dataTypeName=".object"/>
					<plx:get>
						<plx:return>
							<plx:callThis name="value" type="field"/>
						</plx:return>
					</plx:get>
				</plx:property>
				<plx:function name=".construct" visibility="public">
					<plx:leadingInfo>
						<plx:docComment>
							<summary>
Initalizes a new Instance of the <xsl:value-of select="$entityClassName"/>EventArgs class.
</summary>
						</plx:docComment>
					</plx:leadingInfo>
					<plx:param name="column" dataTypeName="{$entityClassName}Column"/>
					<plx:assign>
						<plx:left>
							<plx:callThis name="column" type="field"/>
						</plx:left>
						<plx:right>
							<plx:nameRef name="column" type="parameter"/>
						</plx:right>
					</plx:assign>
				</plx:function>
				<plx:function name=".construct" visibility="public">
					<plx:leadingInfo>
						<plx:docComment>
							<summary>
Initalizes a new Instance of the <xsl:value-of select="$entityClassName"/>EventArgs class.
</summary>
						</plx:docComment>
					</plx:leadingInfo>
					<plx:param name="column" dataTypeName="{$entityClassName}Column"/>
					<plx:param name="value" dataTypeName=".object"/>
					<plx:assign>
						<plx:left>
							<plx:callThis name="column" type="field"/>
						</plx:left>
						<plx:right>
							<plx:nameRef name="column" type="parameter"/>
						</plx:right>
					</plx:assign>
					<plx:assign>
						<plx:left>
							<plx:callThis name="value" type="field"/>
						</plx:left>
						<plx:right>
							<plx:nameRef name="value" type="parameter"/>
						</plx:right>
					</plx:assign>
				</plx:function>
			</plx:class>
			<plx:delegate name="{$entityClassName}EventHandler" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Define a delegate for all <xsl:value-of select="$entityClassName"/> related events.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="sender" dataTypeName=".object"/>
				<plx:param name="e" dataTypeName="{$entityClassName}EventArgs"/>
			</plx:delegate>
			<plx:class name="{$entityClassName}Base" visibility="public" modifier="abstract" partial="true">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
An object representation of the <xsl:value-of select="$entityClassName"/> table. 	
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<xsl:if test="$settings['IncludeWCFDataAttributes']">
					<plx:attribute dataTypeName="DataContract" dataTypeQualifier="System.Runtime.Serialization"/>
				</xsl:if>
				<plx:attribute dataTypeName="SerializableAttribute" dataTypeQualifier="System"/>
				<plx:attribute dataTypeName="CLSCompliantAttribute" dataTypeQualifier="System">
					<plx:passParam>
						<plx:trueKeyword/>
					</plx:passParam>
				</plx:attribute>
				<plx:attribute dataTypeName="DataObjectAttribute" dataTypeQualifier="System.ComponentModel"/>
				<plx:derivesFromClass dataTypeName="EntityBase"/>
				<!--<plx:implementsInterface dataTypeName="I{$entityClassName}"/>-->
				<plx:implementsInterface dataTypeName="IEntityId">
					<plx:passTypeParam dataTypeName="{$entityClassName}Key"/>
				</plx:implementsInterface>
				<!-- <plx:implementsInterface dataTypeName="IEntity"/> -->
				<plx:implementsInterface dataTypeName="IComparable" dataTypeQualifier="System"/>
				<plx:implementsInterface dataTypeName="ICloneable" dataTypeQualifier="System"/>
				<plx:implementsInterface dataTypeName="IEditableObject" dataTypeQualifier="System.ComponentModel"/>
				<plx:implementsInterface dataTypeName="IComponent" dataTypeQualifier="System.ComponentModel"/>
				<!--<plx:implementsInterface dataTypeName="IDisposable" dataTypeQualifier="System"/> -->
				<plx:implementsInterface dataTypeName="INotifyPropertyChanged" dataTypeQualifier="System.ComponentModel"/>

				<!-- Variable Declarations -->
				<plx:field name="entityData" visibility="private" dataTypeName="{$structName}" dataTypeQualifier="{$entityClassName}Base">
					<plx:leadingInfo>
						<plx:docComment>
							<summary>
Hold the inner data of the entity.
</summary>
						</plx:docComment>
					</plx:leadingInfo>
				</plx:field>
				<plx:field name="_originalData" visibility="private" dataTypeName="{$structName}" dataTypeQualifier="{$entityClassName}Base">
					<plx:leadingInfo>
						<plx:docComment>
							<summary>
Hold the original data of the entity, as loaded from the repository.
</summary>
						</plx:docComment>
					</plx:leadingInfo>
				</plx:field>
				<plx:field name="backupData" visibility="private" dataTypeName="{$structName}" dataTypeQualifier="{$entityClassName}Base">
					<plx:leadingInfo>
						<plx:docComment>
							<summary>
Hold a backup of the inner data of the entity.
</summary>
						</plx:docComment>
					</plx:leadingInfo>
				</plx:field>
				<plx:field name="entityTrackingKey" visibility="private" dataTypeName=".string">
					<plx:leadingInfo>
						<plx:docComment>
							<summary>
Key used if Tracking is Enabled for the <see cref="Entities.EntityLocator" />.
</summary>
						</plx:docComment>
					</plx:leadingInfo>
				</plx:field>
				<plx:field name="parentCollection" visibility="private" dataTypeName="TList">
					<plx:passTypeParam dataTypeName="{$entityClassName}"/>
					<plx:leadingInfo>
						<plx:docComment>
							<summary>
Hold the parent TList&lt;entity&gt; in which this entity maybe contained.
</summary>
							<remark>Mostly used for databinding</remark>
						</plx:docComment>
					</plx:leadingInfo>
					<plx:attribute dataTypeName="NonSerializedAttribute" dataTypeQualifier="System"/>
				</plx:field>
				<plx:field name="inTxn" visibility="private" dataTypeName=".boolean"/>
				<plx:event name="ColumnChanging" visibility="public">
					<plx:leadingInfo>
						<plx:docComment>
							<summary>
Occurs when a value is being changed for the specified column.
</summary>
						</plx:docComment>
					</plx:leadingInfo>
					<plx:attribute type="implicitField" dataTypeName="NonSerializedAttribute" dataTypeQualifier="System"/>
					<plx:param name="sender" dataTypeName=".object"/>
					<plx:param name="e" dataTypeName="{$entityClassName}EventArgs"/>
					<plx:explicitDelegateType dataTypeName="{$entityClassName}EventHandler"/>
				</plx:event>
				<plx:event name="ColumnChanged" visibility="public">
					<plx:leadingInfo>
						<plx:docComment>
							<summary>
Occurs after a value has been changed for the specified column.
</summary>
						</plx:docComment>
					</plx:leadingInfo>
					<plx:attribute type="implicitField" dataTypeName="NonSerializedAttribute" dataTypeQualifier="System"/>
					<plx:param name="sender" dataTypeName=".object"/>
					<plx:param name="e" dataTypeName="{$entityClassName}EventArgs"/>
					<plx:explicitDelegateType dataTypeName="{$entityClassName}EventHandler"/>
				</plx:event>

				<!-- Constructors -->
				<plx:function name=".construct" visibility="public">
					<plx:leadingInfo>
						<plx:docComment>
							<summary>
Creates a new <see cref="Entities.{$entityClassName}Base" /> instance.
</summary>
						</plx:docComment>
					</plx:leadingInfo>
					<plx:assign>
						<plx:left>
							<plx:callThis name="inTxn" type="field"/>
						</plx:left>
						<plx:right>
							<plx:falseKeyword/>
						</plx:right>
					</plx:assign>
					<plx:assign>
						<plx:left>
							<plx:callThis name="_site" type="field"/>
						</plx:left>
						<plx:right>
							<plx:nullKeyword/>
						</plx:right>
					</plx:assign>
					<plx:assign>
						<plx:left>
							<plx:callThis name="entityData" type="field"/>
						</plx:left>
						<plx:right>
							<plx:callNew dataTypeName="{$structName}" />
						</plx:right>
					</plx:assign>
					<plx:assign>
						<plx:left>
							<plx:callThis name="backupData" type="field"/>
						</plx:left>
						<plx:right>
							<plx:nullKeyword/>
						</plx:right>
					</plx:assign>
				</plx:function>
				<xsl:if test="count($updatableColumns)&gt;0">
					<plx:function name=".construct" visibility="public">
						<plx:leadingInfo>
							<plx:docComment>
								<summary>
Creates a new <see cref="Entities.{$entityClassName}Base" /> instance.
</summary>
								<xsl:for-each select="$nameColumns">
									<param name="{@privateName}">
										<xsl:value-of select="se:description"/>
									</param>
								</xsl:for-each>
							</plx:docComment>
						</plx:leadingInfo>

						<xsl:for-each select="$nameColumns">
							<plx:param name="{@privateName}" dataTypeName="{@dataTypeName}"/>
						</xsl:for-each>

						<plx:assign>
							<plx:left>
								<plx:callThis name="inTxn" type="field"/>
							</plx:left>
							<plx:right>
								<plx:falseKeyword/>
							</plx:right>
						</plx:assign>
						<plx:assign>
							<plx:left>
								<plx:callThis name="_site" type="field"/>
							</plx:left>
							<plx:right>
								<plx:nullKeyword/>
							</plx:right>
						</plx:assign>
						<plx:assign>
							<plx:left>
								<plx:callThis name="entityData" type="field"/>
							</plx:left>
							<plx:right>
								<plx:callNew dataTypeName="{$structName}" dataTypeQualifier="{$entityClassName}Base"/>
							</plx:right>
						</plx:assign>
						<plx:assign>
							<plx:left>
								<plx:callThis name="backupData" type="field"/>
							</plx:left>
							<plx:right>
								<plx:nullKeyword/>
							</plx:right>
						</plx:assign>

						<xsl:for-each select="$nameColumns">
							<plx:assign>
								<plx:left>
									<plx:callThis name="{@propertyName}" type="property"/>
								</plx:left>
								<plx:right>
									<plx:nameRef name="{@privateName}" type="parameter"/>
								</plx:right>
							</plx:assign>
						</xsl:for-each>
					</plx:function>
					<plx:function name="Create{$entityClassName}" visibility="public" modifier="static">
						<plx:leadingInfo>
							<plx:docComment>
								<summary>
A simple factory method to create a new <see cref="Entities.{@entityClassName}" /> instance.
</summary>
								<xsl:for-each select="$nameColumns">
									<param name="{@privateName}">
										<xsl:value-of select="se:description"/>
									</param>
								</xsl:for-each>
							</plx:docComment>
						</plx:leadingInfo>
						<xsl:for-each select="$nameColumns">
							<plx:param name="{@privateName}" dataTypeName="{@dataTypeName}"/>
						</xsl:for-each>
						<plx:returns dataTypeName="{$entityClassName}"/>
						<plx:local name="new{$entityClassName}" dataTypeName="{$entityClassName}">
							<plx:initialize>
								<plx:callNew dataTypeName="{$entityClassName}"/>
							</plx:initialize>
						</plx:local>
						<xsl:for-each select="$nameColumns">
							<plx:assign>
								<plx:left>
									<plx:callInstance name="{@propertyName}" type="property">
										<plx:callObject>
											<plx:nameRef name="new{$entityClassName}"/>
										</plx:callObject>
									</plx:callInstance>
								</plx:left>
								<plx:right>
									<plx:nameRef name="{@privateName}" type="parameter"/>
								</plx:right>
							</plx:assign>
						</xsl:for-each>
						<plx:return>
							<plx:nameRef name="new{$entityClassName}"/>
						</plx:return>
					</plx:function>
				</xsl:if>

				<xsl:if test="$settings['IncludeWCFDataAttributes']">
					<plx:field name="_deserializing" visibility="private" dataTypeName=".boolean">
						<plx:initialize>
							<plx:falseKeyword/>
						</plx:initialize>
					</plx:field>
					<plx:function name="Initialize_BeforeDeserializing" visibility="private">
						<plx:leadingInfo>
							<plx:docComment>
								<summary>
Called before deserializing the type.
</summary>
								<param name="context"/>
							</plx:docComment>
						</plx:leadingInfo>
						<plx:attribute dataTypeName="OnDeserializingAttribute"/>
						<plx:param name="context" dataTypeName="StreamingContext"/>
						<plx:assign>
							<plx:left>
								<plx:callThis name="_deserializing" type="field"/>
							</plx:left>
							<plx:right>
								<plx:trueKeyword/>
							</plx:right>
						</plx:assign>
						<plx:assign>
							<plx:left>
								<plx:callThis name="entityData" type="field"/>
							</plx:left>
							<plx:right>
								<plx:callNew dataTypeName="{$structName}"/>
							</plx:right>
						</plx:assign>
						<plx:assign>
							<plx:left>
								<plx:callThis name="backupData" type="field"/>
							</plx:left>
							<plx:right>
								<plx:nullKeyword/>
							</plx:right>
						</plx:assign>
						<plx:callThis name="AddValidationRules"/>
					</plx:function>
					<plx:function name="Initialize_Deserialized" visibility="private">
						<plx:leadingInfo>
							<plx:docComment>
								<summary>
Called after deserializing the type.
</summary>
								<param name="context"/>
							</plx:docComment>
						</plx:leadingInfo>
						<plx:attribute dataTypeName="OnDeserializedAttribute"/>
						<plx:param name="context" dataTypeName="StreamingContext"/>
						<plx:assign>
							<plx:left>
								<plx:callThis name="_deserializing" type="field"/>
							</plx:left>
							<plx:right>
								<plx:falseKeyword/>
							</plx:right>
						</plx:assign>
					</plx:function>
				</xsl:if>

				<!-- Events Trigger -->
				<plx:function name="OnColumnChanging" visibility="public">
					<plx:leadingInfo>
						<plx:docComment>
							<summary>
Raises the <see cref="Entities.{$entityClassName}Base.ColumnChanging" /> event.
</summary>
							<param name="column">The <see cref="Entities.{$entityClassName}Column" /> which has raised the event.</param>
						</plx:docComment>
					</plx:leadingInfo>
					<plx:param name="column" dataTypeName="{$entityClassName}Column"/>
					<plx:callThis name="OnColumnChanging">
						<plx:passParam>
							<plx:nameRef name="column" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:nullKeyword/>
						</plx:passParam>
					</plx:callThis>
				</plx:function>
				<plx:function name="OnColumnChanged" visibility="public">
					<plx:leadingInfo>
						<plx:docComment>
							<summary>
Raises the <see cref="Entities.{$entityClassName}Base.ColumnChanged" /> event.
</summary>
							<param name="column">The <see cref="Entities.{$entityClassName}Column" /> which has raised the event.</param>
						</plx:docComment>
					</plx:leadingInfo>
					<plx:param name="column" dataTypeName="{$entityClassName}Column"/>
					<plx:callThis name="OnColumnChanged">
						<plx:passParam>
							<plx:nameRef name="column" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:nullKeyword/>
						</plx:passParam>
					</plx:callThis>
				</plx:function>
				<plx:function name="OnColumnChanging" visibility="public">
					<plx:leadingInfo>
						<plx:docComment>
							<summary>
Raises the <see cref="Entities.{$entityClassName}Base.ColumnChanging" /> event.
</summary>
							<param name="column">The <see cref="Entities.{$entityClassName}Column" /> which has raised the event.</param>
							<param name="value">The changed value.</param>
						</plx:docComment>
					</plx:leadingInfo>
					<plx:param name="column" dataTypeName="{$entityClassName}Column"/>
					<plx:param name="value" dataTypeName=".object"/>
					<plx:branch>
						<plx:condition>
							<plx:unaryOperator type="booleanNot">
								<plx:binaryOperator type="booleanOr">
									<plx:left>
										<plx:binaryOperator type="booleanOr">
											<plx:left>
												<plx:unaryOperator type="booleanNot">
													<plx:callThis name="IsEntityTracked" type="property"/>
												</plx:unaryOperator>
											</plx:left>
											<plx:right>
												<plx:binaryOperator type="equality">
													<plx:left>
														<plx:callThis name="EntityState" type="property"/>
													</plx:left>
													<plx:right>
														<plx:callStatic name="Added" type="field" dataTypeName="EntityState"/>
													</plx:right>
												</plx:binaryOperator>
											</plx:right>
										</plx:binaryOperator>
									</plx:left>
									<plx:right>
										<plx:callStatic name="TrackChangedEntities" type="property" dataTypeName="EntityManager"/>
									</plx:right>
								</plx:binaryOperator>
							</plx:unaryOperator>
						</plx:condition>
						<plx:callStatic name="StopTracking" dataTypeName="EntityManager">
							<plx:passParam>
								<plx:callThis name="entityTrackingKey" type="field"/>
							</plx:passParam>
						</plx:callStatic>
					</plx:branch>
					<plx:branch>
						<plx:condition>
							<plx:unaryOperator type="booleanNot">
								<plx:callThis name="SuppressEntityEvents" type="property"/>
							</plx:unaryOperator>
						</plx:condition>
						<plx:local name="handler" dataTypeName="{$entityClassName}EventHandler">
							<plx:initialize>
								<plx:callThis name="ColumnChanging" type="field"/>
							</plx:initialize>
						</plx:local>
						<plx:branch>
							<plx:condition>
								<plx:binaryOperator type="identityInequality">
									<plx:left>
										<plx:nameRef name="handler"/>
									</plx:left>
									<plx:right>
										<plx:nullKeyword/>
									</plx:right>
								</plx:binaryOperator>
							</plx:condition>
							<plx:callInstance name=".implied" type="delegateCall">
								<plx:callObject>
									<plx:nameRef name="handler"/>
								</plx:callObject>
								<plx:passParam>
									<plx:thisKeyword/>
								</plx:passParam>
								<plx:passParam>
									<plx:callNew dataTypeName="{$entityClassName}EventArgs">
										<plx:passParam>
											<plx:nameRef name="column" type="parameter"/>
										</plx:passParam>
										<plx:passParam>
											<plx:nameRef name="value" type="parameter"/>
										</plx:passParam>
									</plx:callNew>
								</plx:passParam>
							</plx:callInstance>
						</plx:branch>
					</plx:branch>
				</plx:function>
				<plx:function name="OnColumnChanged" visibility="public">
					<plx:leadingInfo>
						<plx:docComment>
							<summary>
Raises the <see cref="Entities.{$entityClassName}Base.ColumnChanged" /> event.
</summary>
							<param name="column">The <see cref="Entities.{$entityClassName}Column" /> which has raised the event.</param>
							<param name="value">The changed value.</param>
						</plx:docComment>
					</plx:leadingInfo>
					<plx:param name="column" dataTypeName="{$entityClassName}Column"/>
					<plx:param name="value" dataTypeName=".object"/>
					<plx:branch>
						<plx:condition>
							<plx:unaryOperator type="booleanNot">
								<plx:callThis name="SuppressEntityEvents" type="property"/>
							</plx:unaryOperator>
						</plx:condition>
						<plx:local name="handler" dataTypeName="{$entityClassName}EventHandler">
							<plx:initialize>
								<plx:callThis name="ColumnChanged" type="field"/>
							</plx:initialize>
						</plx:local>
						<plx:branch>
							<plx:condition>
								<plx:binaryOperator type="identityInequality">
									<plx:left>
										<plx:nameRef name="handler"/>
									</plx:left>
									<plx:right>
										<plx:nullKeyword/>
									</plx:right>
								</plx:binaryOperator>
							</plx:condition>
							<plx:callInstance name=".implied" type="delegateCall">
								<plx:callObject>
									<plx:nameRef name="handler"/>
								</plx:callObject>
								<plx:passParam>
									<plx:thisKeyword/>
								</plx:passParam>
								<plx:passParam>
									<plx:callNew dataTypeName="{$entityClassName}EventArgs">
										<plx:passParam>
											<plx:nameRef name="column" type="parameter"/>
										</plx:passParam>
										<plx:passParam>
											<plx:nameRef name="value" type="parameter"/>
										</plx:passParam>
									</plx:callNew>
								</plx:passParam>
							</plx:callInstance>
						</plx:branch>
						<plx:callThis name="OnEntityChanged"/>
					</plx:branch>
				</plx:function>

				<!-- TODO: ADD PROPERTY REGION -->

				<!-- IEditableObject -->
				<plx:delegate name="CancelAddNewEventHandler" visibility="public">
					<plx:leadingInfo>
						<plx:docComment>
							<summary>
The delegate for the CancelAddNew event.
</summary>
							<param name="sender"></param>
							<param name="e"></param>
						</plx:docComment>
					</plx:leadingInfo>
					<plx:param name="sender" dataTypeName=".object"/>
					<plx:param name="e" dataTypeName="EventArgs" dataTypeQualifier="System"/>
				</plx:delegate>
				<plx:event name="CancelAddNew" visibility="public">
					<plx:leadingInfo>
						<plx:docComment>
							<summary>
The CancelAddNew event.
</summary>
						</plx:docComment>
					</plx:leadingInfo>
					<plx:attribute type="implicitField" dataTypeName="NonSerializedAttribute" dataTypeQualifier="System"/>
					<plx:param name="sender" dataTypeName=".object"/>
					<plx:param name="e" dataTypeName="EventArgs" dataTypeQualifier="System"/>
					<plx:explicitDelegateType dataTypeName="CancelAddNewEventHandler" dataTypeQualifier="{$entityClassName}Base"/>
				</plx:event>
				<plx:function name="OnCancelAddNew" visibility="public">
					<plx:leadingInfo>
						<plx:docComment>
							<summary>
Called when [cancel add new].
</summary>
						</plx:docComment>
					</plx:leadingInfo>
					<plx:branch>
						<plx:condition>
							<plx:unaryOperator type="booleanNot">
								<plx:callThis name="SuppressEntityEvents" type="property"/>
							</plx:unaryOperator>
						</plx:condition>
						<plx:local name="handler" dataTypeName="CancelAddNewEventHandler" dataTypeQualifier="{$entityClassName}Base">
							<plx:initialize>
								<plx:callThis name="CancelAddNew" type="field"/>
							</plx:initialize>
						</plx:local>
						<plx:branch>
							<plx:condition>
								<plx:binaryOperator type="identityInequality">
									<plx:left>
										<plx:nameRef name="handler"/>
									</plx:left>
									<plx:right>
										<plx:nullKeyword/>
									</plx:right>
								</plx:binaryOperator>
							</plx:condition>
							<plx:callInstance name=".implied" type="delegateCall">
								<plx:callObject>
									<plx:nameRef name="handler"/>
								</plx:callObject>
								<plx:passParam>
									<plx:thisKeyword/>
								</plx:passParam>
								<plx:passParam>
									<plx:callStatic name="Empty" type="field" dataTypeName="EventArgs" dataTypeQualifier="System"/>
								</plx:passParam>
							</plx:callInstance>
						</plx:branch>
					</plx:branch>
				</plx:function>
				<plx:function name="BeginEdit" visibility="private">
					<plx:leadingInfo>
						<plx:docComment>
							<summary>
Begins an edit on an object.
</summary>
						</plx:docComment>
					</plx:leadingInfo>
					<plx:interfaceMember memberName="BeginEdit" dataTypeName="IEditableObject" dataTypeQualifier="System.ComponentModel"/>
					<plx:branch>
						<plx:condition>
							<plx:unaryOperator type="booleanNot">
								<plx:callThis name="inTxn" type="field"/>
							</plx:unaryOperator>
						</plx:condition>
						<plx:assign>
							<plx:left>
								<plx:callThis name="backupData" type="field"/>
							</plx:left>
							<plx:right>
								<plx:cast type="testCast" dataTypeName="{$structName}" dataTypeQualifier="{$entityClassName}Base">
									<plx:callInstance name="Clone">
										<plx:callObject>
											<plx:callThis name="entityData" type="field"/>
										</plx:callObject>
									</plx:callInstance>
								</plx:cast>
							</plx:right>
						</plx:assign>
						<plx:assign>
							<plx:left>
								<plx:callThis name="inTxn" type="field"/>
							</plx:left>
							<plx:right>
								<plx:trueKeyword/>
							</plx:right>
						</plx:assign>
					</plx:branch>
				</plx:function>
				<plx:function name="CancelEdit" visibility="private">
					<plx:leadingInfo>
						<plx:docComment>
							<summary>
Discards changes since the last <c>BeginEdit</c> call.
</summary>
						</plx:docComment>
					</plx:leadingInfo>
					<plx:interfaceMember memberName="CancelEdit" dataTypeName="IEditableObject" dataTypeQualifier="System.ComponentModel"/>
					<plx:branch>
						<plx:condition>
							<plx:callThis name="inTxn" type="field"/>
						</plx:condition>
						<plx:assign>
							<plx:left>
								<plx:callThis name="entityData" type="field"/>
							</plx:left>
							<plx:right>
								<plx:callThis name="backupData" type="field"/>
							</plx:right>
						</plx:assign>
						<plx:assign>
							<plx:left>
								<plx:callThis name="backupData" type="field"/>
							</plx:left>
							<plx:right>
								<plx:nullKeyword/>
							</plx:right>
						</plx:assign>
						<plx:assign>
							<plx:left>
								<plx:callThis name="inTxn" type="field"/>
							</plx:left>
							<plx:right>
								<plx:falseKeyword/>
							</plx:right>
						</plx:assign>
						<plx:branch>
							<plx:condition>
								<plx:binaryOperator type="booleanAnd">
									<plx:left>
										<plx:callThis name="bindingIsNew" type="field"/>
									</plx:left>
									<plx:right>
										<plx:binaryOperator type="identityInequality">
											<plx:left>
												<plx:callThis name="parentCollection" type="field"/>
											</plx:left>
											<plx:right>
												<plx:nullKeyword/>
											</plx:right>
										</plx:binaryOperator>
									</plx:right>
								</plx:binaryOperator>
							</plx:condition>
							<plx:callInstance name="Remove">
								<plx:callObject>
									<plx:callThis name="parentCollection" type="field"/>
								</plx:callObject>
								<plx:passParam>
									<plx:cast dataTypeName="{$entityClassName}">
										<plx:thisKeyword/>
									</plx:cast>
								</plx:passParam>
							</plx:callInstance>
						</plx:branch>
					</plx:branch>
				</plx:function>
				<plx:function name="EndEdit" visibility="private">
					<plx:leadingInfo>
						<plx:docComment>
							<summary>
Pushes changes since the last <c>BeginEdit</c> or <c>IBindingList.AddNew</c> call into the underlying object.
</summary>
						</plx:docComment>
					</plx:leadingInfo>
					<plx:interfaceMember memberName="EndEdit" dataTypeName="IEditableObject" dataTypeQualifier="System.ComponentModel"/>
					<plx:branch>
						<plx:condition>
							<plx:callThis name="inTxn" type="field"/>
						</plx:condition>
						<plx:assign>
							<plx:left>
								<plx:callThis name="backupData" type="field"/>
							</plx:left>
							<plx:right>
								<plx:nullKeyword/>
							</plx:right>
						</plx:assign>
						<plx:branch>
							<plx:condition>
								<plx:callThis name="IsDirty" type="property"/>
							</plx:condition>
							<plx:branch>
								<plx:condition>
									<plx:callThis name="bindingIsNew" type="field"/>
								</plx:condition>
								<plx:assign>
									<plx:left>
										<plx:callThis name="EntityState" type="property"/>
									</plx:left>
									<plx:right>
										<plx:callStatic name="Added" type="field" dataTypeName="EntityState"/>
									</plx:right>
								</plx:assign>
								<plx:assign>
									<plx:left>
										<plx:callThis name="bindingIsNew" type="field"/>
									</plx:left>
									<plx:right>
										<plx:falseKeyword/>
									</plx:right>
								</plx:assign>
							</plx:branch>
							<plx:alternateBranch>
								<plx:condition>
									<plx:binaryOperator type="equality">
										<plx:left>
											<plx:callThis name="EntityState" type="property"/>
										</plx:left>
										<plx:right>
											<plx:callStatic name="Unchanged" type="field" dataTypeName="EntityState"/>
										</plx:right>
									</plx:binaryOperator>
								</plx:condition>
								<plx:assign>
									<plx:left>
										<plx:callThis name="EntityState" type="property"/>
									</plx:left>
									<plx:right>
										<plx:callStatic name="Changed" type="field" dataTypeName="EntityState"/>
									</plx:right>
								</plx:assign>
							</plx:alternateBranch>
						</plx:branch>
						<plx:assign>
							<plx:left>
								<plx:callThis name="bindingIsNew" type="field"/>
							</plx:left>
							<plx:right>
								<plx:falseKeyword/>
							</plx:right>
						</plx:assign>
						<plx:assign>
							<plx:left>
								<plx:callThis name="inTxn" type="field"/>
							</plx:left>
							<plx:right>
								<plx:falseKeyword/>
							</plx:right>
						</plx:assign>
					</plx:branch>
				</plx:function>
				<plx:property name="ParentCollection" visibility="public" modifier="override">
					<plx:leadingInfo>
						<plx:docComment>
							<summary>
Gets or sets the parent collection.
</summary>
							<value>The parent collection.</value>
						</plx:docComment>
					</plx:leadingInfo>
					<plx:attribute dataTypeName="XmlIgnore"/>
					<plx:attribute dataTypeName="Browsable">
						<plx:passParam>
							<plx:falseKeyword/>
						</plx:passParam>
					</plx:attribute>
					<plx:returns dataTypeName=".object"/>
					<plx:get>
						<plx:return>
							<plx:cast type="primitiveUnchecked" dataTypeName=".object">
								<plx:callThis name="parentCollection" type="field"/>
							</plx:cast>
						</plx:return>
					</plx:get>
					<plx:set>
						<plx:assign>
							<plx:left>
								<plx:callThis name="parentCollection" type="field"/>
							</plx:left>
							<plx:right>
								<plx:cast type="testCast" dataTypeName="TList">
									<plx:passTypeParam dataTypeName="{$entityClassName}"/>
									<plx:nameRef name="value" type="parameter"/>
								</plx:cast>
							</plx:right>
						</plx:assign>
					</plx:set>
				</plx:property>
				<plx:function name="OnEntityChanged" visibility="private">
					<plx:leadingInfo>
						<plx:docComment>
							<summary>
Called when the entity is changed.
</summary>
						</plx:docComment>
					</plx:leadingInfo>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="booleanAnd">
								<plx:left>
									<plx:binaryOperator type="booleanAnd">
										<plx:left>
											<plx:unaryOperator type="booleanNot">
												<plx:callThis name="SuppressEntityEvents" type="property"/>
											</plx:unaryOperator>
										</plx:left>
										<plx:right>
											<plx:unaryOperator type="booleanNot">
												<plx:callThis name="inTxn" type="field"/>
											</plx:unaryOperator>
										</plx:right>
									</plx:binaryOperator>
								</plx:left>
								<plx:right>
									<plx:binaryOperator type="identityInequality">
										<plx:left>
											<plx:callThis name="parentCollection" type="field"/>
										</plx:left>
										<plx:right>
											<plx:nullKeyword/>
										</plx:right>
									</plx:binaryOperator>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:callInstance name="EntityChanged">
							<plx:callObject>
								<plx:callThis name="parentCollection" type="field"/>
							</plx:callObject>
							<plx:passParam>
								<plx:cast type="testCast" dataTypeName="{$entityClassName}">
									<plx:thisKeyword/>
								</plx:cast>
							</plx:passParam>
						</plx:callInstance>
					</plx:branch>
				</plx:function>

				<!-- TODO: Methods -->
				<plx:function name="CancelChanges" visibility="public" modifier="override">
					<plx:leadingInfo>
						<plx:docComment>
							<summary>
Revert all changes and restore original values.
</summary>
						</plx:docComment>
					</plx:leadingInfo>
					<plx:local name="obj" dataTypeName="IEditableObject" dataTypeQualifier="System.ComponentModel">
						<plx:initialize>
							<plx:cast dataTypeName="IEditableObject" dataTypeQualifier="System.ComponentModel">
								<plx:thisKeyword/>
							</plx:cast>
						</plx:initialize>
					</plx:local>
					<plx:callInstance name="CancelEdit">
						<plx:callObject>
							<plx:nameRef name="obj"/>
						</plx:callObject>
					</plx:callInstance>
					<plx:assign>
						<plx:left>
							<plx:callThis name="entityData" type="field"/>
						</plx:left>
						<plx:right>
							<plx:nullKeyword/>
						</plx:right>
					</plx:assign>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="identityInequality">
								<plx:left>
									<plx:callThis name="_originalData" type="field"/>
								</plx:left>
								<plx:right>
									<plx:nullKeyword/>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:assign>
							<plx:left>
								<plx:callThis name="entityData" type="field"/>
							</plx:left>
							<plx:right>
								<plx:cast type="testCast" dataTypeName="{$structName}" dataTypeQualifier="{$entityClassName}Base">
									<plx:callInstance name="Clone">
										<plx:callObject>
											<plx:callThis name="_originalData" type="field"/>
										</plx:callObject>
									</plx:callInstance>
								</plx:cast>
							</plx:right>
						</plx:assign>
					</plx:branch>
				</plx:function>
				<plx:function name="AcceptChanges" visibility="public" modifier="override">
					<plx:leadingInfo>
						<plx:docComment>
							<summary>
Accepts the changes made to this object.
</summary>
							<remarks>
After calling this method, properties: IsDirty, IsNew are false. IsDeleted flag remains unchanged as it is handled by the parent List.
</remarks>
						</plx:docComment>
					</plx:leadingInfo>
					<plx:interfaceMember memberName="AcceptChanges" dataTypeName="IEntity"/>
					<plx:callThis name="AcceptChanges" accessor="base"/>
					<plx:assign>
						<plx:left>
							<plx:callThis name="_originalData" type="field"/>
						</plx:left>
						<plx:right>
							<plx:nullKeyword/>
						</plx:right>
					</plx:assign>
					<plx:assign>
						<plx:left>
							<plx:callThis name="_originalData" type="field"/>
						</plx:left>
						<plx:right>
							<plx:cast type="testCast" dataTypeName="{$structName}" dataTypeQualifier="{$entityClassName}Base">
								<plx:callInstance name="Clone">
									<plx:callObject>
										<plx:callThis name="entityData" type="field"/>
									</plx:callObject>
								</plx:callInstance>
							</plx:cast>
						</plx:right>
					</plx:assign>
				</plx:function>
				<plx:function name="IsPropertyChanged" visibility="public">
					<plx:leadingInfo>
						<plx:docComment>
							<summary>
            Determines whether the property value has changed from the original data.
            </summary>
							<param name="column">The column.</param>
							<returns>
            	<c>true</c> if the property value has changed; otherwise, <c>false</c>.
            </returns>
						</plx:docComment>
					</plx:leadingInfo>
					<plx:param name="column" dataTypeName="EmployeePayHistoryColumn"/>
					<plx:returns dataTypeName=".boolean"/>
					<plx:switch>
						<plx:condition>
							<plx:nameRef name="column" type="parameter"/>
						</plx:condition>
						<plx:case>
							<plx:condition>
								<plx:callStatic name="EmployeeId" type="field" dataTypeName="EmployeePayHistoryColumn"/>
							</plx:condition>
							<plx:return>
								<plx:binaryOperator type="inequality">
									<plx:left>
										<plx:callInstance name="EmployeeId" type="field">
											<plx:callObject>
												<plx:callThis name="entityData" type="field"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:left>
									<plx:right>
										<plx:callInstance name="EmployeeId" type="field">
											<plx:callObject>
												<plx:callThis name="_originalData" type="field"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:right>
								</plx:binaryOperator>
							</plx:return>
						</plx:case>
						<plx:case>
							<plx:condition>
								<plx:callStatic name="RateChangeDate" type="field" dataTypeName="EmployeePayHistoryColumn"/>
							</plx:condition>
							<plx:return>
								<plx:binaryOperator type="inequality">
									<plx:left>
										<plx:callInstance name="RateChangeDate" type="field">
											<plx:callObject>
												<plx:callThis name="entityData" type="field"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:left>
									<plx:right>
										<plx:callInstance name="RateChangeDate" type="field">
											<plx:callObject>
												<plx:callThis name="_originalData" type="field"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:right>
								</plx:binaryOperator>
							</plx:return>
						</plx:case>
						<plx:case>
							<plx:condition>
								<plx:callStatic name="Rate" type="field" dataTypeName="EmployeePayHistoryColumn"/>
							</plx:condition>
							<plx:return>
								<plx:binaryOperator type="inequality">
									<plx:left>
										<plx:callInstance name="Rate" type="field">
											<plx:callObject>
												<plx:callThis name="entityData" type="field"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:left>
									<plx:right>
										<plx:callInstance name="Rate" type="field">
											<plx:callObject>
												<plx:callThis name="_originalData" type="field"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:right>
								</plx:binaryOperator>
							</plx:return>
						</plx:case>
						<plx:case>
							<plx:condition>
								<plx:callStatic name="PayFrequency" type="field" dataTypeName="EmployeePayHistoryColumn"/>
							</plx:condition>
							<plx:return>
								<plx:binaryOperator type="inequality">
									<plx:left>
										<plx:callInstance name="PayFrequency" type="field">
											<plx:callObject>
												<plx:callThis name="entityData" type="field"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:left>
									<plx:right>
										<plx:callInstance name="PayFrequency" type="field">
											<plx:callObject>
												<plx:callThis name="_originalData" type="field"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:right>
								</plx:binaryOperator>
							</plx:return>
						</plx:case>
						<plx:case>
							<plx:condition>
								<plx:callStatic name="ModifiedDate" type="field" dataTypeName="EmployeePayHistoryColumn"/>
							</plx:condition>
							<plx:return>
								<plx:binaryOperator type="inequality">
									<plx:left>
										<plx:callInstance name="ModifiedDate" type="field">
											<plx:callObject>
												<plx:callThis name="entityData" type="field"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:left>
									<plx:right>
										<plx:callInstance name="ModifiedDate" type="field">
											<plx:callObject>
												<plx:callThis name="_originalData" type="field"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:right>
								</plx:binaryOperator>
							</plx:return>
						</plx:case>
					</plx:switch>
					<plx:return>
						<plx:falseKeyword/>
					</plx:return>
				</plx:function>
				<plx:function name="HasDataChanged" visibility="public">
					<plx:leadingInfo>
						<plx:docComment>
							<summary>
            Determines whether the data has changed from original.
            </summary>
							<returns>
            	<c>true</c> if [has data changed]; otherwise, <c>false</c>.
            </returns>
						</plx:docComment>
					</plx:leadingInfo>
					<plx:returns dataTypeName=".boolean"/>
					<plx:local name="result" dataTypeName=".boolean">
						<plx:initialize>
							<plx:falseKeyword/>
						</plx:initialize>
					</plx:local>
					<plx:return>
						<plx:binaryOperator type="booleanOr">
							<plx:left>
								<plx:binaryOperator type="booleanOr">
									<plx:left>
										<plx:binaryOperator type="booleanOr">
											<plx:left>
												<plx:binaryOperator type="booleanOr">
													<plx:left>
														<plx:binaryOperator type="booleanOr">
															<plx:left>
																<plx:nameRef name="result"/>
															</plx:left>
															<plx:right>
																<plx:binaryOperator type="inequality">
																	<plx:left>
																		<plx:callInstance name="EmployeeId" type="field">
																			<plx:callObject>
																				<plx:callThis name="entityData" type="field"/>
																			</plx:callObject>
																		</plx:callInstance>
																	</plx:left>
																	<plx:right>
																		<plx:callInstance name="EmployeeId" type="field">
																			<plx:callObject>
																				<plx:callThis name="_originalData" type="field"/>
																			</plx:callObject>
																		</plx:callInstance>
																	</plx:right>
																</plx:binaryOperator>
															</plx:right>
														</plx:binaryOperator>
													</plx:left>
													<plx:right>
														<plx:binaryOperator type="inequality">
															<plx:left>
																<plx:callInstance name="RateChangeDate" type="field">
																	<plx:callObject>
																		<plx:callThis name="entityData" type="field"/>
																	</plx:callObject>
																</plx:callInstance>
															</plx:left>
															<plx:right>
																<plx:callInstance name="RateChangeDate" type="field">
																	<plx:callObject>
																		<plx:callThis name="_originalData" type="field"/>
																	</plx:callObject>
																</plx:callInstance>
															</plx:right>
														</plx:binaryOperator>
													</plx:right>
												</plx:binaryOperator>
											</plx:left>
											<plx:right>
												<plx:binaryOperator type="inequality">
													<plx:left>
														<plx:callInstance name="Rate" type="field">
															<plx:callObject>
																<plx:callThis name="entityData" type="field"/>
															</plx:callObject>
														</plx:callInstance>
													</plx:left>
													<plx:right>
														<plx:callInstance name="Rate" type="field">
															<plx:callObject>
																<plx:callThis name="_originalData" type="field"/>
															</plx:callObject>
														</plx:callInstance>
													</plx:right>
												</plx:binaryOperator>
											</plx:right>
										</plx:binaryOperator>
									</plx:left>
									<plx:right>
										<plx:binaryOperator type="inequality">
											<plx:left>
												<plx:callInstance name="PayFrequency" type="field">
													<plx:callObject>
														<plx:callThis name="entityData" type="field"/>
													</plx:callObject>
												</plx:callInstance>
											</plx:left>
											<plx:right>
												<plx:callInstance name="PayFrequency" type="field">
													<plx:callObject>
														<plx:callThis name="_originalData" type="field"/>
													</plx:callObject>
												</plx:callInstance>
											</plx:right>
										</plx:binaryOperator>
									</plx:right>
								</plx:binaryOperator>
							</plx:left>
							<plx:right>
								<plx:binaryOperator type="inequality">
									<plx:left>
										<plx:callInstance name="ModifiedDate" type="field">
											<plx:callObject>
												<plx:callThis name="entityData" type="field"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:left>
									<plx:right>
										<plx:callInstance name="ModifiedDate" type="field">
											<plx:callObject>
												<plx:callThis name="_originalData" type="field"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:right>
								</plx:binaryOperator>
							</plx:right>
						</plx:binaryOperator>
					</plx:return>
				</plx:function>
				<plx:function name="Copy" visibility="public" modifier="virtual">
					<plx:leadingInfo>
						<plx:docComment>
							<summary>
              Returns a Typed EmployeePayHistory Entity 
            </summary>
						</plx:docComment>
					</plx:leadingInfo>
					<plx:returns dataTypeName="EmployeePayHistory"/>
					<plx:local name="copy" dataTypeName="EmployeePayHistory">
						<plx:initialize>
							<plx:callNew dataTypeName="EmployeePayHistory"/>
						</plx:initialize>
					</plx:local>
					<plx:assign>
						<plx:left>
							<plx:callInstance name="SuppressEntityEvents" type="property">
								<plx:callObject>
									<plx:nameRef name="copy"/>
								</plx:callObject>
							</plx:callInstance>
						</plx:left>
						<plx:right>
							<plx:trueKeyword/>
						</plx:right>
					</plx:assign>
					<plx:assign>
						<plx:left>
							<plx:callInstance name="EmployeeId" type="property">
								<plx:callObject>
									<plx:nameRef name="copy"/>
								</plx:callObject>
							</plx:callInstance>
						</plx:left>
						<plx:right>
							<plx:callThis name="EmployeeId" type="property"/>
						</plx:right>
					</plx:assign>
					<plx:assign>
						<plx:left>
							<plx:callInstance name="OriginalEmployeeId" type="property">
								<plx:callObject>
									<plx:nameRef name="copy"/>
								</plx:callObject>
							</plx:callInstance>
						</plx:left>
						<plx:right>
							<plx:callThis name="OriginalEmployeeId" type="property"/>
						</plx:right>
					</plx:assign>
					<plx:assign>
						<plx:left>
							<plx:callInstance name="RateChangeDate" type="property">
								<plx:callObject>
									<plx:nameRef name="copy"/>
								</plx:callObject>
							</plx:callInstance>
						</plx:left>
						<plx:right>
							<plx:callThis name="RateChangeDate" type="property"/>
						</plx:right>
					</plx:assign>
					<plx:assign>
						<plx:left>
							<plx:callInstance name="OriginalRateChangeDate" type="property">
								<plx:callObject>
									<plx:nameRef name="copy"/>
								</plx:callObject>
							</plx:callInstance>
						</plx:left>
						<plx:right>
							<plx:callThis name="OriginalRateChangeDate" type="property"/>
						</plx:right>
					</plx:assign>
					<plx:assign>
						<plx:left>
							<plx:callInstance name="Rate" type="property">
								<plx:callObject>
									<plx:nameRef name="copy"/>
								</plx:callObject>
							</plx:callInstance>
						</plx:left>
						<plx:right>
							<plx:callThis name="Rate" type="property"/>
						</plx:right>
					</plx:assign>
					<plx:assign>
						<plx:left>
							<plx:callInstance name="PayFrequency" type="property">
								<plx:callObject>
									<plx:nameRef name="copy"/>
								</plx:callObject>
							</plx:callInstance>
						</plx:left>
						<plx:right>
							<plx:callThis name="PayFrequency" type="property"/>
						</plx:right>
					</plx:assign>
					<plx:assign>
						<plx:left>
							<plx:callInstance name="ModifiedDate" type="property">
								<plx:callObject>
									<plx:nameRef name="copy"/>
								</plx:callObject>
							</plx:callInstance>
						</plx:left>
						<plx:right>
							<plx:callThis name="ModifiedDate" type="property"/>
						</plx:right>
					</plx:assign>
					<plx:assign>
						<plx:left>
							<plx:callInstance name="EmployeeIdSource" type="property">
								<plx:callObject>
									<plx:nameRef name="copy"/>
								</plx:callObject>
							</plx:callInstance>
						</plx:left>
						<plx:right>
							<plx:cast type="testCast" dataTypeName="Employee">
								<plx:callStatic name="MakeCopyOf" dataTypeName="EmployeePayHistoryBase">
									<plx:passParam>
										<plx:callThis name="EmployeeIdSource" type="property"/>
									</plx:passParam>
								</plx:callStatic>
							</plx:cast>
						</plx:right>
					</plx:assign>
					<plx:assign>
						<plx:left>
							<plx:callInstance name="EntityState" type="property">
								<plx:callObject>
									<plx:nameRef name="copy"/>
								</plx:callObject>
							</plx:callInstance>
						</plx:left>
						<plx:right>
							<plx:callThis name="EntityState" type="property"/>
						</plx:right>
					</plx:assign>
					<plx:assign>
						<plx:left>
							<plx:callInstance name="SuppressEntityEvents" type="property">
								<plx:callObject>
									<plx:nameRef name="copy"/>
								</plx:callObject>
							</plx:callInstance>
						</plx:left>
						<plx:right>
							<plx:falseKeyword/>
						</plx:right>
					</plx:assign>
					<plx:return>
						<plx:nameRef name="copy"/>
					</plx:return>
				</plx:function>
				<plx:function name="Clone" visibility="public">
					<plx:leadingInfo>
						<plx:docComment>
							<summary>
ICloneable.Clone() Member, returns the Shallow Copy of this entity.
</summary>
						</plx:docComment>
					</plx:leadingInfo>
					<plx:interfaceMember memberName="Clone" dataTypeName="IEmployeePayHistory"/>
					<plx:interfaceMember memberName="Clone" dataTypeName="ICloneable" dataTypeQualifier="System"/>
					<plx:returns dataTypeName=".object"/>
					<plx:return>
						<plx:callThis name="Copy"/>
					</plx:return>
				</plx:function>
				<plx:function name="MakeCopyOf" visibility="public" modifier="static">
					<plx:leadingInfo>
						<plx:docComment>
							<summary>
Returns a deep copy of the child collection object passed in.
</summary>
						</plx:docComment>
					</plx:leadingInfo>
					<plx:param name="x" dataTypeName=".object"/>
					<plx:returns dataTypeName=".object"/>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="identityEquality">
								<plx:left>
									<plx:nameRef name="x" type="parameter"/>
								</plx:left>
								<plx:right>
									<plx:nullKeyword/>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:return>
							<plx:nullKeyword/>
						</plx:return>
					</plx:branch>
					<plx:branch>
						<plx:condition>
							<plx:unaryOperator type="booleanNot">
								<plx:binaryOperator type="typeEquality">
									<plx:left>
										<plx:nameRef name="x" type="parameter"/>
									</plx:left>
									<plx:right>
										<plx:directTypeReference dataTypeName="ICloneable" dataTypeQualifier="System"/>
									</plx:right>
								</plx:binaryOperator>
							</plx:unaryOperator>
						</plx:condition>
						<plx:throw>
							<plx:callNew dataTypeName="NotSupportedException" dataTypeQualifier="System">
								<plx:passParam>
									<plx:string>Object Does Not Implement the ICloneable Interface.</plx:string>
								</plx:passParam>
							</plx:callNew>
						</plx:throw>
					</plx:branch>
					<plx:return>
						<plx:callInstance name="Clone">
							<plx:callObject>
								<plx:cast dataTypeName="ICloneable" dataTypeQualifier="System">
									<plx:nameRef name="x" type="parameter"/>
								</plx:cast>
							</plx:callObject>
						</plx:callInstance>
					</plx:return>
				</plx:function>
				<plx:function name="DeepCopy" visibility="public" modifier="virtual">
					<plx:leadingInfo>
						<plx:docComment>
							<summary>
              Returns a Typed EmployeePayHistory Entity which is a deep copy of the current entity.
            </summary>
						</plx:docComment>
					</plx:leadingInfo>
					<plx:returns dataTypeName="EmployeePayHistory"/>
					<plx:return>
						<plx:callStatic name="Clone" dataTypeName="EntityHelper">
							<plx:passMemberTypeParam dataTypeName="EmployeePayHistory"/>
							<plx:passParam>
								<plx:cast type="testCast" dataTypeName="EmployeePayHistory">
									<plx:thisKeyword/>
								</plx:cast>
							</plx:passParam>
						</plx:callStatic>
					</plx:return>
				</plx:function>
				<plx:function name="Equals" visibility="public" modifier="virtual">
					<plx:leadingInfo>
						<plx:docComment>
							<summary>
Returns a value indicating whether this instance is equal to a specified object.
</summary>
							<param name="toObject">An object to compare to this instance.</param>
							<returns>true if toObject is a <see cref="Entities.{$entityClassName}Base" /> and has the same value as this instance; otherwise, false.</returns>
						</plx:docComment>
					</plx:leadingInfo>
					<plx:param name="toObject" dataTypeName="{$entityClassName}Base"/>
					<plx:returns dataTypeName=".boolean"/>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="identityEquality">
								<plx:left>
									<plx:nameRef name="toObject" type="parameter"/>
								</plx:left>
								<plx:right>
									<plx:nullKeyword/>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:return>
							<plx:falseKeyword/>
						</plx:return>
					</plx:branch>
					<plx:return>
						<plx:callStatic name="Equals" dataTypeName="{$entityClassName}Base">
							<plx:passParam>
								<plx:thisKeyword/>
							</plx:passParam>
							<plx:passParam>
								<plx:nameRef name="toObject" type="parameter"/>
							</plx:passParam>
						</plx:callStatic>
					</plx:return>
				</plx:function>
				<plx:function name="Equals" visibility="public" modifier="static">
					<plx:leadingInfo>
						<plx:docComment>
							<summary>
             Determines whether the specified <see cref="T:Tiers.AdventureWorks.Entities.EmployeePayHistoryBase" /> instances are considered equal.
            </summary>
							<param name="Object1">The first <see cref="T:Tiers.AdventureWorks.Entities.EmployeePayHistoryBase" /> to compare.</param>
							<param name="Object2">The second <see cref="T:Tiers.AdventureWorks.Entities.EmployeePayHistoryBase" /> to compare. </param>
							<returns>true if Object1 is the same instance as Object2 or if both are null references or if objA.Equals(objB) returns true; otherwise, false.</returns>
						</plx:docComment>
					</plx:leadingInfo>
					<plx:param name="Object1" dataTypeName="EmployeePayHistoryBase"/>
					<plx:param name="Object2" dataTypeName="EmployeePayHistoryBase"/>
					<plx:returns dataTypeName=".boolean"/>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="booleanAnd">
								<plx:left>
									<plx:binaryOperator type="identityEquality">
										<plx:left>
											<plx:nameRef name="Object1" type="parameter"/>
										</plx:left>
										<plx:right>
											<plx:nullKeyword/>
										</plx:right>
									</plx:binaryOperator>
								</plx:left>
								<plx:right>
									<plx:binaryOperator type="identityEquality">
										<plx:left>
											<plx:nameRef name="Object2" type="parameter"/>
										</plx:left>
										<plx:right>
											<plx:nullKeyword/>
										</plx:right>
									</plx:binaryOperator>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:return>
							<plx:trueKeyword/>
						</plx:return>
					</plx:branch>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="bitwiseExclusiveOr">
								<plx:left>
									<plx:binaryOperator type="identityEquality">
										<plx:left>
											<plx:nameRef name="Object1" type="parameter"/>
										</plx:left>
										<plx:right>
											<plx:nullKeyword/>
										</plx:right>
									</plx:binaryOperator>
								</plx:left>
								<plx:right>
									<plx:binaryOperator type="identityEquality">
										<plx:left>
											<plx:nameRef name="Object2" type="parameter"/>
										</plx:left>
										<plx:right>
											<plx:nullKeyword/>
										</plx:right>
									</plx:binaryOperator>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:return>
							<plx:falseKeyword/>
						</plx:return>
					</plx:branch>
					<plx:local name="equal" dataTypeName=".boolean">
						<plx:initialize>
							<plx:trueKeyword/>
						</plx:initialize>
					</plx:local>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="inequality">
								<plx:left>
									<plx:callInstance name="EmployeeId" type="property">
										<plx:callObject>
											<plx:nameRef name="Object1" type="parameter"/>
										</plx:callObject>
									</plx:callInstance>
								</plx:left>
								<plx:right>
									<plx:callInstance name="EmployeeId" type="property">
										<plx:callObject>
											<plx:nameRef name="Object2" type="parameter"/>
										</plx:callObject>
									</plx:callInstance>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:assign>
							<plx:left>
								<plx:nameRef name="equal"/>
							</plx:left>
							<plx:right>
								<plx:falseKeyword/>
							</plx:right>
						</plx:assign>
					</plx:branch>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="inequality">
								<plx:left>
									<plx:callInstance name="RateChangeDate" type="property">
										<plx:callObject>
											<plx:nameRef name="Object1" type="parameter"/>
										</plx:callObject>
									</plx:callInstance>
								</plx:left>
								<plx:right>
									<plx:callInstance name="RateChangeDate" type="property">
										<plx:callObject>
											<plx:nameRef name="Object2" type="parameter"/>
										</plx:callObject>
									</plx:callInstance>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:assign>
							<plx:left>
								<plx:nameRef name="equal"/>
							</plx:left>
							<plx:right>
								<plx:falseKeyword/>
							</plx:right>
						</plx:assign>
					</plx:branch>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="inequality">
								<plx:left>
									<plx:callInstance name="Rate" type="property">
										<plx:callObject>
											<plx:nameRef name="Object1" type="parameter"/>
										</plx:callObject>
									</plx:callInstance>
								</plx:left>
								<plx:right>
									<plx:callInstance name="Rate" type="property">
										<plx:callObject>
											<plx:nameRef name="Object2" type="parameter"/>
										</plx:callObject>
									</plx:callInstance>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:assign>
							<plx:left>
								<plx:nameRef name="equal"/>
							</plx:left>
							<plx:right>
								<plx:falseKeyword/>
							</plx:right>
						</plx:assign>
					</plx:branch>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="inequality">
								<plx:left>
									<plx:callInstance name="PayFrequency" type="property">
										<plx:callObject>
											<plx:nameRef name="Object1" type="parameter"/>
										</plx:callObject>
									</plx:callInstance>
								</plx:left>
								<plx:right>
									<plx:callInstance name="PayFrequency" type="property">
										<plx:callObject>
											<plx:nameRef name="Object2" type="parameter"/>
										</plx:callObject>
									</plx:callInstance>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:assign>
							<plx:left>
								<plx:nameRef name="equal"/>
							</plx:left>
							<plx:right>
								<plx:falseKeyword/>
							</plx:right>
						</plx:assign>
					</plx:branch>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="inequality">
								<plx:left>
									<plx:callInstance name="ModifiedDate" type="property">
										<plx:callObject>
											<plx:nameRef name="Object1" type="parameter"/>
										</plx:callObject>
									</plx:callInstance>
								</plx:left>
								<plx:right>
									<plx:callInstance name="ModifiedDate" type="property">
										<plx:callObject>
											<plx:nameRef name="Object2" type="parameter"/>
										</plx:callObject>
									</plx:callInstance>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:assign>
							<plx:left>
								<plx:nameRef name="equal"/>
							</plx:left>
							<plx:right>
								<plx:falseKeyword/>
							</plx:right>
						</plx:assign>
					</plx:branch>
					<plx:return>
						<plx:nameRef name="equal"/>
					</plx:return>
				</plx:function>
				<plx:function name="CompareTo" visibility="public" modifier="virtual">
					<plx:leadingInfo>
						<plx:docComment>
							<summary>
Compares this instance to a specified object and returns an indication of their relative values.
<param name="obj">An object to compare to this instance, or a null reference (Nothing in Visual Basic).</param>
</summary>
							<returns>A signed integer that indicates the relative order of this instance and obj.</returns>
						</plx:docComment>
					</plx:leadingInfo>
					<plx:interfaceMember memberName="CompareTo" dataTypeName="IComparable" dataTypeQualifier="System"/>
					<plx:param name="obj" dataTypeName=".object"/>
					<plx:returns dataTypeName=".i4"/>
					<plx:throw>
						<plx:callNew dataTypeName="NotImplementedException" dataTypeQualifier="System"/>
					</plx:throw>
				</plx:function>

				<!-- IComponent Members -->
				<plx:field name="_site" visibility="private" dataTypeName="ISite" dataTypeQualifier="System.ComponentModel"/>
				<plx:property name="Site" visibility="public">
					<plx:leadingInfo>
						<plx:docComment>
							<summary>
Gets or sets the site where this data is located.
</summary>
						</plx:docComment>
					</plx:leadingInfo>
					<plx:attribute dataTypeName="XmlIgnore"/>
					<plx:attribute dataTypeName="SoapIgnore"/>
					<plx:attribute dataTypeName="Browsable">
						<plx:passParam>
							<plx:falseKeyword/>
						</plx:passParam>
					</plx:attribute>
					<plx:returns dataTypeName="ISite"/>
					<plx:get>
						<plx:return>
							<plx:callThis name="_site" type="field"/>
						</plx:return>
					</plx:get>
					<plx:set>
						<plx:assign>
							<plx:left>
								<plx:callThis name="_site" type="field"/>
							</plx:left>
							<plx:right>
								<plx:nameRef name="value" type="parameter"/>
							</plx:right>
						</plx:assign>
					</plx:set>
				</plx:property>

				<!-- IDisposable Members -->
				<plx:event name="Disposed" visibility="public">
					<plx:leadingInfo>
						<plx:docComment>
							<summary>
            Notify those that care when we dispose.
            </summary>
						</plx:docComment>
					</plx:leadingInfo>
					<plx:attribute type="implicitField" dataTypeName="NonSerializedAttribute" dataTypeQualifier="System"/>
					<plx:attribute type="implicitAccessorFunction" dataTypeName="MethodImplAttribute" dataTypeQualifier="System.Runtime.CompilerServices">
						<plx:passParam>
							<plx:callStatic name="Synchronized" type="field" dataTypeName="MethodImplOptions" dataTypeQualifier="System.Runtime.CompilerServices"/>
						</plx:passParam>
					</plx:attribute>
					<plx:param name="sender" dataTypeName=".object"/>
					<plx:param name="e" dataTypeName="EventArgs" dataTypeQualifier="System"/>
					<plx:explicitDelegateType dataTypeName="EventHandler" dataTypeQualifier="System"/>
				</plx:event>
				<plx:function name="Dispose" visibility="public">
					<plx:leadingInfo>
						<plx:docComment>
							<summary>
Clean up. Nothing here though.
</summary>
						</plx:docComment>
					</plx:leadingInfo>
					<plx:interfaceMember memberName="Dispose" dataTypeName="IDisposable" dataTypeQualifier="System"/>
					<plx:assign>
						<plx:left>
							<plx:callThis name="parentCollection" type="field"/>
						</plx:left>
						<plx:right>
							<plx:nullKeyword/>
						</plx:right>
					</plx:assign>
					<plx:callThis name="Dispose">
						<plx:passParam>
							<plx:trueKeyword/>
						</plx:passParam>
					</plx:callThis>
					<plx:callStatic name="SuppressFinalize" dataTypeName="GC" dataTypeQualifier="System">
						<plx:passParam>
							<plx:thisKeyword/>
						</plx:passParam>
					</plx:callStatic>
				</plx:function>
				<plx:function name="Dispose" visibility="protected" modifier="virtual">
					<plx:leadingInfo>
						<plx:docComment>
							<summary>
            Clean up.
            </summary>
						</plx:docComment>
					</plx:leadingInfo>
					<plx:param name="disposing" dataTypeName=".boolean"/>
					<plx:branch>
						<plx:condition>
							<plx:nameRef name="disposing" type="parameter"/>
						</plx:condition>
						<plx:local name="handler" dataTypeName="EventHandler" dataTypeQualifier="System">
							<plx:initialize>
								<plx:callThis name="Disposed" type="field"/>
							</plx:initialize>
						</plx:local>
						<plx:branch>
							<plx:condition>
								<plx:binaryOperator type="identityInequality">
									<plx:left>
										<plx:nameRef name="handler"/>
									</plx:left>
									<plx:right>
										<plx:nullKeyword/>
									</plx:right>
								</plx:binaryOperator>
							</plx:condition>
							<plx:callInstance name=".implied" type="delegateCall">
								<plx:callObject>
									<plx:nameRef name="handler"/>
								</plx:callObject>
								<plx:passParam>
									<plx:thisKeyword/>
								</plx:passParam>
								<plx:passParam>
									<plx:callStatic name="Empty" type="field" dataTypeName="EventArgs" dataTypeQualifier="System"/>
								</plx:passParam>
							</plx:callInstance>
						</plx:branch>
					</plx:branch>
				</plx:function>

				<!-- TODO: IEntityKey<<%= keyClassName %>> Members -->
				<plx:field name="_entityId" visibility="private" dataTypeName="{$entityClassName}Key"/>
				<plx:property name="EntityId" visibility="public">
					<plx:leadingInfo>
						<plx:docComment>
							<summary>
Gets or sets the site where this data is located.
</summary>
						</plx:docComment>
					</plx:leadingInfo>
					<plx:attribute dataTypeName="XmlIgnore"/>
					<plx:returns dataTypeName="{$entityClassName}Key"/>
					<plx:get>
						<plx:branch>
							<plx:condition>
								<plx:binaryOperator type="identityEquality">
									<plx:left>
										<plx:callThis name="_entityId" type="field"/>
									</plx:left>
									<plx:right>
										<plx:nullKeyword/>
									</plx:right>
								</plx:binaryOperator>
							</plx:condition>
							<plx:assign>
								<plx:left>
									<plx:callThis name="_entityId" type="field"/>
								</plx:left>
								<plx:right>
									<plx:callNew dataTypeName="{$entityClassName}Key">
										<plx:passParam>
											<plx:thisKeyword/>
										</plx:passParam>
									</plx:callNew>
								</plx:right>
							</plx:assign>
						</plx:branch>
						<plx:return>
							<plx:callThis name="_entityId" type="field"/>
						</plx:return>
					</plx:get>
					<plx:set>
						<plx:branch>
							<plx:condition>
								<plx:binaryOperator type="identityInequality">
									<plx:left>
										<plx:nameRef name="value"/>
									</plx:left>
									<plx:right>
										<plx:nullKeyword/>
									</plx:right>
								</plx:binaryOperator>
							</plx:condition>
							<plx:assign>
								<plx:left>
									<plx:callThis name="_entityId" type="field"/>
								</plx:left>
								<plx:right>
									<plx:thisKeyword/>
								</plx:right>
							</plx:assign>
						</plx:branch>
					</plx:set>
				</plx:property>

				<!-- TODO: EntityTrackingKey -->

				<!-- TODO: ToString Method -->
				<plx:function name="ToString" visibility="public" modifier="override">
					<plx:leadingInfo>
						<plx:docComment>
							<summary>
             Returns a String that represents the current object.
            </summary>
						</plx:docComment>
					</plx:leadingInfo>
					<plx:returns dataTypeName=".string"/>
					<plx:return>
						<plx:callStatic name="Format" dataTypeName=".string">
							<plx:passParam>
								<plx:callStatic name="InvariantCulture" type="property" dataTypeName="CultureInfo" dataTypeQualifier="System.Globalization"/>
							</plx:passParam>
							<plx:passParam>
								<plx:string>{6}{5}- EmployeeId: {0}{5}- RateChangeDate: {1}{5}- Rate: {2}{5}- PayFrequency: {3}{5}- ModifiedDate: {4}{5}</plx:string>
							</plx:passParam>
							<plx:passParamArray dataTypeIsSimpleArray="true" dataTypeName=".object">
								<plx:passParam>
									<plx:callThis name="EmployeeId" type="property"/>
								</plx:passParam>
								<plx:passParam>
									<plx:callThis name="RateChangeDate" type="property"/>
								</plx:passParam>
								<plx:passParam>
									<plx:callThis name="Rate" type="property"/>
								</plx:passParam>
								<plx:passParam>
									<plx:callThis name="PayFrequency" type="property"/>
								</plx:passParam>
								<plx:passParam>
									<plx:callThis name="ModifiedDate" type="property"/>
								</plx:passParam>
								<plx:passParam>
									<plx:callStatic name="NewLine" type="property" dataTypeName="Environment" dataTypeQualifier="System"/>
								</plx:passParam>
								<plx:passParam>
									<plx:callThis name="GetType" accessor="base"/>
								</plx:passParam>
							</plx:passParamArray>
						</plx:callStatic>
					</plx:return>
				</plx:function>

				<!-- TODO: Inner data class -->

				<!-- TODO: Validation -->
				<plx:function name="AddValidationRules" visibility="protected" modifier="override">
					<plx:leadingInfo>
						<plx:docComment>
							<summary>
Assigns validation rules to this object based on model definition.
</summary>
							<remarks>This method overrides the base class to add schema related validation.</remarks>
						</plx:docComment>
					</plx:leadingInfo>
				</plx:function>

				<!-- ??? -->
				<plx:function name="Equals" visibility="public" modifier="override">
					<plx:leadingInfo>
						<plx:docComment>
							<summary>
             Returns a value indicating whether this instance is equal to a specified object.
            </summary>
							<param name="Object1">An object to compare to this instance.</param>
							<returns>true if Object1 is a <see cref="T:Tiers.AdventureWorks.Entities.EmployeePayHistoryBase" /> and has the same value as this instance; otherwise, false.</returns>
						</plx:docComment>
					</plx:leadingInfo>
					<plx:param name="Object1" dataTypeName=".object"/>
					<plx:returns dataTypeName=".boolean"/>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="typeEquality">
								<plx:left>
									<plx:nameRef name="Object1" type="parameter"/>
								</plx:left>
								<plx:right>
									<plx:directTypeReference dataTypeName="EmployeePayHistoryBase"/>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:return>
							<plx:callStatic name="Equals" dataTypeName="EmployeePayHistoryBase">
								<plx:passParam>
									<plx:thisKeyword/>
								</plx:passParam>
								<plx:passParam>
									<plx:cast dataTypeName="EmployeePayHistoryBase">
										<plx:nameRef name="Object1" type="parameter"/>
									</plx:cast>
								</plx:passParam>
							</plx:callStatic>
						</plx:return>
					</plx:branch>
					<plx:return>
						<plx:falseKeyword/>
					</plx:return>
				</plx:function>
				<plx:function name="GetHashCode" visibility="public" modifier="override">
					<plx:leadingInfo>
						<plx:docComment>
							<summary>
            Serves as a hash function for a particular type, suitable for use in hashing algorithms and data structures like a hash table.
            Provides a hash function that is appropriate for <see cref="T:Tiers.AdventureWorks.Entities.EmployeePayHistoryBase" /> class 
            and that ensures a better distribution in the hash table
            </summary>
							<returns>number (hash code) that corresponds to the value of an object</returns>
						</plx:docComment>
					</plx:leadingInfo>
					<plx:returns dataTypeName=".i4"/>
					<plx:return>
						<plx:binaryOperator type="bitwiseExclusiveOr">
							<plx:left>
								<plx:binaryOperator type="bitwiseExclusiveOr">
									<plx:left>
										<plx:binaryOperator type="bitwiseExclusiveOr">
											<plx:left>
												<plx:binaryOperator type="bitwiseExclusiveOr">
													<plx:left>
														<plx:callInstance name="GetHashCode">
															<plx:callObject>
																<plx:callThis name="EmployeeId" type="property"/>
															</plx:callObject>
														</plx:callInstance>
													</plx:left>
													<plx:right>
														<plx:callInstance name="GetHashCode">
															<plx:callObject>
																<plx:callThis name="RateChangeDate" type="property"/>
															</plx:callObject>
														</plx:callInstance>
													</plx:right>
												</plx:binaryOperator>
											</plx:left>
											<plx:right>
												<plx:callInstance name="GetHashCode">
													<plx:callObject>
														<plx:callThis name="Rate" type="property"/>
													</plx:callObject>
												</plx:callInstance>
											</plx:right>
										</plx:binaryOperator>
									</plx:left>
									<plx:right>
										<plx:callInstance name="GetHashCode">
											<plx:callObject>
												<plx:callThis name="PayFrequency" type="property"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:right>
								</plx:binaryOperator>
							</plx:left>
							<plx:right>
								<plx:callInstance name="GetHashCode">
									<plx:callObject>
										<plx:callThis name="ModifiedDate" type="property"/>
									</plx:callObject>
								</plx:callInstance>
							</plx:right>
						</plx:binaryOperator>
					</plx:return>
				</plx:function>
				<plx:class name="EmployeePayHistoryEntityData" visibility="protectedOrInternal">
					<plx:leadingInfo>
						<plx:docComment>
							<summary>
            	The data structure representation of the 'EmployeePayHistory' table.
            </summary>
							<remarks>
            	This struct is generated by a tool and should never be modified.
            </remarks>
						</plx:docComment>
					</plx:leadingInfo>
					<plx:attribute dataTypeName="SerializableAttribute" dataTypeQualifier="System"/>
					<plx:attribute dataTypeName="EditorBrowsableAttribute" dataTypeQualifier="System.ComponentModel">
						<plx:passParam>
							<plx:value data="1" type="i4"/>
						</plx:passParam>
					</plx:attribute>
					<plx:implementsInterface dataTypeName="ICloneable" dataTypeQualifier="System"/>
					<plx:field name="currentEntityState" visibility="private" dataTypeName="EntityState"/>
					<plx:field name="EmployeeId" visibility="public" dataTypeName=".i4">
						<plx:leadingInfo>
							<plx:docComment>
								<summary>			
            EmployeeID : Employee identification number. Foreign key to Employee.EmployeeID.
            </summary>
								<remarks>Member of the primary key of the underlying table "EmployeePayHistory"</remarks>
							</plx:docComment>
						</plx:leadingInfo>
					</plx:field>
					<plx:field name="OriginalEmployeeId" visibility="public" dataTypeName=".i4">
						<plx:leadingInfo>
							<plx:docComment>
								<summary>
            keep a copy of the original so it can be used for editable primary keys.
            </summary>
							</plx:docComment>
						</plx:leadingInfo>
					</plx:field>
					<plx:field name="RateChangeDate" visibility="public" dataTypeName=".date">
						<plx:leadingInfo>
							<plx:docComment>
								<summary>			
            RateChangeDate : Date the change in pay is effective
            </summary>
								<remarks>Member of the primary key of the underlying table "EmployeePayHistory"</remarks>
							</plx:docComment>
						</plx:leadingInfo>
					</plx:field>
					<plx:field name="OriginalRateChangeDate" visibility="public" dataTypeName=".date">
						<plx:leadingInfo>
							<plx:docComment>
								<summary>
            keep a copy of the original so it can be used for editable primary keys.
            </summary>
							</plx:docComment>
						</plx:leadingInfo>
					</plx:field>
					<plx:field name="Rate" visibility="public" dataTypeName=".decimal">
						<plx:leadingInfo>
							<plx:docComment>
								<summary>
            Rate : Salary hourly rate.
            </summary>
							</plx:docComment>
						</plx:leadingInfo>
					</plx:field>
					<plx:field name="PayFrequency" visibility="public" dataTypeName=".u1">
						<plx:leadingInfo>
							<plx:docComment>
								<summary>
            PayFrequency : 1 = Salary received monthly, 2 = Salary received biweekly
            </summary>
							</plx:docComment>
						</plx:leadingInfo>
					</plx:field>
					<plx:field name="ModifiedDate" visibility="public" dataTypeName=".date">
						<plx:leadingInfo>
							<plx:docComment>
								<summary>
            ModifiedDate : Date and time the record was last updated.
            </summary>
							</plx:docComment>
						</plx:leadingInfo>
					</plx:field>
					<plx:field name="_employeeIdSource" visibility="private" dataTypeName="Employee"/>
					<plx:property name="EmployeeIdSource" visibility="public" modifier="virtual">
						<plx:leadingInfo>
							<plx:docComment>
								<summary>
            Gets or sets the source <see cref="T:Tiers.AdventureWorks.Entities.Employee" />.
            </summary>
								<value>The source Employee for EmployeeId.</value>
							</plx:docComment>
						</plx:leadingInfo>
						<plx:attribute dataTypeName="XmlIgnoreAttribute" dataTypeQualifier="System.Xml.Serialization"/>
						<plx:attribute dataTypeName="BrowsableAttribute" dataTypeQualifier="System.ComponentModel">
							<plx:passParam>
								<plx:falseKeyword/>
							</plx:passParam>
						</plx:attribute>
						<plx:returns dataTypeName="Employee"/>
						<plx:get>
							<plx:return>
								<plx:callThis name="_employeeIdSource" type="field"/>
							</plx:return>
						</plx:get>
						<plx:set>
							<plx:assign>
								<plx:left>
									<plx:callThis name="_employeeIdSource" type="field"/>
								</plx:left>
								<plx:right>
									<plx:nameRef name="value" type="parameter"/>
								</plx:right>
							</plx:assign>
						</plx:set>
					</plx:property>
					<plx:property name="EntityState" visibility="public">
						<plx:leadingInfo>
							<plx:docComment>
								<summary>
            	Indicates state of object
            </summary>
								<remarks>0=Unchanged, 1=Added, 2=Changed</remarks>
							</plx:docComment>
						</plx:leadingInfo>
						<plx:attribute dataTypeName="BrowsableAttribute" dataTypeQualifier="System.ComponentModel">
							<plx:passParam>
								<plx:falseKeyword/>
							</plx:passParam>
						</plx:attribute>
						<plx:attribute dataTypeName="XmlIgnoreAttribute" dataTypeQualifier="System.Xml.Serialization"/>
						<plx:returns dataTypeName="EntityState"/>
						<plx:get>
							<plx:return>
								<plx:callThis name="currentEntityState" type="field"/>
							</plx:return>
						</plx:get>
						<plx:set>
							<plx:assign>
								<plx:left>
									<plx:callThis name="currentEntityState" type="field"/>
								</plx:left>
								<plx:right>
									<plx:nameRef name="value" type="parameter"/>
								</plx:right>
							</plx:assign>
						</plx:set>
					</plx:property>
					<plx:function name="Clone" visibility="public">
						<plx:leadingInfo>
							<plx:docComment>
								<summary>
            Creates a new object that is a copy of the current instance.
            </summary>
								<returns>A new object that is a copy of this instance.</returns>
							</plx:docComment>
						</plx:leadingInfo>
						<plx:interfaceMember memberName="Clone" dataTypeName="ICloneable" dataTypeQualifier="System"/>
						<plx:returns dataTypeName=".object"/>
						<plx:local name="_tmp" dataTypeName="EmployeePayHistoryEntityData" dataTypeQualifier="EmployeePayHistoryBase">
							<plx:initialize>
								<plx:callNew dataTypeName="EmployeePayHistoryEntityData" dataTypeQualifier="EmployeePayHistoryBase"/>
							</plx:initialize>
						</plx:local>
						<plx:assign>
							<plx:left>
								<plx:callInstance name="EmployeeId" type="field">
									<plx:callObject>
										<plx:nameRef name="_tmp"/>
									</plx:callObject>
								</plx:callInstance>
							</plx:left>
							<plx:right>
								<plx:callThis name="EmployeeId" type="field"/>
							</plx:right>
						</plx:assign>
						<plx:assign>
							<plx:left>
								<plx:callInstance name="OriginalEmployeeId" type="field">
									<plx:callObject>
										<plx:nameRef name="_tmp"/>
									</plx:callObject>
								</plx:callInstance>
							</plx:left>
							<plx:right>
								<plx:callThis name="OriginalEmployeeId" type="field"/>
							</plx:right>
						</plx:assign>
						<plx:assign>
							<plx:left>
								<plx:callInstance name="RateChangeDate" type="field">
									<plx:callObject>
										<plx:nameRef name="_tmp"/>
									</plx:callObject>
								</plx:callInstance>
							</plx:left>
							<plx:right>
								<plx:callThis name="RateChangeDate" type="field"/>
							</plx:right>
						</plx:assign>
						<plx:assign>
							<plx:left>
								<plx:callInstance name="OriginalRateChangeDate" type="field">
									<plx:callObject>
										<plx:nameRef name="_tmp"/>
									</plx:callObject>
								</plx:callInstance>
							</plx:left>
							<plx:right>
								<plx:callThis name="OriginalRateChangeDate" type="field"/>
							</plx:right>
						</plx:assign>
						<plx:assign>
							<plx:left>
								<plx:callInstance name="Rate" type="field">
									<plx:callObject>
										<plx:nameRef name="_tmp"/>
									</plx:callObject>
								</plx:callInstance>
							</plx:left>
							<plx:right>
								<plx:callThis name="Rate" type="field"/>
							</plx:right>
						</plx:assign>
						<plx:assign>
							<plx:left>
								<plx:callInstance name="PayFrequency" type="field">
									<plx:callObject>
										<plx:nameRef name="_tmp"/>
									</plx:callObject>
								</plx:callInstance>
							</plx:left>
							<plx:right>
								<plx:callThis name="PayFrequency" type="field"/>
							</plx:right>
						</plx:assign>
						<plx:assign>
							<plx:left>
								<plx:callInstance name="ModifiedDate" type="field">
									<plx:callObject>
										<plx:nameRef name="_tmp"/>
									</plx:callObject>
								</plx:callInstance>
							</plx:left>
							<plx:right>
								<plx:callThis name="ModifiedDate" type="field"/>
							</plx:right>
						</plx:assign>
						<plx:branch>
							<plx:condition>
								<plx:binaryOperator type="identityInequality">
									<plx:left>
										<plx:callThis name="EmployeeIdSource" type="property"/>
									</plx:left>
									<plx:right>
										<plx:nullKeyword/>
									</plx:right>
								</plx:binaryOperator>
							</plx:condition>
							<plx:assign>
								<plx:left>
									<plx:callInstance name="EmployeeIdSource" type="property">
										<plx:callObject>
											<plx:nameRef name="_tmp"/>
										</plx:callObject>
									</plx:callInstance>
								</plx:left>
								<plx:right>
									<plx:cast type="testCast" dataTypeName="Employee">
										<plx:callStatic name="MakeCopyOf" dataTypeName="EmployeePayHistoryBase">
											<plx:passParam>
												<plx:callThis name="EmployeeIdSource" type="property"/>
											</plx:passParam>
										</plx:callStatic>
									</plx:cast>
								</plx:right>
							</plx:assign>
						</plx:branch>
						<plx:assign>
							<plx:left>
								<plx:callInstance name="EntityState" type="property">
									<plx:callObject>
										<plx:nameRef name="_tmp"/>
									</plx:callObject>
								</plx:callInstance>
							</plx:left>
							<plx:right>
								<plx:callThis name="EntityState" type="property"/>
							</plx:right>
						</plx:assign>
						<plx:return>
							<plx:nameRef name="_tmp"/>
						</plx:return>
					</plx:function>
					<plx:function name=".construct" visibility="public">
						<plx:assign>
							<plx:left>
								<plx:callThis name="currentEntityState" type="field"/>
							</plx:left>
							<plx:right>
								<plx:callStatic name="Added" type="field" dataTypeName="EntityState"/>
							</plx:right>
						</plx:assign>
						<plx:assign>
							<plx:left>
								<plx:callThis name="Rate" type="field"/>
							</plx:left>
							<plx:right>
								<plx:value data="0" type="decimal"/>
							</plx:right>
						</plx:assign>
						<plx:assign>
							<plx:left>
								<plx:callThis name="PayFrequency" type="field"/>
							</plx:left>
							<plx:right>
								<plx:value data="0" type="i4"/>
							</plx:right>
						</plx:assign>
						<plx:assign>
							<plx:left>
								<plx:callThis name="ModifiedDate" type="field"/>
							</plx:left>
							<plx:right>
								<plx:callStatic name="MinValue" type="field" dataTypeName=".date"/>
							</plx:right>
						</plx:assign>
						<plx:assign>
							<plx:left>
								<plx:callThis name="_employeeIdSource" type="field"/>
							</plx:left>
							<plx:right>
								<plx:nullKeyword/>
							</plx:right>
						</plx:assign>
					</plx:function>
				</plx:class>

			</plx:class>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="EntityInstance">
		<xsl:for-each select="se:databaseSchema/se:tables/se:table">
			<xsl:variable name="entityClassName" select="csc:GetClassNameForTable(@owner, @name, '')"/>
			<plx:class name="{$entityClassName}" visibility="public" partial="true">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
An object representation of the <xsl:value-of select="$entityClassName"/> table. 	
</summary>
						<remarks>
This file is generated once and will never be overwritten.
</remarks>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:attribute dataTypeName="SerializableAttribute" dataTypeQualifier="System"/>
				<plx:attribute dataTypeName="CLSCompliantAttribute" dataTypeQualifier="System">
					<plx:passParam>
						<plx:trueKeyword/>
					</plx:passParam>
				</plx:attribute>
				<plx:derivesFromClass dataTypeName="{$entityClassName}Base"/>
				<plx:function name=".construct" visibility="public">
					<plx:leadingInfo>
						<plx:docComment>
							<summary>
Creates a new <see cref="Entities.{$entityClassName}" /> instance.
</summary>
						</plx:docComment>
					</plx:leadingInfo>
				</plx:function>
			</plx:class>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="EntityHelper">
		<plx:class name="EntityHelper" visibility="public" modifier="static" partial="true">
			<plx:leadingInfo>
				<plx:docComment>
					<summary>
This classes contains utilities functions for the <see cref="Entities.IEntity" /> instances and collections.
</summary>
					<remarks>All methods static</remarks>
				</plx:docComment>
			</plx:leadingInfo>
			<plx:function name="SerializeBinary" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Serializes the entity to binary.
</summary>
						<param name="entity">The Entity to serialize.</param>
						<value>A byte array that contains the serialized entity.</value>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="entity" dataTypeName="IEntity"/>
				<plx:returns dataTypeIsSimpleArray="true" dataTypeName=".u1"/>
				<plx:local name="ms" dataTypeName="MemoryStream" dataTypeQualifier="System.IO">
					<plx:initialize>
						<plx:callNew dataTypeName="MemoryStream" dataTypeQualifier="System.IO"/>
					</plx:initialize>
				</plx:local>
				<plx:callInstance name="Serialize">
					<plx:callObject>
						<plx:callNew dataTypeName="BinaryFormatter" dataTypeQualifier="System.Runtime.Serialization.Formatters.Binary"/>
					</plx:callObject>
					<plx:passParam>
						<plx:nameRef name="ms"/>
					</plx:passParam>
					<plx:passParam>
						<plx:nameRef name="entity" type="parameter"/>
					</plx:passParam>
				</plx:callInstance>
				<plx:return>
					<plx:callInstance name="ToArray">
						<plx:callObject>
							<plx:nameRef name="ms"/>
						</plx:callObject>
					</plx:callInstance>
				</plx:return>
			</plx:function>
			<plx:function name="SerializeBinary" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Serializes the entity collection to binary.
</summary>
						<param name="entityCollection">The Entity collection to serialize.</param>
						<value>A byte array that contains the serialized entity.</value>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="entityCollection" dataTypeName="IList" dataTypeQualifier="System.Collections"/>
				<plx:returns dataTypeIsSimpleArray="true" dataTypeName=".u1"/>
				<plx:local name="ms" dataTypeName="MemoryStream" dataTypeQualifier="System.IO">
					<plx:initialize>
						<plx:callNew dataTypeName="MemoryStream" dataTypeQualifier="System.IO"/>
					</plx:initialize>
				</plx:local>
				<plx:callInstance name="Serialize">
					<plx:callObject>
						<plx:callNew dataTypeName="BinaryFormatter" dataTypeQualifier="System.Runtime.Serialization.Formatters.Binary"/>
					</plx:callObject>
					<plx:passParam>
						<plx:nameRef name="ms"/>
					</plx:passParam>
					<plx:passParam>
						<plx:nameRef name="entityCollection" type="parameter"/>
					</plx:passParam>
				</plx:callInstance>
				<plx:return>
					<plx:callInstance name="ToArray">
						<plx:callObject>
							<plx:nameRef name="ms"/>
						</plx:callObject>
					</plx:callInstance>
				</plx:return>
			</plx:function>
			<plx:function name="SerializeBinary" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Serializes the entity to binary and puts the data into a file.
</summary>
						<param name="entity">The Entity to serialize.</param>
						<param name="path">The Path to the destination file.</param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="entity" dataTypeName="IEntity"/>
				<plx:param name="path" dataTypeName=".string"/>
				<plx:local name="fs" dataTypeName="FileStream" dataTypeQualifier="System.IO">
					<plx:initialize>
						<plx:callNew dataTypeName="FileStream" dataTypeQualifier="System.IO">
							<plx:passParam>
								<plx:nameRef name="path" type="parameter"/>
							</plx:passParam>
							<plx:passParam>
								<plx:callStatic name="OpenOrCreate" type="field" dataTypeName="FileMode" dataTypeQualifier="System.IO"/>
							</plx:passParam>
						</plx:callNew>
					</plx:initialize>
				</plx:local>
				<plx:callInstance name="Serialize">
					<plx:callObject>
						<plx:callNew dataTypeName="BinaryFormatter" dataTypeQualifier="System.Runtime.Serialization.Formatters.Binary"/>
					</plx:callObject>
					<plx:passParam>
						<plx:nameRef name="fs"/>
					</plx:passParam>
					<plx:passParam>
						<plx:nameRef name="entity" type="parameter"/>
					</plx:passParam>
				</plx:callInstance>
				<plx:callInstance name="Close">
					<plx:callObject>
						<plx:nameRef name="fs"/>
					</plx:callObject>
				</plx:callInstance>
			</plx:function>
			<plx:function name="SerializeBinary" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Serializes the entity collection to binary and puts the data into a file.
</summary>
						<param name="entityCollection">The Entity collection to serialize.</param>
						<param name="path">The Path to the destination file.</param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="entityCollection" dataTypeName="IList" dataTypeQualifier="System.Collections"/>
				<plx:param name="path" dataTypeName=".string"/>
				<plx:local name="fs" dataTypeName="FileStream" dataTypeQualifier="System.IO">
					<plx:initialize>
						<plx:callNew dataTypeName="FileStream" dataTypeQualifier="System.IO">
							<plx:passParam>
								<plx:nameRef name="path" type="parameter"/>
							</plx:passParam>
							<plx:passParam>
								<plx:callStatic name="OpenOrCreate" type="field" dataTypeName="FileMode" dataTypeQualifier="System.IO"/>
							</plx:passParam>
						</plx:callNew>
					</plx:initialize>
				</plx:local>
				<plx:callInstance name="Serialize">
					<plx:callObject>
						<plx:callNew dataTypeName="BinaryFormatter" dataTypeQualifier="System.Runtime.Serialization.Formatters.Binary"/>
					</plx:callObject>
					<plx:passParam>
						<plx:nameRef name="fs"/>
					</plx:passParam>
					<plx:passParam>
						<plx:nameRef name="entityCollection" type="parameter"/>
					</plx:passParam>
				</plx:callInstance>
				<plx:callInstance name="Close">
					<plx:callObject>
						<plx:nameRef name="fs"/>
					</plx:callObject>
				</plx:callInstance>
			</plx:function>
			<plx:function name="XmlSerialize" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Serialize an object to xml.
</summary>
						<param name="item">The item to serialize.</param>
						<returns></returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:typeParam name="T"/>
				<plx:param name="item" dataTypeName="T"/>
				<plx:returns dataTypeName=".string"/>
				<plx:local name="s" dataTypeName="XmlSerializer" dataTypeQualifier="System.Xml.Serialization">
					<plx:initialize>
						<plx:callNew dataTypeName="XmlSerializer" dataTypeQualifier="System.Xml.Serialization">
							<plx:passParam>
								<plx:typeOf dataTypeName="T"/>
							</plx:passParam>
						</plx:callNew>
					</plx:initialize>
				</plx:local>
				<plx:local name="stringBuilder" dataTypeName="StringBuilder" dataTypeQualifier="System.Text">
					<plx:initialize>
						<plx:callNew dataTypeName="StringBuilder" dataTypeQualifier="System.Text"/>
					</plx:initialize>
				</plx:local>
				<plx:local name="writer" dataTypeName="StringWriter" dataTypeQualifier="System.IO">
					<plx:initialize>
						<plx:callNew dataTypeName="StringWriter" dataTypeQualifier="System.IO">
							<plx:passParam>
								<plx:nameRef name="stringBuilder"/>
							</plx:passParam>
						</plx:callNew>
					</plx:initialize>
				</plx:local>
				<plx:callInstance name="Serialize">
					<plx:callObject>
						<plx:nameRef name="s"/>
					</plx:callObject>
					<plx:passParam>
						<plx:cast dataTypeName="TextWriter" dataTypeQualifier="System.IO">
							<plx:nameRef name="writer"/>
						</plx:cast>
					</plx:passParam>
					<plx:passParam>
						<plx:nameRef name="item" type="parameter"/>
					</plx:passParam>
				</plx:callInstance>
				<plx:callInstance name="Close">
					<plx:callObject>
						<plx:nameRef name="writer"/>
					</plx:callObject>
				</plx:callInstance>
				<plx:return>
					<plx:callInstance name="ToString">
						<plx:callObject>
							<plx:nameRef name="stringBuilder"/>
						</plx:callObject>
					</plx:callInstance>
				</plx:return>
			</plx:function>
			<plx:function name="SerializeXml" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Serializes the entity to Xml.
</summary>
						<param name="entity">The Entity to serialize.</param>
						<returns>A string that contains the serialized entity.</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="entity" dataTypeName="IEntity"/>
				<plx:returns dataTypeName=".string"/>
				<plx:local name="ser" dataTypeName="XmlSerializer" dataTypeQualifier="System.Xml.Serialization">
					<plx:initialize>
						<plx:callNew dataTypeName="XmlSerializer" dataTypeQualifier="System.Xml.Serialization">
							<plx:passParam>
								<plx:callInstance name="GetType">
									<plx:callObject>
										<plx:nameRef name="entity" type="parameter"/>
									</plx:callObject>
								</plx:callInstance>
							</plx:passParam>
						</plx:callNew>
					</plx:initialize>
				</plx:local>
				<plx:local name="sb" dataTypeName="StringBuilder" dataTypeQualifier="System.Text">
					<plx:initialize>
						<plx:callNew dataTypeName="StringBuilder" dataTypeQualifier="System.Text"/>
					</plx:initialize>
				</plx:local>
				<plx:local name="writer" dataTypeName="TextWriter" dataTypeQualifier="System.IO">
					<plx:initialize>
						<plx:callNew dataTypeName="StringWriter" dataTypeQualifier="System.IO">
							<plx:passParam>
								<plx:nameRef name="sb"/>
							</plx:passParam>
						</plx:callNew>
					</plx:initialize>
				</plx:local>
				<plx:callInstance name="Serialize">
					<plx:callObject>
						<plx:nameRef name="ser"/>
					</plx:callObject>
					<plx:passParam>
						<plx:nameRef name="writer"/>
					</plx:passParam>
					<plx:passParam>
						<plx:nameRef name="entity" type="parameter"/>
					</plx:passParam>
				</plx:callInstance>
				<plx:callInstance name="Close">
					<plx:callObject>
						<plx:nameRef name="writer"/>
					</plx:callObject>
				</plx:callInstance>
				<plx:return>
					<plx:callInstance name="ToString">
						<plx:callObject>
							<plx:nameRef name="sb"/>
						</plx:callObject>
					</plx:callInstance>
				</plx:return>
			</plx:function>
			<plx:function name="SerializeXml" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Serializes the <see cref="T:TList{T}" /> of IEntity to XML
</summary>
						<typeparam name="T">type to return, type must implement IEntity</typeparam>
						<param name="entityCollection">TList of T type to return</param>
						<returns>string of serialized XML</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:typeParam name="T" requireDefaultConstructor="true">
					<plx:typeConstraint dataTypeName="IEntity"/>
				</plx:typeParam>
				<plx:param name="entityCollection" dataTypeName="TList">
					<plx:passTypeParam dataTypeName="T"/>
				</plx:param>
				<plx:returns dataTypeName=".string"/>
				<plx:local name="ser" dataTypeName="XmlSerializer" dataTypeQualifier="System.Xml.Serialization">
					<plx:initialize>
						<plx:callNew dataTypeName="XmlSerializer" dataTypeQualifier="System.Xml.Serialization">
							<plx:passParam>
								<plx:callInstance name="GetType">
									<plx:callObject>
										<plx:nameRef name="entityCollection" type="parameter"/>
									</plx:callObject>
								</plx:callInstance>
							</plx:passParam>
						</plx:callNew>
					</plx:initialize>
				</plx:local>
				<plx:local name="sb" dataTypeName="StringBuilder" dataTypeQualifier="System.Text">
					<plx:initialize>
						<plx:callNew dataTypeName="StringBuilder" dataTypeQualifier="System.Text"/>
					</plx:initialize>
				</plx:local>
				<plx:local name="writer" dataTypeName="TextWriter" dataTypeQualifier="System.IO">
					<plx:initialize>
						<plx:callNew dataTypeName="StringWriter" dataTypeQualifier="System.IO">
							<plx:passParam>
								<plx:nameRef name="sb"/>
							</plx:passParam>
						</plx:callNew>
					</plx:initialize>
				</plx:local>
				<plx:callInstance name="Serialize">
					<plx:callObject>
						<plx:nameRef name="ser"/>
					</plx:callObject>
					<plx:passParam>
						<plx:nameRef name="writer"/>
					</plx:passParam>
					<plx:passParam>
						<plx:nameRef name="entityCollection" type="parameter"/>
					</plx:passParam>
				</plx:callInstance>
				<plx:callInstance name="Close">
					<plx:callObject>
						<plx:nameRef name="writer"/>
					</plx:callObject>
				</plx:callInstance>
				<plx:return>
					<plx:callInstance name="ToString">
						<plx:callObject>
							<plx:nameRef name="sb"/>
						</plx:callObject>
					</plx:callInstance>
				</plx:return>
			</plx:function>
			<plx:function name="SerializeXml" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Serializes the entity to xml and puts the data into a file.
</summary>
						<param name="entity">The Entity to serialize.</param>
						<param name="path">The Path to the destination file.</param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="entity" dataTypeName="IEntity"/>
				<plx:param name="path" dataTypeName=".string"/>
				<plx:local name="ser" dataTypeName="XmlSerializer" dataTypeQualifier="System.Xml.Serialization">
					<plx:initialize>
						<plx:callNew dataTypeName="XmlSerializer" dataTypeQualifier="System.Xml.Serialization">
							<plx:passParam>
								<plx:callInstance name="GetType">
									<plx:callObject>
										<plx:nameRef name="entity" type="parameter"/>
									</plx:callObject>
								</plx:callInstance>
							</plx:passParam>
						</plx:callNew>
					</plx:initialize>
				</plx:local>
				<plx:local name="sw" dataTypeName="StreamWriter" dataTypeQualifier="System.IO">
					<plx:initialize>
						<plx:callNew dataTypeName="StreamWriter" dataTypeQualifier="System.IO">
							<plx:passParam>
								<plx:nameRef name="path" type="parameter"/>
							</plx:passParam>
						</plx:callNew>
					</plx:initialize>
				</plx:local>
				<plx:callInstance name="Serialize">
					<plx:callObject>
						<plx:nameRef name="ser"/>
					</plx:callObject>
					<plx:passParam>
						<plx:cast dataTypeName="TextWriter" dataTypeQualifier="System.IO">
							<plx:nameRef name="sw"/>
						</plx:cast>
					</plx:passParam>
					<plx:passParam>
						<plx:nameRef name="entity" type="parameter"/>
					</plx:passParam>
				</plx:callInstance>
				<plx:callInstance name="Close">
					<plx:callObject>
						<plx:nameRef name="sw"/>
					</plx:callObject>
				</plx:callInstance>
			</plx:function>
			<plx:function name="SerializeXml" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Serializes the entity collection to xml and puts the data into a file.
</summary>
						<param name="entityCollection">The Entity collection to serialize.</param>
						<param name="path">The Path to the destination file.</param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:typeParam name="T" requireDefaultConstructor="true">
					<plx:typeConstraint dataTypeName="IEntity"/>
				</plx:typeParam>
				<plx:param name="entityCollection" dataTypeName="TList">
					<plx:passTypeParam dataTypeName="T"/>
				</plx:param>
				<plx:param name="path" dataTypeName=".string"/>
				<plx:local name="ser" dataTypeName="XmlSerializer" dataTypeQualifier="System.Xml.Serialization">
					<plx:initialize>
						<plx:callNew dataTypeName="XmlSerializer" dataTypeQualifier="System.Xml.Serialization">
							<plx:passParam>
								<plx:callInstance name="GetType">
									<plx:callObject>
										<plx:nameRef name="entityCollection" type="parameter"/>
									</plx:callObject>
								</plx:callInstance>
							</plx:passParam>
						</plx:callNew>
					</plx:initialize>
				</plx:local>
				<plx:local name="sw" dataTypeName="StreamWriter" dataTypeQualifier="System.IO">
					<plx:initialize>
						<plx:callNew dataTypeName="StreamWriter" dataTypeQualifier="System.IO">
							<plx:passParam>
								<plx:nameRef name="path" type="parameter"/>
							</plx:passParam>
						</plx:callNew>
					</plx:initialize>
				</plx:local>
				<plx:callInstance name="Serialize">
					<plx:callObject>
						<plx:nameRef name="ser"/>
					</plx:callObject>
					<plx:passParam>
						<plx:cast dataTypeName="TextWriter" dataTypeQualifier="System.IO">
							<plx:nameRef name="sw"/>
						</plx:cast>
					</plx:passParam>
					<plx:passParam>
						<plx:nameRef name="entityCollection" type="parameter"/>
					</plx:passParam>
				</plx:callInstance>
				<plx:callInstance name="Close">
					<plx:callObject>
						<plx:nameRef name="sw"/>
					</plx:callObject>
				</plx:callInstance>
			</plx:function>
			<plx:function name="SerializeXml" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Serializes the <see cref="T:VList{T}" /> of view entities to XML
</summary>
						<typeparam name="T">type to return</typeparam>
						<param name="entityCollection">VList of T type to return</param>
						<returns>string of serialized XML</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:typeParam name="T"/>
				<plx:param name="entityCollection" dataTypeName="VList">
					<plx:passTypeParam dataTypeName="T"/>
				</plx:param>
				<plx:returns dataTypeName=".string"/>
				<plx:local name="ser" dataTypeName="XmlSerializer" dataTypeQualifier="System.Xml.Serialization">
					<plx:initialize>
						<plx:callNew dataTypeName="XmlSerializer" dataTypeQualifier="System.Xml.Serialization">
							<plx:passParam>
								<plx:callInstance name="GetType">
									<plx:callObject>
										<plx:nameRef name="entityCollection" type="parameter"/>
									</plx:callObject>
								</plx:callInstance>
							</plx:passParam>
						</plx:callNew>
					</plx:initialize>
				</plx:local>
				<plx:local name="sb" dataTypeName="StringBuilder" dataTypeQualifier="System.Text">
					<plx:initialize>
						<plx:callNew dataTypeName="StringBuilder" dataTypeQualifier="System.Text"/>
					</plx:initialize>
				</plx:local>
				<plx:local name="writer" dataTypeName="TextWriter" dataTypeQualifier="System.IO">
					<plx:initialize>
						<plx:callNew dataTypeName="StringWriter" dataTypeQualifier="System.IO">
							<plx:passParam>
								<plx:nameRef name="sb"/>
							</plx:passParam>
						</plx:callNew>
					</plx:initialize>
				</plx:local>
				<plx:callInstance name="Serialize">
					<plx:callObject>
						<plx:nameRef name="ser"/>
					</plx:callObject>
					<plx:passParam>
						<plx:nameRef name="writer"/>
					</plx:passParam>
					<plx:passParam>
						<plx:nameRef name="entityCollection" type="parameter"/>
					</plx:passParam>
				</plx:callInstance>
				<plx:callInstance name="Close">
					<plx:callObject>
						<plx:nameRef name="writer"/>
					</plx:callObject>
				</plx:callInstance>
				<plx:return>
					<plx:callInstance name="ToString">
						<plx:callObject>
							<plx:nameRef name="sb"/>
						</plx:callObject>
					</plx:callInstance>
				</plx:return>
			</plx:function>
			<plx:function name="SerializeXml" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Serializes the view collection to xml and puts the data into a file.
</summary>
						<param name="entityCollection">The Entity View collection to serialize.</param>
						<param name="path">The Path to the destination file.</param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:typeParam name="T"/>
				<plx:param name="entityCollection" dataTypeName="VList">
					<plx:passTypeParam dataTypeName="T"/>
				</plx:param>
				<plx:param name="path" dataTypeName=".string"/>
				<plx:local name="ser" dataTypeName="XmlSerializer" dataTypeQualifier="System.Xml.Serialization">
					<plx:initialize>
						<plx:callNew dataTypeName="XmlSerializer" dataTypeQualifier="System.Xml.Serialization">
							<plx:passParam>
								<plx:callInstance name="GetType">
									<plx:callObject>
										<plx:nameRef name="entityCollection" type="parameter"/>
									</plx:callObject>
								</plx:callInstance>
							</plx:passParam>
						</plx:callNew>
					</plx:initialize>
				</plx:local>
				<plx:local name="sw" dataTypeName="StreamWriter" dataTypeQualifier="System.IO">
					<plx:initialize>
						<plx:callNew dataTypeName="StreamWriter" dataTypeQualifier="System.IO">
							<plx:passParam>
								<plx:nameRef name="path" type="parameter"/>
							</plx:passParam>
						</plx:callNew>
					</plx:initialize>
				</plx:local>
				<plx:callInstance name="Serialize">
					<plx:callObject>
						<plx:nameRef name="ser"/>
					</plx:callObject>
					<plx:passParam>
						<plx:cast dataTypeName="TextWriter" dataTypeQualifier="System.IO">
							<plx:nameRef name="sw"/>
						</plx:cast>
					</plx:passParam>
					<plx:passParam>
						<plx:nameRef name="entityCollection" type="parameter"/>
					</plx:passParam>
				</plx:callInstance>
				<plx:callInstance name="Close">
					<plx:callObject>
						<plx:nameRef name="sw"/>
					</plx:callObject>
				</plx:callInstance>
			</plx:function>
			<plx:function name="DeserializeBinary" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Deserializes the binary data to an object instance.
</summary>
						<param name="bytes">The byte array that contains binary serialized datas.</param>
						<returns>The deserialized instance</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="bytes" dataTypeIsSimpleArray="true" dataTypeName=".u1"/>
				<plx:returns dataTypeName=".object"/>
				<plx:local name="ms" dataTypeName="MemoryStream" dataTypeQualifier="System.IO">
					<plx:initialize>
						<plx:callNew dataTypeName="MemoryStream" dataTypeQualifier="System.IO">
							<plx:passParam>
								<plx:nameRef name="bytes" type="parameter"/>
							</plx:passParam>
						</plx:callNew>
					</plx:initialize>
				</plx:local>
				<plx:local name="bf" dataTypeName="BinaryFormatter" dataTypeQualifier="System.Runtime.Serialization.Formatters.Binary">
					<plx:initialize>
						<plx:callNew dataTypeName="BinaryFormatter" dataTypeQualifier="System.Runtime.Serialization.Formatters.Binary"/>
					</plx:initialize>
				</plx:local>
				<plx:return>
					<plx:callInstance name="Deserialize">
						<plx:callObject>
							<plx:nameRef name="bf"/>
						</plx:callObject>
						<plx:passParam>
							<plx:nameRef name="ms"/>
						</plx:passParam>
					</plx:callInstance>
				</plx:return>
			</plx:function>
			<plx:function name="XmlDeserialize" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Deserialize an xml string into an object.
</summary>
						<param name="xmlData">The XML data.</param>
						<returns></returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:typeParam name="T"/>
				<plx:param name="xmlData" dataTypeName=".string"/>
				<plx:returns dataTypeName="T"/>
				<plx:local name="s" dataTypeName="XmlSerializer" dataTypeQualifier="System.Xml.Serialization">
					<plx:initialize>
						<plx:callNew dataTypeName="XmlSerializer" dataTypeQualifier="System.Xml.Serialization">
							<plx:passParam>
								<plx:typeOf dataTypeName="T"/>
							</plx:passParam>
						</plx:callNew>
					</plx:initialize>
				</plx:local>
				<plx:local name="reader" dataTypeName="TextReader" dataTypeQualifier="System.IO">
					<plx:initialize>
						<plx:callNew dataTypeName="StringReader" dataTypeQualifier="System.IO">
							<plx:passParam>
								<plx:nameRef name="xmlData" type="parameter"/>
							</plx:passParam>
						</plx:callNew>
					</plx:initialize>
				</plx:local>
				<plx:local name="entity" dataTypeName="T">
					<plx:initialize>
						<plx:cast dataTypeName="T">
							<plx:callInstance name="Deserialize">
								<plx:callObject>
									<plx:nameRef name="s"/>
								</plx:callObject>
								<plx:passParam>
									<plx:nameRef name="reader"/>
								</plx:passParam>
							</plx:callInstance>
						</plx:cast>
					</plx:initialize>
				</plx:local>
				<plx:callInstance name="Close">
					<plx:callObject>
						<plx:nameRef name="reader"/>
					</plx:callObject>
				</plx:callInstance>
				<plx:return>
					<plx:nameRef name="entity"/>
				</plx:return>
			</plx:function>
			<plx:function name="DeserializeEntityXml" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Deserialize an Entity from an xml string to T
</summary>
						<typeparam name="T">T where T : IEntity</typeparam>
						<param name="data">string of serialized xml</param>
						<returns>T where T : IEntity</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:typeParam name="T">
					<plx:typeConstraint dataTypeName="IEntity"/>
				</plx:typeParam>
				<plx:param name="data" dataTypeName=".string"/>
				<plx:returns dataTypeName="T"/>
				<plx:local name="serializer" dataTypeName="XmlSerializer" dataTypeQualifier="System.Xml.Serialization">
					<plx:initialize>
						<plx:callNew dataTypeName="XmlSerializer" dataTypeQualifier="System.Xml.Serialization">
							<plx:passParam>
								<plx:typeOf dataTypeName="T"/>
							</plx:passParam>
						</plx:callNew>
					</plx:initialize>
				</plx:local>
				<plx:local name="reader" dataTypeName="TextReader" dataTypeQualifier="System.IO">
					<plx:initialize>
						<plx:callNew dataTypeName="StringReader" dataTypeQualifier="System.IO">
							<plx:passParam>
								<plx:nameRef name="data" type="parameter"/>
							</plx:passParam>
						</plx:callNew>
					</plx:initialize>
				</plx:local>
				<plx:local name="toReturn" dataTypeName="T">
					<plx:initialize>
						<plx:cast dataTypeName="T">
							<plx:callInstance name="Deserialize">
								<plx:callObject>
									<plx:nameRef name="serializer"/>
								</plx:callObject>
								<plx:passParam>
									<plx:nameRef name="reader"/>
								</plx:passParam>
							</plx:callInstance>
						</plx:cast>
					</plx:initialize>
				</plx:local>
				<plx:callInstance name="Close">
					<plx:callObject>
						<plx:nameRef name="reader"/>
					</plx:callObject>
				</plx:callInstance>
				<plx:return>
					<plx:nameRef name="toReturn"/>
				</plx:return>
			</plx:function>
			<plx:function name="DeserializeListXml" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary/>
						<typeparam name="T"><see cref="T:TList{T}" /> where T : IEntity, new()</typeparam>
						<param name="data">string of serialized TList of T xml</param>
						<returns><see cref="T:TList{T}" /> where T : IEntity, new()</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:typeParam name="T" requireDefaultConstructor="true">
					<plx:typeConstraint dataTypeName="IEntity"/>
				</plx:typeParam>
				<plx:param name="data" dataTypeName=".string"/>
				<plx:returns dataTypeName="TList">
					<plx:passTypeParam dataTypeName="T"/>
				</plx:returns>
				<plx:local name="serializer" dataTypeName="XmlSerializer" dataTypeQualifier="System.Xml.Serialization">
					<plx:initialize>
						<plx:callNew dataTypeName="XmlSerializer" dataTypeQualifier="System.Xml.Serialization">
							<plx:passParam>
								<plx:typeOf dataTypeName="TList">
									<plx:passTypeParam dataTypeName="T"/>
								</plx:typeOf>
							</plx:passParam>
						</plx:callNew>
					</plx:initialize>
				</plx:local>
				<plx:local name="reader" dataTypeName="TextReader" dataTypeQualifier="System.IO">
					<plx:initialize>
						<plx:callNew dataTypeName="StringReader" dataTypeQualifier="System.IO">
							<plx:passParam>
								<plx:nameRef name="data" type="parameter"/>
							</plx:passParam>
						</plx:callNew>
					</plx:initialize>
				</plx:local>
				<plx:local name="toReturn" dataTypeName="TList">
					<plx:passTypeParam dataTypeName="T"/>
					<plx:initialize>
						<plx:cast dataTypeName="TList">
							<plx:passTypeParam dataTypeName="T"/>
							<plx:callInstance name="Deserialize">
								<plx:callObject>
									<plx:nameRef name="serializer"/>
								</plx:callObject>
								<plx:passParam>
									<plx:nameRef name="reader"/>
								</plx:passParam>
							</plx:callInstance>
						</plx:cast>
					</plx:initialize>
				</plx:local>
				<plx:callInstance name="Close">
					<plx:callObject>
						<plx:nameRef name="reader"/>
					</plx:callObject>
				</plx:callInstance>
				<plx:return>
					<plx:nameRef name="toReturn"/>
				</plx:return>
			</plx:function>
			<plx:function name="DeserializeXml" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Deserializes the XML string to an instance of the specified type.
</summary>
						<param name="root">The name of the root node.</param>
						<param name="type">The targeted Type.</param>
						<param name="reader">The xmlReader instance that point to the xml data.</param>
						<returns>An instance of the Type class.</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="root" dataTypeName=".string"/>
				<plx:param name="type" dataTypeName="Type" dataTypeQualifier="System"/>
				<plx:param name="reader" dataTypeName="XmlReader" dataTypeQualifier="System.Xml"/>
				<plx:returns dataTypeName=".object"/>
				<plx:local name="xmlRoot" dataTypeName="XmlRootAttribute" dataTypeQualifier="System.Xml.Serialization">
					<plx:initialize>
						<plx:callNew dataTypeName="XmlRootAttribute" dataTypeQualifier="System.Xml.Serialization"/>
					</plx:initialize>
				</plx:local>
				<plx:assign>
					<plx:left>
						<plx:callInstance name="ElementName" type="property">
							<plx:callObject>
								<plx:nameRef name="xmlRoot"/>
							</plx:callObject>
						</plx:callInstance>
					</plx:left>
					<plx:right>
						<plx:nameRef name="root" type="parameter"/>
					</plx:right>
				</plx:assign>
				<plx:local name="serializer" dataTypeName="XmlSerializer" dataTypeQualifier="System.Xml.Serialization">
					<plx:initialize>
						<plx:callNew dataTypeName="XmlSerializer" dataTypeQualifier="System.Xml.Serialization">
							<plx:passParam>
								<plx:nameRef name="type" type="parameter"/>
							</plx:passParam>
							<plx:passParam>
								<plx:nameRef name="xmlRoot"/>
							</plx:passParam>
						</plx:callNew>
					</plx:initialize>
				</plx:local>
				<plx:return>
					<plx:callInstance name="Deserialize">
						<plx:callObject>
							<plx:nameRef name="serializer"/>
						</plx:callObject>
						<plx:passParam>
							<plx:nameRef name="reader" type="parameter"/>
						</plx:passParam>
					</plx:callInstance>
				</plx:return>
			</plx:function>
			<plx:function name="DeserializeVListXml" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Deserialize a list of view entity objects from an Xml string
</summary>
						<typeparam name="T"><see cref="T:VList{T}" /> where T is a view entity class</typeparam>
						<param name="data">string of serialized VList of T xml</param>
						<returns>
							<see cref="T:VList{T}" />
						</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:typeParam name="T"/>
				<plx:param name="data" dataTypeName=".string"/>
				<plx:returns dataTypeName="VList">
					<plx:passTypeParam dataTypeName="T"/>
				</plx:returns>
				<plx:local name="serializer" dataTypeName="XmlSerializer" dataTypeQualifier="System.Xml.Serialization">
					<plx:initialize>
						<plx:callNew dataTypeName="XmlSerializer" dataTypeQualifier="System.Xml.Serialization">
							<plx:passParam>
								<plx:typeOf dataTypeName="VList">
									<plx:passTypeParam dataTypeName="T"/>
								</plx:typeOf>
							</plx:passParam>
						</plx:callNew>
					</plx:initialize>
				</plx:local>
				<plx:local name="reader" dataTypeName="TextReader" dataTypeQualifier="System.IO">
					<plx:initialize>
						<plx:callNew dataTypeName="StringReader" dataTypeQualifier="System.IO">
							<plx:passParam>
								<plx:nameRef name="data" type="parameter"/>
							</plx:passParam>
						</plx:callNew>
					</plx:initialize>
				</plx:local>
				<plx:local name="toReturn" dataTypeName="VList">
					<plx:passTypeParam dataTypeName="T"/>
					<plx:initialize>
						<plx:cast dataTypeName="VList">
							<plx:passTypeParam dataTypeName="T"/>
							<plx:callInstance name="Deserialize">
								<plx:callObject>
									<plx:nameRef name="serializer"/>
								</plx:callObject>
								<plx:passParam>
									<plx:nameRef name="reader"/>
								</plx:passParam>
							</plx:callInstance>
						</plx:cast>
					</plx:initialize>
				</plx:local>
				<plx:callInstance name="Close">
					<plx:callObject>
						<plx:nameRef name="reader"/>
					</plx:callObject>
				</plx:callInstance>
				<plx:return>
					<plx:nameRef name="toReturn"/>
				</plx:return>
			</plx:function>
			<plx:function name="GetByteLength" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Gets the byte length of the specified object.
</summary>
						<param name="obj">The object we want the length.</param>
						<returns>The byte length of the object.</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="obj" dataTypeName=".object"/>
				<plx:returns dataTypeName=".i8"/>
				<plx:local name="ms" dataTypeName="MemoryStream" dataTypeQualifier="System.IO">
					<plx:initialize>
						<plx:callNew dataTypeName="MemoryStream" dataTypeQualifier="System.IO"/>
					</plx:initialize>
				</plx:local>
				<plx:callInstance name="Serialize">
					<plx:callObject>
						<plx:callNew dataTypeName="BinaryFormatter" dataTypeQualifier="System.Runtime.Serialization.Formatters.Binary"/>
					</plx:callObject>
					<plx:passParam>
						<plx:nameRef name="ms"/>
					</plx:passParam>
					<plx:passParam>
						<plx:nameRef name="obj" type="parameter"/>
					</plx:passParam>
				</plx:callInstance>
				<plx:return>
					<plx:callInstance name="Length" type="property">
						<plx:callObject>
							<plx:nameRef name="ms"/>
						</plx:callObject>
					</plx:callInstance>
				</plx:return>
			</plx:function>
			<plx:function name="ToString" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Give a string representation of a object, with use of reflection.
</summary>
						<param name="o">O.</param>
						<returns></returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="o" dataTypeName=".object"/>
				<plx:returns dataTypeName=".string"/>
				<plx:local name="sb" dataTypeName="StringBuilder" dataTypeQualifier="System.Text">
					<plx:initialize>
						<plx:callNew dataTypeName="StringBuilder" dataTypeQualifier="System.Text"/>
					</plx:initialize>
				</plx:local>
				<plx:local name="t" dataTypeName="Type" dataTypeQualifier="System">
					<plx:initialize>
						<plx:callInstance name="GetType">
							<plx:callObject>
								<plx:nameRef name="o" type="parameter"/>
							</plx:callObject>
						</plx:callInstance>
					</plx:initialize>
				</plx:local>
				<plx:local name="pi" dataTypeIsSimpleArray="true" dataTypeName="PropertyInfo" dataTypeQualifier="System.Reflection">
					<plx:initialize>
						<plx:callInstance name="GetProperties">
							<plx:callObject>
								<plx:nameRef name="t"/>
							</plx:callObject>
						</plx:callInstance>
					</plx:initialize>
				</plx:local>
				<plx:callInstance name="Append">
					<plx:callObject>
						<plx:nameRef name="sb"/>
					</plx:callObject>
					<plx:passParam>
						<plx:callStatic name="Concat" dataTypeName=".string">
							<plx:passParam>
								<plx:string>Properties for: </plx:string>
							</plx:passParam>
							<plx:passParam>
								<plx:callInstance name="Name" type="property">
									<plx:callObject>
										<plx:callInstance name="GetType">
											<plx:callObject>
												<plx:nameRef name="o" type="parameter"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:callObject>
								</plx:callInstance>
							</plx:passParam>
							<plx:passParam>
								<plx:callStatic name="NewLine" type="property" dataTypeName="Environment" dataTypeQualifier="System"/>
							</plx:passParam>
						</plx:callStatic>
					</plx:passParam>
				</plx:callInstance>
				<plx:iterator localName="i" dataTypeName="PropertyInfo" dataTypeQualifier="System.Reflection">
					<plx:initialize>
						<plx:nameRef name="pi"/>
					</plx:initialize>
					<plx:try>
						<plx:callInstance name="Append">
							<plx:callObject>
								<plx:nameRef name="sb"/>
							</plx:callObject>
							<plx:passParam>
								<plx:callStatic name="Concat" dataTypeName=".string">
									<plx:passParamArray dataTypeIsSimpleArray="true" dataTypeName=".string">
										<plx:passParam>
											<plx:string>	</plx:string>
										</plx:passParam>
										<plx:passParam>
											<plx:callInstance name="Name" type="property">
												<plx:callObject>
													<plx:nameRef name="i"/>
												</plx:callObject>
											</plx:callInstance>
										</plx:passParam>
										<plx:passParam>
											<plx:string>(</plx:string>
										</plx:passParam>
										<plx:passParam>
											<plx:callInstance name="ToString">
												<plx:callObject>
													<plx:callInstance name="PropertyType" type="property">
														<plx:callObject>
															<plx:nameRef name="i"/>
														</plx:callObject>
													</plx:callInstance>
												</plx:callObject>
											</plx:callInstance>
										</plx:passParam>
										<plx:passParam>
											<plx:string>): </plx:string>
										</plx:passParam>
									</plx:passParamArray>
								</plx:callStatic>
							</plx:passParam>
						</plx:callInstance>
						<plx:branch>
							<plx:condition>
								<plx:binaryOperator type="identityInequality">
									<plx:left>
										<plx:nullKeyword/>
									</plx:left>
									<plx:right>
										<plx:callInstance name="GetValue">
											<plx:callObject>
												<plx:nameRef name="i"/>
											</plx:callObject>
											<plx:passParam>
												<plx:nameRef name="o" type="parameter"/>
											</plx:passParam>
											<plx:passParam>
												<plx:nullKeyword/>
											</plx:passParam>
										</plx:callInstance>
									</plx:right>
								</plx:binaryOperator>
							</plx:condition>
							<plx:callInstance name="Append">
								<plx:callObject>
									<plx:nameRef name="sb"/>
								</plx:callObject>
								<plx:passParam>
									<plx:callInstance name="ToString">
										<plx:callObject>
											<plx:callInstance name="GetValue">
												<plx:callObject>
													<plx:nameRef name="i"/>
												</plx:callObject>
												<plx:passParam>
													<plx:nameRef name="o" type="parameter"/>
												</plx:passParam>
												<plx:passParam>
													<plx:nullKeyword/>
												</plx:passParam>
											</plx:callInstance>
										</plx:callObject>
									</plx:callInstance>
								</plx:passParam>
							</plx:callInstance>
						</plx:branch>
						<plx:fallbackCatch/>
					</plx:try>
					<plx:callInstance name="Append">
						<plx:callObject>
							<plx:nameRef name="sb"/>
						</plx:callObject>
						<plx:passParam>
							<plx:callStatic name="NewLine" type="property" dataTypeName="Environment" dataTypeQualifier="System"/>
						</plx:passParam>
					</plx:callInstance>
				</plx:iterator>
				<plx:local name="fi" dataTypeIsSimpleArray="true" dataTypeName="FieldInfo" dataTypeQualifier="System.Reflection">
					<plx:initialize>
						<plx:callInstance name="GetFields">
							<plx:callObject>
								<plx:nameRef name="t"/>
							</plx:callObject>
						</plx:callInstance>
					</plx:initialize>
				</plx:local>
				<plx:iterator localName="i" dataTypeName="FieldInfo" dataTypeQualifier="System.Reflection">
					<plx:initialize>
						<plx:nameRef name="fi"/>
					</plx:initialize>
					<plx:try>
						<plx:callInstance name="Append">
							<plx:callObject>
								<plx:nameRef name="sb"/>
							</plx:callObject>
							<plx:passParam>
								<plx:callStatic name="Concat" dataTypeName=".string">
									<plx:passParamArray dataTypeIsSimpleArray="true" dataTypeName=".string">
										<plx:passParam>
											<plx:string>	</plx:string>
										</plx:passParam>
										<plx:passParam>
											<plx:callInstance name="Name" type="property">
												<plx:callObject>
													<plx:nameRef name="i"/>
												</plx:callObject>
											</plx:callInstance>
										</plx:passParam>
										<plx:passParam>
											<plx:string>(</plx:string>
										</plx:passParam>
										<plx:passParam>
											<plx:callInstance name="ToString">
												<plx:callObject>
													<plx:callInstance name="FieldType" type="property">
														<plx:callObject>
															<plx:nameRef name="i"/>
														</plx:callObject>
													</plx:callInstance>
												</plx:callObject>
											</plx:callInstance>
										</plx:passParam>
										<plx:passParam>
											<plx:string>): </plx:string>
										</plx:passParam>
									</plx:passParamArray>
								</plx:callStatic>
							</plx:passParam>
						</plx:callInstance>
						<plx:branch>
							<plx:condition>
								<plx:binaryOperator type="identityInequality">
									<plx:left>
										<plx:nullKeyword/>
									</plx:left>
									<plx:right>
										<plx:callInstance name="GetValue">
											<plx:callObject>
												<plx:nameRef name="i"/>
											</plx:callObject>
											<plx:passParam>
												<plx:nameRef name="o" type="parameter"/>
											</plx:passParam>
										</plx:callInstance>
									</plx:right>
								</plx:binaryOperator>
							</plx:condition>
							<plx:callInstance name="Append">
								<plx:callObject>
									<plx:nameRef name="sb"/>
								</plx:callObject>
								<plx:passParam>
									<plx:callInstance name="ToString">
										<plx:callObject>
											<plx:callInstance name="GetValue">
												<plx:callObject>
													<plx:nameRef name="i"/>
												</plx:callObject>
												<plx:passParam>
													<plx:nameRef name="o" type="parameter"/>
												</plx:passParam>
											</plx:callInstance>
										</plx:callObject>
									</plx:callInstance>
								</plx:passParam>
							</plx:callInstance>
						</plx:branch>
						<plx:fallbackCatch/>
					</plx:try>
					<plx:callInstance name="Append">
						<plx:callObject>
							<plx:nameRef name="sb"/>
						</plx:callObject>
						<plx:passParam>
							<plx:callStatic name="NewLine" type="property" dataTypeName="Environment" dataTypeQualifier="System"/>
						</plx:passParam>
					</plx:callInstance>
				</plx:iterator>
				<plx:return>
					<plx:callInstance name="ToString">
						<plx:callObject>
							<plx:nameRef name="sb"/>
						</plx:callObject>
					</plx:callInstance>
				</plx:return>
			</plx:function>
			<plx:function name="Clone" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Generic method to perform a deep copy of an object
</summary>
						<typeparam name="T">Type of object being cloned and returned</typeparam>
						<param name="sourceEntity">Source object to be cloned.</param>
						<returns>An object that is a deep copy of the sourceEntity object.</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:typeParam name="T"/>
				<plx:param name="sourceEntity" dataTypeName="T"/>
				<plx:returns dataTypeName="T"/>
				<plx:local name="bFormatter" dataTypeName="BinaryFormatter" dataTypeQualifier="System.Runtime.Serialization.Formatters.Binary">
					<plx:initialize>
						<plx:callNew dataTypeName="BinaryFormatter" dataTypeQualifier="System.Runtime.Serialization.Formatters.Binary"/>
					</plx:initialize>
				</plx:local>
				<plx:local name="stream" dataTypeName="MemoryStream" dataTypeQualifier="System.IO">
					<plx:initialize>
						<plx:callNew dataTypeName="MemoryStream" dataTypeQualifier="System.IO"/>
					</plx:initialize>
				</plx:local>
				<plx:callInstance name="Serialize">
					<plx:callObject>
						<plx:nameRef name="bFormatter"/>
					</plx:callObject>
					<plx:passParam>
						<plx:nameRef name="stream"/>
					</plx:passParam>
					<plx:passParam>
						<plx:nameRef name="sourceEntity" type="parameter"/>
					</plx:passParam>
				</plx:callInstance>
				<plx:callInstance name="Seek">
					<plx:callObject>
						<plx:nameRef name="stream"/>
					</plx:callObject>
					<plx:passParam>
						<plx:value data="0" type="i8"/>
					</plx:passParam>
					<plx:passParam>
						<plx:callStatic name="Begin" type="field" dataTypeName="SeekOrigin" dataTypeQualifier="System.IO"/>
					</plx:passParam>
				</plx:callInstance>
				<plx:return>
					<plx:cast dataTypeName="T">
						<plx:callInstance name="Deserialize">
							<plx:callObject>
								<plx:nameRef name="bFormatter"/>
							</plx:callObject>
							<plx:passParam>
								<plx:nameRef name="stream"/>
							</plx:passParam>
						</plx:callInstance>
					</plx:cast>
				</plx:return>
			</plx:function>
			<plx:function name="GetBindableProperties" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Get the collection of properties that have been marked as Bindable
</summary>
						<param name="type">The type of the object to get the properties for.</param>
						<returns><see cref="T:System.ComponentModel.PropertyDescriptorCollection" /> of bindable properties.</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="type" dataTypeName="Type" dataTypeQualifier="System"/>
				<plx:returns dataTypeName="PropertyDescriptorCollection" dataTypeQualifier="System.ComponentModel"/>
				<plx:local name="attrs" dataTypeIsSimpleArray="true" dataTypeName="Attribute" dataTypeQualifier="System">
					<plx:initialize>
						<plx:callNew dataTypeIsSimpleArray="true" dataTypeName="Attribute" dataTypeQualifier="System">
							<plx:arrayInitializer>
								<plx:callNew dataTypeName="BindableAttribute" dataTypeQualifier="System.ComponentModel">
									<plx:passParam>
										<plx:trueKeyword/>
									</plx:passParam>
								</plx:callNew>
							</plx:arrayInitializer>
						</plx:callNew>
					</plx:initialize>
				</plx:local>
				<plx:branch>
					<plx:condition>
						<plx:callInstance name="IsGenericType" type="property">
							<plx:callObject>
								<plx:nameRef name="type" type="parameter"/>
							</plx:callObject>
						</plx:callInstance>
					</plx:condition>
					<plx:assign>
						<plx:left>
							<plx:nameRef name="type" type="parameter"/>
						</plx:left>
						<plx:right>
							<plx:callInstance name=".implied" type="arrayIndexer">
								<plx:callObject>
									<plx:callInstance name="GetGenericArguments">
										<plx:callObject>
											<plx:nameRef name="type" type="parameter"/>
										</plx:callObject>
									</plx:callInstance>
								</plx:callObject>
								<plx:passParam>
									<plx:value data="0" type="i4"/>
								</plx:passParam>
							</plx:callInstance>
						</plx:right>
					</plx:assign>
				</plx:branch>
				<plx:return>
					<plx:callStatic name="GetProperties" dataTypeName="TypeDescriptor" dataTypeQualifier="System.ComponentModel">
						<plx:passParam>
							<plx:nameRef name="type" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:nameRef name="attrs"/>
						</plx:passParam>
					</plx:callStatic>
				</plx:return>
			</plx:function>
			<plx:function name="GetEnumTextValue" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Allows the discovery of an enumeration text value based on the <c>EnumTextValueAttribute</c>
</summary>
						<param name="e">The enum to get the reader friendly text value for.</param>
						<returns>
							<see cref="T:System.String" />
						</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="e" dataTypeName="Enum" dataTypeQualifier="System"/>
				<plx:returns dataTypeName=".string"/>
				<plx:local name="ret" dataTypeName=".string">
					<plx:initialize>
						<plx:string/>
					</plx:initialize>
				</plx:local>
				<plx:local name="members" dataTypeIsSimpleArray="true" dataTypeName="MemberInfo" dataTypeQualifier="System.Reflection">
					<plx:initialize>
						<plx:callInstance name="GetMember">
							<plx:callObject>
								<plx:callInstance name="GetType">
									<plx:callObject>
										<plx:nameRef name="e" type="parameter"/>
									</plx:callObject>
								</plx:callInstance>
							</plx:callObject>
							<plx:passParam>
								<plx:callInstance name="ToString">
									<plx:callObject>
										<plx:nameRef name="e" type="parameter"/>
									</plx:callObject>
								</plx:callInstance>
							</plx:passParam>
						</plx:callInstance>
					</plx:initialize>
				</plx:local>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="booleanAnd">
							<plx:left>
								<plx:binaryOperator type="identityInequality">
									<plx:left>
										<plx:nameRef name="members"/>
									</plx:left>
									<plx:right>
										<plx:nullKeyword/>
									</plx:right>
								</plx:binaryOperator>
							</plx:left>
							<plx:right>
								<plx:binaryOperator type="equality">
									<plx:left>
										<plx:callInstance name="Length" type="property">
											<plx:callObject>
												<plx:nameRef name="members"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:left>
									<plx:right>
										<plx:value data="1" type="i4"/>
									</plx:right>
								</plx:binaryOperator>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:local name="attrs" dataTypeIsSimpleArray="true" dataTypeName=".object">
						<plx:initialize>
							<plx:callInstance name="GetCustomAttributes">
								<plx:callObject>
									<plx:callInstance name=".implied" type="arrayIndexer">
										<plx:callObject>
											<plx:nameRef name="members"/>
										</plx:callObject>
										<plx:passParam>
											<plx:value data="0" type="i4"/>
										</plx:passParam>
									</plx:callInstance>
								</plx:callObject>
								<plx:passParam>
									<plx:typeOf dataTypeName="EnumTextValueAttribute"/>
								</plx:passParam>
								<plx:passParam>
									<plx:falseKeyword/>
								</plx:passParam>
							</plx:callInstance>
						</plx:initialize>
					</plx:local>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="equality">
								<plx:left>
									<plx:callInstance name="Length" type="property">
										<plx:callObject>
											<plx:nameRef name="attrs"/>
										</plx:callObject>
									</plx:callInstance>
								</plx:left>
								<plx:right>
									<plx:value data="1" type="i4"/>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:assign>
							<plx:left>
								<plx:nameRef name="ret"/>
							</plx:left>
							<plx:right>
								<plx:callInstance name="Text" type="property">
									<plx:callObject>
										<plx:cast dataTypeName="EnumTextValueAttribute">
											<plx:callInstance name=".implied" type="arrayIndexer">
												<plx:callObject>
													<plx:nameRef name="attrs"/>
												</plx:callObject>
												<plx:passParam>
													<plx:value data="0" type="i4"/>
												</plx:passParam>
											</plx:callInstance>
										</plx:cast>
									</plx:callObject>
								</plx:callInstance>
							</plx:right>
						</plx:assign>
					</plx:branch>
				</plx:branch>
				<plx:return>
					<plx:nameRef name="ret"/>
				</plx:return>
			</plx:function>
			<plx:function name="GetEnumValue" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Allows the discovery of an enumeration value based on the <c>EnumTextValueAttribute</c>
</summary>
						<param name="text">The text of the <c>EnumTextValueAttribute</c>.</param>
						<param name="enumType">The type of the enum to get the value for.</param>
						<returns><see cref="T:System.Object" /> boxed representation of the enum value </returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="text" dataTypeName=".string"/>
				<plx:param name="enumType" dataTypeName="Type" dataTypeQualifier="System"/>
				<plx:returns dataTypeName=".object"/>
				<plx:local name="members" dataTypeIsSimpleArray="true" dataTypeName="MemberInfo" dataTypeQualifier="System.Reflection">
					<plx:initialize>
						<plx:callInstance name="GetMembers">
							<plx:callObject>
								<plx:nameRef name="enumType" type="parameter"/>
							</plx:callObject>
						</plx:callInstance>
					</plx:initialize>
				</plx:local>
				<plx:iterator localName="mi" dataTypeName="MemberInfo" dataTypeQualifier="System.Reflection">
					<plx:initialize>
						<plx:nameRef name="members"/>
					</plx:initialize>
					<plx:local name="attrs" dataTypeIsSimpleArray="true" dataTypeName=".object">
						<plx:initialize>
							<plx:callInstance name="GetCustomAttributes">
								<plx:callObject>
									<plx:nameRef name="mi"/>
								</plx:callObject>
								<plx:passParam>
									<plx:typeOf dataTypeName="EnumTextValueAttribute"/>
								</plx:passParam>
								<plx:passParam>
									<plx:falseKeyword/>
								</plx:passParam>
							</plx:callInstance>
						</plx:initialize>
					</plx:local>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="booleanAnd">
								<plx:left>
									<plx:binaryOperator type="equality">
										<plx:left>
											<plx:callInstance name="Length" type="property">
												<plx:callObject>
													<plx:nameRef name="attrs"/>
												</plx:callObject>
											</plx:callInstance>
										</plx:left>
										<plx:right>
											<plx:value data="1" type="i4"/>
										</plx:right>
									</plx:binaryOperator>
								</plx:left>
								<plx:right>
									<plx:binaryOperator type="equality">
										<plx:left>
											<plx:callInstance name="Text" type="property">
												<plx:callObject>
													<plx:cast dataTypeName="EnumTextValueAttribute">
														<plx:callInstance name=".implied" type="arrayIndexer">
															<plx:callObject>
																<plx:nameRef name="attrs"/>
															</plx:callObject>
															<plx:passParam>
																<plx:value data="0" type="i4"/>
															</plx:passParam>
														</plx:callInstance>
													</plx:cast>
												</plx:callObject>
											</plx:callInstance>
										</plx:left>
										<plx:right>
											<plx:nameRef name="text" type="parameter"/>
										</plx:right>
									</plx:binaryOperator>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:return>
							<plx:callStatic name="Parse" dataTypeName="Enum" dataTypeQualifier="System">
								<plx:passParam>
									<plx:nameRef name="enumType" type="parameter"/>
								</plx:passParam>
								<plx:passParam>
									<plx:callInstance name="Name" type="property">
										<plx:callObject>
											<plx:nameRef name="mi"/>
										</plx:callObject>
									</plx:callInstance>
								</plx:passParam>
							</plx:callStatic>
						</plx:return>
					</plx:branch>
				</plx:iterator>
				<plx:throw>
					<plx:callNew dataTypeName="ArgumentOutOfRangeException" dataTypeQualifier="System">
						<plx:passParam>
							<plx:string>text</plx:string>
						</plx:passParam>
						<plx:passParam>
							<plx:nameRef name="text" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:string>The text passed does not correspond to an attributed enum value</plx:string>
						</plx:passParam>
					</plx:callNew>
				</plx:throw>
			</plx:function>
			<plx:function name="GetAttribute" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Gets the first occurrence of the specified type of <see cref="T:System.Attribute" />.
</summary>
						<typeparam name="T"></typeparam>
						<param name="e"></param>
						<returns></returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:typeParam name="T">
					<plx:typeConstraint dataTypeName="Attribute" dataTypeQualifier="System"/>
				</plx:typeParam>
				<plx:param name="e" dataTypeName="Enum" dataTypeQualifier="System"/>
				<plx:returns dataTypeName="T"/>
				<plx:local name="attribute" dataTypeName="T">
					<plx:initialize>
						<plx:defaultValueOf dataTypeName="T"/>
					</plx:initialize>
				</plx:local>
				<plx:local name="members" dataTypeIsSimpleArray="true" dataTypeName="MemberInfo" dataTypeQualifier="System.Reflection">
					<plx:initialize>
						<plx:callInstance name="GetMember">
							<plx:callObject>
								<plx:callInstance name="GetType">
									<plx:callObject>
										<plx:nameRef name="e" type="parameter"/>
									</plx:callObject>
								</plx:callInstance>
							</plx:callObject>
							<plx:passParam>
								<plx:callInstance name="ToString">
									<plx:callObject>
										<plx:nameRef name="e" type="parameter"/>
									</plx:callObject>
								</plx:callInstance>
							</plx:passParam>
						</plx:callInstance>
					</plx:initialize>
				</plx:local>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="booleanAnd">
							<plx:left>
								<plx:binaryOperator type="identityInequality">
									<plx:left>
										<plx:nameRef name="members"/>
									</plx:left>
									<plx:right>
										<plx:nullKeyword/>
									</plx:right>
								</plx:binaryOperator>
							</plx:left>
							<plx:right>
								<plx:binaryOperator type="equality">
									<plx:left>
										<plx:callInstance name="Length" type="property">
											<plx:callObject>
												<plx:nameRef name="members"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:left>
									<plx:right>
										<plx:value data="1" type="i4"/>
									</plx:right>
								</plx:binaryOperator>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:local name="attrs" dataTypeIsSimpleArray="true" dataTypeName=".object">
						<plx:initialize>
							<plx:callInstance name="GetCustomAttributes">
								<plx:callObject>
									<plx:callInstance name=".implied" type="arrayIndexer">
										<plx:callObject>
											<plx:nameRef name="members"/>
										</plx:callObject>
										<plx:passParam>
											<plx:value data="0" type="i4"/>
										</plx:passParam>
									</plx:callInstance>
								</plx:callObject>
								<plx:passParam>
									<plx:typeOf dataTypeName="T"/>
								</plx:passParam>
								<plx:passParam>
									<plx:falseKeyword/>
								</plx:passParam>
							</plx:callInstance>
						</plx:initialize>
					</plx:local>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="greaterThan">
								<plx:left>
									<plx:callInstance name="Length" type="property">
										<plx:callObject>
											<plx:nameRef name="attrs"/>
										</plx:callObject>
									</plx:callInstance>
								</plx:left>
								<plx:right>
									<plx:value data="0" type="i4"/>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:assign>
							<plx:left>
								<plx:nameRef name="attribute"/>
							</plx:left>
							<plx:right>
								<plx:cast dataTypeName="T">
									<plx:callInstance name=".implied" type="arrayIndexer">
										<plx:callObject>
											<plx:nameRef name="attrs"/>
										</plx:callObject>
										<plx:passParam>
											<plx:value data="0" type="i4"/>
										</plx:passParam>
									</plx:callInstance>
								</plx:cast>
							</plx:right>
						</plx:assign>
					</plx:branch>
				</plx:branch>
				<plx:return>
					<plx:nameRef name="attribute"/>
				</plx:return>
			</plx:function>
			<plx:function name="GetPascalSpacedName" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Get the Pascal spaced version of a name.  
</summary>
						<param name="name">Name to be changed</param>
						<returns>PascalSpaced version of the name</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="name" dataTypeName=".string"/>
				<plx:returns dataTypeName=".string"/>
				<plx:branch>
					<plx:condition>
						<plx:callStatic name="IsNullOrEmpty" dataTypeName=".string">
							<plx:passParam>
								<plx:nameRef name="name" type="parameter"/>
							</plx:passParam>
						</plx:callStatic>
					</plx:condition>
					<plx:return>
						<plx:callStatic name="Empty" type="field" dataTypeName=".string"/>
					</plx:return>
				</plx:branch>
				<plx:local name="regex" dataTypeName="Regex" dataTypeQualifier="System.Text.RegularExpressions">
					<plx:initialize>
						<plx:callNew dataTypeName="Regex" dataTypeQualifier="System.Text.RegularExpressions">
							<plx:passParam>
								<plx:string>(?&lt;=[a-z])(?&lt;x&gt;[A-Z])|(?&lt;=.)(?&lt;x&gt;[A-Z])(?=[a-z])</plx:string>
							</plx:passParam>
						</plx:callNew>
					</plx:initialize>
				</plx:local>
				<plx:return>
					<plx:callInstance name="Replace">
						<plx:callObject>
							<plx:nameRef name="regex"/>
						</plx:callObject>
						<plx:passParam>
							<plx:nameRef name="name" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:string> ${x}</plx:string>
						</plx:passParam>
					</plx:callInstance>
				</plx:return>
			</plx:function>
		</plx:class>
		<plx:class name="EnumTextValueAttribute" visibility="public" modifier="sealed">
			<plx:leadingInfo>
				<plx:docComment>
					<summary>
Attribute used to decorate enumerations with reader friendly names
</summary>
				</plx:docComment>
			</plx:leadingInfo>
			<plx:derivesFromClass dataTypeName="Attribute" dataTypeQualifier="System"/>
			<plx:field name="enumTextValue" visibility="private" readOnly="true" dataTypeName=".string"/>
			<plx:property name="Text" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Returns the text representation of the value
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:returns dataTypeName=".string"/>
				<plx:get>
					<plx:return>
						<plx:callThis name="enumTextValue" type="field"/>
					</plx:return>
				</plx:get>
			</plx:property>
			<plx:function name=".construct" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Allows the creation of a friendly text representation of the enumeration.
</summary>
						<param name="text">The reader friendly text to decorate the enum.</param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="text" dataTypeName=".string"/>
				<plx:assign>
					<plx:left>
						<plx:callThis name="enumTextValue" type="field"/>
					</plx:left>
					<plx:right>
						<plx:nameRef name="text" type="parameter"/>
					</plx:right>
				</plx:assign>
			</plx:function>
		</plx:class>
		<plx:class name="ColumnEnumAttribute" visibility="public" modifier="sealed">
			<plx:leadingInfo>
				<plx:docComment>
					<summary>
Provides column metadata information for an entity column enumeration.
</summary>
				</plx:docComment>
			</plx:leadingInfo>
			<plx:derivesFromClass dataTypeName="Attribute" dataTypeQualifier="System"/>
			<plx:field name="name" visibility="private" dataTypeName=".string">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
The Name member variable.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
			</plx:field>
			<plx:field name="systemType" visibility="private" dataTypeName="Type" dataTypeQualifier="System">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
The SystemType member variable.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
			</plx:field>
			<plx:field name="dbType" visibility="private" dataTypeName="DbType" dataTypeQualifier="System.Data">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
The DbType member variable.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
			</plx:field>
			<plx:field name="isPrimaryKey" visibility="private" dataTypeName=".boolean">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
The IsPrimaryKey member variable.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
			</plx:field>
			<plx:field name="isIdentity" visibility="private" dataTypeName=".boolean">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
The IsIdentity member variable.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
			</plx:field>
			<plx:field name="allowDbNull" visibility="private" dataTypeName=".boolean">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
The AllowDbNull member variable.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
			</plx:field>
			<plx:field name="length" visibility="private" dataTypeName=".i4">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
The Length member variable.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
			</plx:field>
			<plx:property name="Name" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Gets or sets the Name property.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:returns dataTypeName=".string"/>
				<plx:get>
					<plx:return>
						<plx:callThis name="name" type="field"/>
					</plx:return>
				</plx:get>
				<plx:set>
					<plx:assign>
						<plx:left>
							<plx:callThis name="name" type="field"/>
						</plx:left>
						<plx:right>
							<plx:nameRef name="value" type="parameter"/>
						</plx:right>
					</plx:assign>
				</plx:set>
			</plx:property>
			<plx:property name="SystemType" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Gets or sets the SystemType property.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:returns dataTypeName="Type" dataTypeQualifier="System"/>
				<plx:get>
					<plx:return>
						<plx:callThis name="systemType" type="field"/>
					</plx:return>
				</plx:get>
				<plx:set>
					<plx:assign>
						<plx:left>
							<plx:callThis name="systemType" type="field"/>
						</plx:left>
						<plx:right>
							<plx:nameRef name="value" type="parameter"/>
						</plx:right>
					</plx:assign>
				</plx:set>
			</plx:property>
			<plx:property name="DbType" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Gets or sets the DbType property.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:returns dataTypeName="DbType" dataTypeQualifier="System.Data"/>
				<plx:get>
					<plx:return>
						<plx:callThis name="dbType" type="field"/>
					</plx:return>
				</plx:get>
				<plx:set>
					<plx:assign>
						<plx:left>
							<plx:callThis name="dbType" type="field"/>
						</plx:left>
						<plx:right>
							<plx:nameRef name="value" type="parameter"/>
						</plx:right>
					</plx:assign>
				</plx:set>
			</plx:property>
			<plx:property name="IsPrimaryKey" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Gets or sets the IsPrimaryKey property.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:returns dataTypeName=".boolean"/>
				<plx:get>
					<plx:return>
						<plx:callThis name="isPrimaryKey" type="field"/>
					</plx:return>
				</plx:get>
				<plx:set>
					<plx:assign>
						<plx:left>
							<plx:callThis name="isPrimaryKey" type="field"/>
						</plx:left>
						<plx:right>
							<plx:nameRef name="value" type="parameter"/>
						</plx:right>
					</plx:assign>
				</plx:set>
			</plx:property>
			<plx:property name="IsIdentity" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Gets or sets the IsIdentity property.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:returns dataTypeName=".boolean"/>
				<plx:get>
					<plx:return>
						<plx:callThis name="isIdentity" type="field"/>
					</plx:return>
				</plx:get>
				<plx:set>
					<plx:assign>
						<plx:left>
							<plx:callThis name="isIdentity" type="field"/>
						</plx:left>
						<plx:right>
							<plx:nameRef name="value" type="parameter"/>
						</plx:right>
					</plx:assign>
				</plx:set>
			</plx:property>
			<plx:property name="AllowDbNull" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Gets or sets the AllowDbNull property.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:returns dataTypeName=".boolean"/>
				<plx:get>
					<plx:return>
						<plx:callThis name="allowDbNull" type="field"/>
					</plx:return>
				</plx:get>
				<plx:set>
					<plx:assign>
						<plx:left>
							<plx:callThis name="allowDbNull" type="field"/>
						</plx:left>
						<plx:right>
							<plx:nameRef name="value" type="parameter"/>
						</plx:right>
					</plx:assign>
				</plx:set>
			</plx:property>
			<plx:property name="Length" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Gets or sets the Length property.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:returns dataTypeName=".i4"/>
				<plx:get>
					<plx:return>
						<plx:callThis name="length" type="field"/>
					</plx:return>
				</plx:get>
				<plx:set>
					<plx:assign>
						<plx:left>
							<plx:callThis name="length" type="field"/>
						</plx:left>
						<plx:right>
							<plx:nameRef name="value" type="parameter"/>
						</plx:right>
					</plx:assign>
				</plx:set>
			</plx:property>
			<plx:function name=".construct" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Initializes a new instance of the ColumnEnumAttribute class.
</summary>
						<param name="name"></param>
						<param name="systemType"></param>
						<param name="dbType"></param>
						<param name="isPrimaryKey"></param>
						<param name="isIdentity"></param>
						<param name="allowDbNull"></param>
						<param name="length"></param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="name" dataTypeName=".string"/>
				<plx:param name="systemType" dataTypeName="Type" dataTypeQualifier="System"/>
				<plx:param name="dbType" dataTypeName="DbType" dataTypeQualifier="System.Data"/>
				<plx:param name="isPrimaryKey" dataTypeName=".boolean"/>
				<plx:param name="isIdentity" dataTypeName=".boolean"/>
				<plx:param name="allowDbNull" dataTypeName=".boolean"/>
				<plx:param name="length" dataTypeName=".i4"/>
				<plx:assign>
					<plx:left>
						<plx:callThis name="Name" type="property"/>
					</plx:left>
					<plx:right>
						<plx:nameRef name="name" type="parameter"/>
					</plx:right>
				</plx:assign>
				<plx:assign>
					<plx:left>
						<plx:callThis name="SystemType" type="property"/>
					</plx:left>
					<plx:right>
						<plx:nameRef name="systemType" type="parameter"/>
					</plx:right>
				</plx:assign>
				<plx:assign>
					<plx:left>
						<plx:callThis name="DbType" type="property"/>
					</plx:left>
					<plx:right>
						<plx:nameRef name="dbType" type="parameter"/>
					</plx:right>
				</plx:assign>
				<plx:assign>
					<plx:left>
						<plx:callThis name="IsPrimaryKey" type="property"/>
					</plx:left>
					<plx:right>
						<plx:nameRef name="isPrimaryKey" type="parameter"/>
					</plx:right>
				</plx:assign>
				<plx:assign>
					<plx:left>
						<plx:callThis name="IsIdentity" type="property"/>
					</plx:left>
					<plx:right>
						<plx:nameRef name="isIdentity" type="parameter"/>
					</plx:right>
				</plx:assign>
				<plx:assign>
					<plx:left>
						<plx:callThis name="AllowDbNull" type="property"/>
					</plx:left>
					<plx:right>
						<plx:nameRef name="allowDbNull" type="parameter"/>
					</plx:right>
				</plx:assign>
				<plx:assign>
					<plx:left>
						<plx:callThis name="Length" type="property"/>
					</plx:left>
					<plx:right>
						<plx:nameRef name="length" type="parameter"/>
					</plx:right>
				</plx:assign>
			</plx:function>
			<plx:function name=".construct" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Initializes a new instance of the ColumnEnumAttribute class.
</summary>
						<param name="name"></param>
						<param name="systemType"></param>
						<param name="dbType"></param>
						<param name="isPrimaryKey"></param>
						<param name="isIdentity"></param>
						<param name="allowDbNull"></param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="name" dataTypeName=".string"/>
				<plx:param name="systemType" dataTypeName="Type" dataTypeQualifier="System"/>
				<plx:param name="dbType" dataTypeName="DbType" dataTypeQualifier="System.Data"/>
				<plx:param name="isPrimaryKey" dataTypeName=".boolean"/>
				<plx:param name="isIdentity" dataTypeName=".boolean"/>
				<plx:param name="allowDbNull" dataTypeName=".boolean"/>
				<plx:initialize>
					<plx:callThis name=".implied">
						<plx:passParam>
							<plx:nameRef name="name" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:nameRef name="systemType" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:nameRef name="dbType" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:nameRef name="isPrimaryKey" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:nameRef name="isIdentity" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:nameRef name="allowDbNull" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:value data="-1" type="i4"/>
						</plx:passParam>
					</plx:callThis>
				</plx:initialize>
			</plx:function>
		</plx:class>
		<plx:class name="GenericStateChangedEventArgs" visibility="public">
			<plx:leadingInfo>
				<plx:docComment>
					<summary>
Provides a generic way to inform interested objects about state change
Supplies the old value and the new value of the changed state.
</summary>
					<typeparam name="T">State Object</typeparam>
				</plx:docComment>
			</plx:leadingInfo>
			<plx:typeParam name="T"/>
			<plx:derivesFromClass dataTypeName="EventArgs" dataTypeQualifier="System"/>
			<plx:field name="oldValue" visibility="private" dataTypeName="T"/>
			<plx:field name="newValue" visibility="private" dataTypeName="T"/>
			<plx:property name="OldValue" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Gets the old value.
</summary>
						<value>The old value.</value>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:returns dataTypeName="T"/>
				<plx:get>
					<plx:return>
						<plx:callThis name="oldValue" type="field"/>
					</plx:return>
				</plx:get>
			</plx:property>
			<plx:property name="NewValue" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Gets the new value.
</summary>
						<value>The new value.</value>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:returns dataTypeName="T"/>
				<plx:get>
					<plx:return>
						<plx:callThis name="newValue" type="field"/>
					</plx:return>
				</plx:get>
			</plx:property>
			<plx:function name=".construct" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Initializes a new instance of the <see cref="Entities.GenericStateChangedEventArgs`1" /> class.
</summary>
						<param name="oldValue">The old value.</param>
						<param name="newValue">The new value.</param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="oldValue" dataTypeName="T"/>
				<plx:param name="newValue" dataTypeName="T"/>
				<plx:assign>
					<plx:left>
						<plx:callThis name="oldValue" type="field"/>
					</plx:left>
					<plx:right>
						<plx:nameRef name="oldValue" type="parameter"/>
					</plx:right>
				</plx:assign>
				<plx:assign>
					<plx:left>
						<plx:callThis name="newValue" type="field"/>
					</plx:left>
					<plx:right>
						<plx:nameRef name="newValue" type="parameter"/>
					</plx:right>
				</plx:assign>
			</plx:function>
		</plx:class>
	</xsl:template>
	<xsl:template name="EntityFactoryBase">
		<plx:class name="EntityFactoryBase" visibility="public" modifier="abstract">
			<plx:leadingInfo>
				<plx:docComment>
					<summary>
Provides the core entity factory behavior.  Will create a type based on a string
or a type and will try to auto discover which assembly this type lives in, even if it's
not a local referenced assembly.
</summary>
				</plx:docComment>
			</plx:leadingInfo>
			<plx:implementsInterface dataTypeName="IEntityFactory"/>
			<plx:field name="currentAssembly" visibility="protected" static="true" dataTypeName="Assembly" dataTypeQualifier="System.Reflection">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
The current assembly from which to attempt to create entities from.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
			</plx:field>
			<plx:field name="defaultCreationalNamespace" visibility="protected" static="true" dataTypeName=".string">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
This will create entities by default if not found in the current assembly
</summary>
					</plx:docComment>
				</plx:leadingInfo>
			</plx:field>
			<plx:field name="internalTypeCache" visibility="protected" static="true" dataTypeName="Dictionary" dataTypeQualifier="System.Collections.Generic">
				<plx:passTypeParam dataTypeName=".string"/>
				<plx:passTypeParam dataTypeName="Type" dataTypeQualifier="System"/>
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
This provides a cache of already discovered types, so that there is minimal performance hit after first lookup.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
			</plx:field>
			<plx:field name="syncRoot" visibility="protected" static="true" dataTypeName=".object">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
A synchronization object
</summary>
					</plx:docComment>
				</plx:leadingInfo>
			</plx:field>
			<plx:field name="currentEntityAssemblyNamespace" visibility="private" static="true" dataTypeName=".string">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
This is the namespace for the currentAssembly property
</summary>
					</plx:docComment>
				</plx:leadingInfo>
			</plx:field>
			<plx:property name="CurrentEntityAssembly" visibility="public" modifier="virtual">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Gets the current assembly.
</summary>
						<value>The current assembly.</value>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:interfaceMember memberName="CurrentEntityAssembly" dataTypeName="IEntityFactory"/>
				<plx:returns dataTypeName="Assembly" dataTypeQualifier="System.Reflection"/>
				<plx:get>
					<plx:return>
						<plx:callStatic name="currentAssembly" type="field" dataTypeName="EntityFactoryBase"/>
					</plx:return>
				</plx:get>
				<plx:set>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="identityInequality">
								<plx:left>
									<plx:nameRef name="value" type="parameter"/>
								</plx:left>
								<plx:right>
									<plx:nullKeyword/>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:lock>
							<plx:initialize>
								<plx:callStatic name="syncRoot" type="field" dataTypeName="EntityFactoryBase"/>
							</plx:initialize>
							<plx:assign>
								<plx:left>
									<plx:callStatic name="currentAssembly" type="field" dataTypeName="EntityFactoryBase"/>
								</plx:left>
								<plx:right>
									<plx:nameRef name="value" type="parameter"/>
								</plx:right>
							</plx:assign>
							<plx:assign>
								<plx:left>
									<plx:callThis name="CurrentEntityAssemblyNamespace" type="property"/>
								</plx:left>
								<plx:right>
									<plx:callInstance name=".implied" type="arrayIndexer">
										<plx:callObject>
											<plx:callInstance name="Split">
												<plx:callObject>
													<plx:callInstance name="FullName" type="property">
														<plx:callObject>
															<plx:callStatic name="currentAssembly" type="field" dataTypeName="EntityFactoryBase"/>
														</plx:callObject>
													</plx:callInstance>
												</plx:callObject>
												<plx:passParamArray dataTypeIsSimpleArray="true" dataTypeName=".char">
													<plx:passParam>
														<plx:value data="," type="char"/>
													</plx:passParam>
												</plx:passParamArray>
											</plx:callInstance>
										</plx:callObject>
										<plx:passParam>
											<plx:value data="0" type="i4"/>
										</plx:passParam>
									</plx:callInstance>
								</plx:right>
							</plx:assign>
						</plx:lock>
					</plx:branch>
				</plx:set>
			</plx:property>
			<plx:property name="CurrentEntityAssemblyNamespace" visibility="public" modifier="virtual">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Gets the current entity assembly namespace to discover types from.
</summary>
						<value>The current assembly.</value>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:returns dataTypeName=".string"/>
				<plx:get>
					<plx:return>
						<plx:callStatic name="currentEntityAssemblyNamespace" type="field" dataTypeName="EntityFactoryBase"/>
					</plx:return>
				</plx:get>
				<plx:set>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="identityInequality">
								<plx:left>
									<plx:nameRef name="value" type="parameter"/>
								</plx:left>
								<plx:right>
									<plx:nullKeyword/>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:lock>
							<plx:initialize>
								<plx:callStatic name="syncRoot" type="field" dataTypeName="EntityFactoryBase"/>
							</plx:initialize>
							<plx:assign>
								<plx:left>
									<plx:callStatic name="currentEntityAssemblyNamespace" type="field" dataTypeName="EntityFactoryBase"/>
								</plx:left>
								<plx:right>
									<plx:nameRef name="value" type="parameter"/>
								</plx:right>
							</plx:assign>
						</plx:lock>
					</plx:branch>
				</plx:set>
			</plx:property>
			<plx:event name="EntityCreating" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Exposes an Event which fires when an Entity is about to be created.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:attribute type="implicitField" dataTypeName="NonSerializedAttribute" dataTypeQualifier="System"/>
				<plx:attribute type="implicitAccessorFunction" dataTypeName="MethodImplAttribute" dataTypeQualifier="System.Runtime.CompilerServices">
					<plx:passParam>
						<plx:callStatic name="Synchronized" type="field" dataTypeName="MethodImplOptions" dataTypeQualifier="System.Runtime.CompilerServices"/>
					</plx:passParam>
				</plx:attribute>
				<plx:param name="sender" dataTypeName=".object"/>
				<plx:param name="e" dataTypeName="EntityEventArgs" dataTypeQualifier="EntityFactoryBase"/>
				<plx:explicitDelegateType dataTypeName="EntityCreatingEventHandler" dataTypeQualifier="EntityFactoryBase"/>
			</plx:event>
			<plx:event name="EntityCreated" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Exposes an Event which fires when an Entity has been created.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:attribute type="implicitField" dataTypeName="NonSerializedAttribute" dataTypeQualifier="System"/>
				<plx:attribute type="implicitAccessorFunction" dataTypeName="MethodImplAttribute" dataTypeQualifier="System.Runtime.CompilerServices">
					<plx:passParam>
						<plx:callStatic name="Synchronized" type="field" dataTypeName="MethodImplOptions" dataTypeQualifier="System.Runtime.CompilerServices"/>
					</plx:passParam>
				</plx:attribute>
				<plx:param name="sender" dataTypeName=".object"/>
				<plx:param name="e" dataTypeName="EntityEventArgs" dataTypeQualifier="EntityFactoryBase"/>
				<plx:explicitDelegateType dataTypeName="EntityCreatedEventHandler" dataTypeQualifier="EntityFactoryBase"/>
			</plx:event>
			<plx:function name="CreateEntity" visibility="public" modifier="virtual">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Create an entity based on a string.
It will autodiscover the type based on any information we can gather.
</summary>
						<param name="typeString">string of entity to discover and create</param>
						<param name="defaultType">if string is not found defaultType will be created.</param>
						<returns>Created IEntity object</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:interfaceMember memberName="CreateEntity" dataTypeName="IEntityFactory"/>
				<plx:param name="typeString" dataTypeName=".string"/>
				<plx:param name="defaultType" dataTypeName="Type" dataTypeQualifier="System"/>
				<plx:returns dataTypeName="IEntity"/>
				<plx:return>
					<plx:callStatic name="Create" dataTypeName="EntityFactoryBase">
						<plx:passParam>
							<plx:nameRef name="typeString" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:nameRef name="defaultType" type="parameter"/>
						</plx:passParam>
					</plx:callStatic>
				</plx:return>
			</plx:function>
			<plx:function name="CreateViewEntity" visibility="public" modifier="virtual">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Create a view entity based on a string.
It will autodiscover the type based on any information we can gather.
</summary>
						<param name="typeString">string of entity to discover and create</param>
						<param name="defaultType">if string is not found defaultType will be created.</param>
						<returns>Created object</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:interfaceMember memberName="CreateViewEntity" dataTypeName="IEntityFactory"/>
				<plx:param name="typeString" dataTypeName=".string"/>
				<plx:param name="defaultType" dataTypeName="Type" dataTypeQualifier="System"/>
				<plx:returns dataTypeName=".object"/>
				<plx:return>
					<plx:callStatic name="CreateReadOnlyEntity" dataTypeName="EntityFactoryBase">
						<plx:passParam>
							<plx:nameRef name="typeString" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:nameRef name="defaultType" type="parameter"/>
						</plx:passParam>
					</plx:callStatic>
				</plx:return>
			</plx:function>
			<plx:function name="Create" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Create an entity based on a string.  It will autodiscover the type based on
based on any information we can gather.
</summary>
						<param name="typeString">string of entity to discover and create</param>
						<returns>created IEntity object</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="typeString" dataTypeName=".string"/>
				<plx:returns dataTypeName="IEntity"/>
				<plx:return>
					<plx:callStatic name="Create" dataTypeName="EntityFactoryBase">
						<plx:passParam>
							<plx:nameRef name="typeString" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:nullKeyword/>
						</plx:passParam>
					</plx:callStatic>
				</plx:return>
			</plx:function>
			<plx:function name="Create" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Create an entity of generic type T
</summary>
						<returns>T</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:typeParam name="T" requireDefaultConstructor="true">
					<plx:typeConstraint dataTypeName="IEntity"/>
				</plx:typeParam>
				<plx:returns dataTypeName="T"/>
				<plx:local name="type" dataTypeName="Type" dataTypeQualifier="System">
					<plx:initialize>
						<plx:typeOf dataTypeName="T"/>
					</plx:initialize>
				</plx:local>
				<plx:lock>
					<plx:initialize>
						<plx:callStatic name="syncRoot" type="field" dataTypeName="EntityFactoryBase"/>
					</plx:initialize>
					<plx:branch>
						<plx:condition>
							<plx:unaryOperator type="booleanNot">
								<plx:callInstance name="ContainsValue">
									<plx:callObject>
										<plx:callStatic name="internalTypeCache" type="field" dataTypeName="EntityFactoryBase"/>
									</plx:callObject>
									<plx:passParam>
										<plx:nameRef name="type"/>
									</plx:passParam>
								</plx:callInstance>
							</plx:unaryOperator>
						</plx:condition>
						<plx:callInstance name="Add">
							<plx:callObject>
								<plx:callStatic name="internalTypeCache" type="field" dataTypeName="EntityFactoryBase"/>
							</plx:callObject>
							<plx:passParam>
								<plx:callInstance name="FullName" type="property">
									<plx:callObject>
										<plx:nameRef name="type"/>
									</plx:callObject>
								</plx:callInstance>
							</plx:passParam>
							<plx:passParam>
								<plx:nameRef name="type"/>
							</plx:passParam>
						</plx:callInstance>
					</plx:branch>
				</plx:lock>
				<plx:callStatic name="OnEntityCreating" dataTypeName="EntityFactoryBase">
					<plx:passParam>
						<plx:nameRef name="type"/>
					</plx:passParam>
				</plx:callStatic>
				<plx:local name="entity" dataTypeName="T">
					<plx:initialize>
						<plx:callNew dataTypeName="T"/>
					</plx:initialize>
				</plx:local>
				<plx:callStatic name="OnEntityCreated" dataTypeName="EntityFactoryBase">
					<plx:passParam>
						<plx:nameRef name="entity"/>
					</plx:passParam>
					<plx:passParam>
						<plx:nameRef name="type"/>
					</plx:passParam>
				</plx:callStatic>
				<plx:return>
					<plx:nameRef name="entity"/>
				</plx:return>
			</plx:function>
			<plx:function name="Create" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Create an entity based on a string.  It will autodiscover the type based on any information we can gather.
</summary>
						<param name="typeString"></param>
						<param name="defaultType"></param>
						<returns>IEntity</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="typeString" dataTypeName=".string"/>
				<plx:param name="defaultType" dataTypeName="Type" dataTypeQualifier="System"/>
				<plx:returns dataTypeName="IEntity"/>
				<plx:return>
					<plx:cast type="testCast" dataTypeName="IEntity">
						<plx:callStatic name="CoreCreate" dataTypeName="EntityFactoryBase">
							<plx:passParam>
								<plx:nameRef name="typeString" type="parameter"/>
							</plx:passParam>
							<plx:passParam>
								<plx:nameRef name="defaultType" type="parameter"/>
							</plx:passParam>
						</plx:callStatic>
					</plx:cast>
				</plx:return>
			</plx:function>
			<plx:function name="Create" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Creates an <see cref="Entities.IEntity" /> object and begins tracking on the object.
</summary>
						<param name="type">known type to create</param>
						<returns>created IEntity object</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="type" dataTypeName="Type" dataTypeQualifier="System"/>
				<plx:returns dataTypeName="IEntity"/>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="identityEquality">
							<plx:left>
								<plx:callInstance name="GetInterface">
									<plx:callObject>
										<plx:nameRef name="type" type="parameter"/>
									</plx:callObject>
									<plx:passParam>
										<plx:string>IEntity</plx:string>
									</plx:passParam>
								</plx:callInstance>
							</plx:left>
							<plx:right>
								<plx:nullKeyword/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:throw>
						<plx:callNew dataTypeName="ArgumentException" dataTypeQualifier="System">
							<plx:passParam>
								<plx:string>Type Parameter must implement the IEntity interface.</plx:string>
							</plx:passParam>
						</plx:callNew>
					</plx:throw>
				</plx:branch>
				<plx:return>
					<plx:cast type="testCast" dataTypeName="IEntity">
						<plx:callStatic name="CoreCreate" dataTypeName="EntityFactoryBase">
							<plx:passParam>
								<plx:nameRef name="type" type="parameter"/>
							</plx:passParam>
						</plx:callStatic>
					</plx:cast>
				</plx:return>
			</plx:function>
			<plx:function name="CreateReadOnlyEntity" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Create an entity based on a string from a view.  It will autodiscover the type based on any information we can gather.
</summary>
						<param name="typeString"></param>
						<param name="defaultType"></param>
						<returns>Object</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="typeString" dataTypeName=".string"/>
				<plx:param name="defaultType" dataTypeName="Type" dataTypeQualifier="System"/>
				<plx:returns dataTypeName=".object"/>
				<plx:return>
					<plx:callStatic name="CoreCreate" dataTypeName="EntityFactoryBase">
						<plx:passParam>
							<plx:nameRef name="typeString" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:nameRef name="defaultType" type="parameter"/>
						</plx:passParam>
					</plx:callStatic>
				</plx:return>
			</plx:function>
			<plx:function name="CreateReadOnlyEntity" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Creates an view object.
</summary>
						<param name="type">known type to create</param>
						<returns>created view ReadOnlyEntity entity object</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="type" dataTypeName="Type" dataTypeQualifier="System"/>
				<plx:returns dataTypeName=".object"/>
				<plx:return>
					<plx:callStatic name="CoreCreate" dataTypeName="EntityFactoryBase">
						<plx:passParam>
							<plx:nameRef name="type" type="parameter"/>
						</plx:passParam>
					</plx:callStatic>
				</plx:return>
			</plx:function>
			<plx:function name="CoreCreate" visibility="private" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Create an entity based on a string.  It will autodiscover the type based on any information we can gather.
</summary>
						<param name="typeString"></param>
						<param name="defaultType"></param>
						<returns>object</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="typeString" dataTypeName=".string"/>
				<plx:param name="defaultType" dataTypeName="Type" dataTypeQualifier="System"/>
				<plx:returns dataTypeName=".object"/>
				<plx:branch>
					<plx:condition>
						<plx:callStatic name="IsNullOrEmpty" dataTypeName=".string">
							<plx:passParam>
								<plx:nameRef name="typeString" type="parameter"/>
							</plx:passParam>
						</plx:callStatic>
					</plx:condition>
					<plx:throw>
						<plx:callNew dataTypeName="ArgumentException" dataTypeQualifier="System">
							<plx:passParam>
								<plx:string>Entity can not be null or empty when being passed into the factory.</plx:string>
							</plx:passParam>
						</plx:callNew>
					</plx:throw>
				</plx:branch>
				<plx:assign>
					<plx:left>
						<plx:nameRef name="typeString" type="parameter"/>
					</plx:left>
					<plx:right>
						<plx:callStatic name="Format" dataTypeName=".string">
							<plx:passParam>
								<plx:string>{0}.{1}</plx:string>
							</plx:passParam>
							<plx:passParam>
								<plx:callStatic name="currentEntityAssemblyNamespace" type="field" dataTypeName="EntityFactoryBase"/>
							</plx:passParam>
							<plx:passParam>
								<plx:nameRef name="typeString" type="parameter"/>
							</plx:passParam>
						</plx:callStatic>
					</plx:right>
				</plx:assign>
				<plx:lock>
					<plx:initialize>
						<plx:callStatic name="syncRoot" type="field" dataTypeName="EntityFactoryBase"/>
					</plx:initialize>
					<plx:branch>
						<plx:condition>
							<plx:callInstance name="ContainsKey">
								<plx:callObject>
									<plx:callStatic name="internalTypeCache" type="field" dataTypeName="EntityFactoryBase"/>
								</plx:callObject>
								<plx:passParam>
									<plx:nameRef name="typeString" type="parameter"/>
								</plx:passParam>
							</plx:callInstance>
						</plx:condition>
						<plx:return>
							<plx:callStatic name="CoreCreate" dataTypeName="EntityFactoryBase">
								<plx:passParam>
									<plx:callInstance name=".implied" type="indexerCall">
										<plx:callObject>
											<plx:callStatic name="internalTypeCache" type="field" dataTypeName="EntityFactoryBase"/>
										</plx:callObject>
										<plx:passParam>
											<plx:nameRef name="typeString" type="parameter"/>
										</plx:passParam>
									</plx:callInstance>
								</plx:passParam>
							</plx:callStatic>
						</plx:return>
					</plx:branch>
				</plx:lock>
				<plx:local name="targetType" dataTypeName="Type" dataTypeQualifier="System">
					<plx:initialize>
						<plx:callStatic name="ResolveType" dataTypeName="EntityFactoryBase">
							<plx:passParam>
								<plx:nameRef name="typeString" type="parameter"/>
							</plx:passParam>
						</plx:callStatic>
					</plx:initialize>
				</plx:local>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="identityEquality">
							<plx:left>
								<plx:nameRef name="targetType"/>
							</plx:left>
							<plx:right>
								<plx:nullKeyword/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="identityEquality">
								<plx:left>
									<plx:nameRef name="defaultType" type="parameter"/>
								</plx:left>
								<plx:right>
									<plx:nullKeyword/>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:branch>
							<plx:condition>
								<plx:binaryOperator type="identityEquality">
									<plx:left>
										<plx:callStatic name="defaultCreationalNamespace" type="field" dataTypeName="EntityFactoryBase"/>
									</plx:left>
									<plx:right>
										<plx:nullKeyword/>
									</plx:right>
								</plx:binaryOperator>
							</plx:condition>
							<plx:throw>
								<plx:callNew dataTypeName="ArgumentException" dataTypeQualifier="System">
									<plx:passParam>
										<plx:callStatic name="Format" dataTypeName=".string">
											<plx:passParam>
												<plx:string>This type '{0}' can not be resolved.  Please ensure that your NetTiersService Section is correct in the configuration file.</plx:string>
											</plx:passParam>
											<plx:passParam>
												<plx:nameRef name="typeString" type="parameter"/>
											</plx:passParam>
										</plx:callStatic>
									</plx:passParam>
								</plx:callNew>
							</plx:throw>
						</plx:branch>
						<plx:assign>
							<plx:left>
								<plx:nameRef name="targetType"/>
							</plx:left>
							<plx:right>
								<plx:callStatic name="ResolveType" dataTypeName="EntityFactoryBase">
									<plx:passParam>
										<plx:nameRef name="typeString" type="parameter"/>
									</plx:passParam>
									<plx:passParam>
										<plx:callStatic name="defaultCreationalNamespace" type="field" dataTypeName="EntityFactoryBase"/>
									</plx:passParam>
								</plx:callStatic>
							</plx:right>
						</plx:assign>
					</plx:branch>
					<plx:fallbackBranch>
						<plx:assign>
							<plx:left>
								<plx:nameRef name="targetType"/>
							</plx:left>
							<plx:right>
								<plx:nameRef name="defaultType" type="parameter"/>
							</plx:right>
						</plx:assign>
					</plx:fallbackBranch>
				</plx:branch>
				<plx:return>
					<plx:callStatic name="CoreCreate" dataTypeName="EntityFactoryBase">
						<plx:passParam>
							<plx:nameRef name="targetType"/>
						</plx:passParam>
					</plx:callStatic>
				</plx:return>
			</plx:function>
			<plx:function name="CoreCreate" visibility="private" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Creates an object and begins .
</summary>
						<param name="type">known type to create</param>
						<returns>created object</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="type" dataTypeName="Type" dataTypeQualifier="System"/>
				<plx:returns dataTypeName=".object"/>
				<plx:lock>
					<plx:initialize>
						<plx:callStatic name="syncRoot" type="field" dataTypeName="EntityFactoryBase"/>
					</plx:initialize>
					<plx:branch>
						<plx:condition>
							<plx:unaryOperator type="booleanNot">
								<plx:callInstance name="ContainsValue">
									<plx:callObject>
										<plx:callStatic name="internalTypeCache" type="field" dataTypeName="EntityFactoryBase"/>
									</plx:callObject>
									<plx:passParam>
										<plx:nameRef name="type" type="parameter"/>
									</plx:passParam>
								</plx:callInstance>
							</plx:unaryOperator>
						</plx:condition>
						<plx:callInstance name="Add">
							<plx:callObject>
								<plx:callStatic name="internalTypeCache" type="field" dataTypeName="EntityFactoryBase"/>
							</plx:callObject>
							<plx:passParam>
								<plx:callInstance name="FullName" type="property">
									<plx:callObject>
										<plx:nameRef name="type" type="parameter"/>
									</plx:callObject>
								</plx:callInstance>
							</plx:passParam>
							<plx:passParam>
								<plx:nameRef name="type" type="parameter"/>
							</plx:passParam>
						</plx:callInstance>
					</plx:branch>
				</plx:lock>
				<plx:callStatic name="OnEntityCreating" dataTypeName="EntityFactoryBase">
					<plx:passParam>
						<plx:nameRef name="type" type="parameter"/>
					</plx:passParam>
				</plx:callStatic>
				<plx:local name="entity" dataTypeName=".object">
					<plx:initialize>
						<plx:callStatic name="CreateInstance" dataTypeName="Activator" dataTypeQualifier="System">
							<plx:passParam>
								<plx:nameRef name="type" type="parameter"/>
							</plx:passParam>
						</plx:callStatic>
					</plx:initialize>
				</plx:local>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="identityEquality">
							<plx:left>
								<plx:nameRef name="entity"/>
							</plx:left>
							<plx:right>
								<plx:nullKeyword/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:throw>
						<plx:callNew dataTypeName="ArgumentException" dataTypeQualifier="System">
							<plx:passParam>
								<plx:callStatic name="Format" dataTypeName=".string">
									<plx:passParam>
										<plx:string>This type '{0}' can not be resolved correctly to instatiate your entity.  Please ensure that your NetTiersService Section is correct in the configuration file.</plx:string>
									</plx:passParam>
									<plx:passParam>
										<plx:callInstance name="FullName" type="property">
											<plx:callObject>
												<plx:nameRef name="type" type="parameter"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:passParam>
								</plx:callStatic>
							</plx:passParam>
						</plx:callNew>
					</plx:throw>
				</plx:branch>
				<plx:callStatic name="OnEntityCreated" dataTypeName="EntityFactoryBase">
					<plx:passParam>
						<plx:cast type="testCast" dataTypeName="IEntity">
							<plx:nameRef name="entity"/>
						</plx:cast>
					</plx:passParam>
					<plx:passParam>
						<plx:nameRef name="type" type="parameter"/>
					</plx:passParam>
				</plx:callStatic>
				<plx:return>
					<plx:nameRef name="entity"/>
				</plx:return>
			</plx:function>
			<plx:function name="ResolveType" visibility="private" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Resolves a type based on a string.  It will attempt to Auto-Discover the type, 
based on it's fullname or partial names.
</summary>
						<param name="typeString">the string of the type to resolve</param>
						<returns>IEntity</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="typeString" dataTypeName=".string"/>
				<plx:returns dataTypeName="Type" dataTypeQualifier="System"/>
				<plx:return>
					<plx:callInstance name="GetType">
						<plx:callObject>
							<plx:callStatic name="currentAssembly" type="field" dataTypeName="EntityFactoryBase"/>
						</plx:callObject>
						<plx:passParam>
							<plx:nameRef name="typeString" type="parameter"/>
						</plx:passParam>
						<plx:passParam>
							<plx:falseKeyword/>
						</plx:passParam>
						<plx:passParam>
							<plx:trueKeyword/>
						</plx:passParam>
					</plx:callInstance>
				</plx:return>
			</plx:function>
			<plx:function name="ResolveType" visibility="private" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Resolves a type based on a string.  It will attempt to Auto-Discover the type, 
based on it's fullname or partial names.
</summary>
						<param name="typeString">the string of the type to resolve</param>
						<param name="defaultNamespace">the string of the type to resolve</param>
						<returns>IEntity</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="typeString" dataTypeName=".string"/>
				<plx:param name="defaultNamespace" dataTypeName=".string"/>
				<plx:returns dataTypeName="Type" dataTypeQualifier="System"/>
				<plx:return>
					<plx:callInstance name="GetType">
						<plx:callObject>
							<plx:callStatic name="currentAssembly" type="field" dataTypeName="EntityFactoryBase"/>
						</plx:callObject>
						<plx:passParam>
							<plx:callStatic name="Format" dataTypeName=".string">
								<plx:passParam>
									<plx:string>{0}.{1}</plx:string>
								</plx:passParam>
								<plx:passParam>
									<plx:nameRef name="defaultNamespace" type="parameter"/>
								</plx:passParam>
								<plx:passParam>
									<plx:nameRef name="typeString" type="parameter"/>
								</plx:passParam>
							</plx:callStatic>
						</plx:passParam>
						<plx:passParam>
							<plx:falseKeyword/>
						</plx:passParam>
						<plx:passParam>
							<plx:trueKeyword/>
						</plx:passParam>
					</plx:callInstance>
				</plx:return>
			</plx:function>
			<plx:function name="GetClassNameFromString" visibility="private" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Parses a string and gets the class name from a qualified name, based on [Type, Assembly]
</summary>
						<param name="typeString"></param>
						<example>
MyNamespace.MyType, MyNamespace
</example>
						<returns>string of the qualified classname</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="typeString" dataTypeName=".string"/>
				<plx:returns dataTypeName=".string"/>
				<plx:local name="commaIndex" dataTypeName=".i4">
					<plx:initialize>
						<plx:callInstance name="IndexOf">
							<plx:callObject>
								<plx:nameRef name="typeString" type="parameter"/>
							</plx:callObject>
							<plx:passParam>
								<plx:string>,</plx:string>
							</plx:passParam>
						</plx:callInstance>
					</plx:initialize>
				</plx:local>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="greaterThan">
							<plx:left>
								<plx:nameRef name="commaIndex"/>
							</plx:left>
							<plx:right>
								<plx:value data="0" type="i4"/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:return>
						<plx:callInstance name="Trim">
							<plx:callObject>
								<plx:callInstance name="Substring">
									<plx:callObject>
										<plx:nameRef name="typeString" type="parameter"/>
									</plx:callObject>
									<plx:passParam>
										<plx:value data="0" type="i4"/>
									</plx:passParam>
									<plx:passParam>
										<plx:nameRef name="commaIndex"/>
									</plx:passParam>
								</plx:callInstance>
							</plx:callObject>
						</plx:callInstance>
					</plx:return>
				</plx:branch>
				<plx:return>
					<plx:nameRef name="typeString" type="parameter"/>
				</plx:return>
			</plx:function>
			<plx:function name="GetAssemblyNameFromString" visibility="private" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Parses a string and gets the class name from a qualified name, based on [Type, Assembly]
</summary>
						<param name="typeString"></param>
						<example>
MyNamespace.MyType, MyNamespace
</example>
						<returns>string of the qualified Assembly Name</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="typeString" dataTypeName=".string"/>
				<plx:returns dataTypeName=".string"/>
				<plx:local name="commaIndex" dataTypeName=".i4">
					<plx:initialize>
						<plx:callInstance name="IndexOf">
							<plx:callObject>
								<plx:nameRef name="typeString" type="parameter"/>
							</plx:callObject>
							<plx:passParam>
								<plx:string>,</plx:string>
							</plx:passParam>
						</plx:callInstance>
					</plx:initialize>
				</plx:local>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="booleanAnd">
							<plx:left>
								<plx:binaryOperator type="greaterThan">
									<plx:left>
										<plx:nameRef name="commaIndex"/>
									</plx:left>
									<plx:right>
										<plx:value data="0" type="i4"/>
									</plx:right>
								</plx:binaryOperator>
							</plx:left>
							<plx:right>
								<plx:binaryOperator type="greaterThanOrEqual">
									<plx:left>
										<plx:callInstance name="Length" type="property">
											<plx:callObject>
												<plx:nameRef name="typeString" type="parameter"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:left>
									<plx:right>
										<plx:binaryOperator type="add">
											<plx:left>
												<plx:nameRef name="commaIndex"/>
											</plx:left>
											<plx:right>
												<plx:value data="1" type="i4"/>
											</plx:right>
										</plx:binaryOperator>
									</plx:right>
								</plx:binaryOperator>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:return>
						<plx:callInstance name="Trim">
							<plx:callObject>
								<plx:callInstance name="Substring">
									<plx:callObject>
										<plx:nameRef name="typeString" type="parameter"/>
									</plx:callObject>
									<plx:passParam>
										<plx:binaryOperator type="add">
											<plx:left>
												<plx:nameRef name="commaIndex"/>
											</plx:left>
											<plx:right>
												<plx:value data="1" type="i4"/>
											</plx:right>
										</plx:binaryOperator>
									</plx:passParam>
								</plx:callInstance>
							</plx:callObject>
						</plx:callInstance>
					</plx:return>
				</plx:branch>
				<plx:return>
					<plx:nameRef name="typeString" type="parameter"/>
				</plx:return>
			</plx:function>
			<plx:function name="FlushTypeCache" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Flushes the Internal Type Cache
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:callInstance name="Clear">
					<plx:callObject>
						<plx:callStatic name="internalTypeCache" type="field" dataTypeName="EntityFactoryBase"/>
					</plx:callObject>
				</plx:callInstance>
			</plx:function>
			<plx:function name="OnEntityCreating" visibility="private" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Used to fire the event just before an entity is creating.
</summary>
						<param name="type">The type.</param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="type" dataTypeName="Type" dataTypeQualifier="System"/>
				<plx:local name="handler" dataTypeName="EntityCreatingEventHandler" dataTypeQualifier="EntityFactoryBase">
					<plx:initialize>
						<plx:callStatic name="EntityCreating" type="field" dataTypeName="EntityFactoryBase"/>
					</plx:initialize>
				</plx:local>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="identityInequality">
							<plx:left>
								<plx:nameRef name="handler"/>
							</plx:left>
							<plx:right>
								<plx:nullKeyword/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:callInstance name=".implied" type="delegateCall">
						<plx:callObject>
							<plx:nameRef name="handler"/>
						</plx:callObject>
						<plx:passParam>
							<plx:nullKeyword/>
						</plx:passParam>
						<plx:passParam>
							<plx:callNew dataTypeName="EntityEventArgs" dataTypeQualifier="EntityFactoryBase">
								<plx:passParam>
									<plx:nullKeyword/>
								</plx:passParam>
								<plx:passParam>
									<plx:nameRef name="type" type="parameter"/>
								</plx:passParam>
							</plx:callNew>
						</plx:passParam>
					</plx:callInstance>
				</plx:branch>
			</plx:function>
			<plx:function name="OnEntityCreated" visibility="private" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Used to fire the an event when the entity has just been created.
</summary>
						<param name="entity">The entity.</param>
						<param name="type">The type.</param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="entity" dataTypeName="IEntity"/>
				<plx:param name="type" dataTypeName="Type" dataTypeQualifier="System"/>
				<plx:local name="handler" dataTypeName="EntityCreatedEventHandler" dataTypeQualifier="EntityFactoryBase">
					<plx:initialize>
						<plx:callStatic name="EntityCreated" type="field" dataTypeName="EntityFactoryBase"/>
					</plx:initialize>
				</plx:local>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="identityInequality">
							<plx:left>
								<plx:nameRef name="handler"/>
							</plx:left>
							<plx:right>
								<plx:nullKeyword/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:callInstance name=".implied" type="delegateCall">
						<plx:callObject>
							<plx:nameRef name="handler"/>
						</plx:callObject>
						<plx:passParam>
							<plx:nullKeyword/>
						</plx:passParam>
						<plx:passParam>
							<plx:callNew dataTypeName="EntityEventArgs" dataTypeQualifier="EntityFactoryBase">
								<plx:passParam>
									<plx:nameRef name="entity" type="parameter"/>
								</plx:passParam>
								<plx:passParam>
									<plx:nameRef name="type" type="parameter"/>
								</plx:passParam>
							</plx:callNew>
						</plx:passParam>
					</plx:callInstance>
				</plx:branch>
			</plx:function>
			<plx:function name=".construct" visibility="protected"/>
			<plx:function name=".construct" visibility="private" modifier="static">
				<plx:assign>
					<plx:left>
						<plx:callStatic name="currentAssembly" type="field" dataTypeName="EntityFactoryBase"/>
					</plx:left>
					<plx:right>
						<plx:callInstance name="Assembly" type="property">
							<plx:callObject>
								<plx:typeOf dataTypeName="EntityFactoryBase"/>
							</plx:callObject>
						</plx:callInstance>
					</plx:right>
				</plx:assign>
				<plx:assign>
					<plx:left>
						<plx:callStatic name="defaultCreationalNamespace" type="field" dataTypeName="EntityFactoryBase"/>
					</plx:left>
					<plx:right>
						<plx:callInstance name="Namespace" type="property">
							<plx:callObject>
								<plx:typeOf dataTypeName="EntityFactoryBase"/>
							</plx:callObject>
						</plx:callInstance>
					</plx:right>
				</plx:assign>
				<plx:assign>
					<plx:left>
						<plx:callStatic name="internalTypeCache" type="field" dataTypeName="EntityFactoryBase"/>
					</plx:left>
					<plx:right>
						<plx:callNew dataTypeName="Dictionary" dataTypeQualifier="System.Collections.Generic">
							<plx:passTypeParam dataTypeName=".string"/>
							<plx:passTypeParam dataTypeName="Type" dataTypeQualifier="System"/>
						</plx:callNew>
					</plx:right>
				</plx:assign>
				<plx:assign>
					<plx:left>
						<plx:callStatic name="syncRoot" type="field" dataTypeName="EntityFactoryBase"/>
					</plx:left>
					<plx:right>
						<plx:callNew dataTypeName=".object"/>
					</plx:right>
				</plx:assign>
				<plx:assign>
					<plx:left>
						<plx:callStatic name="currentEntityAssemblyNamespace" type="field" dataTypeName="EntityFactoryBase"/>
					</plx:left>
					<plx:right>
						<plx:callStatic name="defaultCreationalNamespace" type="field" dataTypeName="EntityFactoryBase"/>
					</plx:right>
				</plx:assign>
			</plx:function>
			<plx:delegate name="EntityCreatingEventHandler" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
A delegate to handle <see cref="Entities.EntityFactoryBase.EntityCreating" /> events
</summary>
						<param name="sender"></param>
						<param name="e"></param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="sender" dataTypeName=".object"/>
				<plx:param name="e" dataTypeName="EntityEventArgs" dataTypeQualifier="EntityFactoryBase"/>
			</plx:delegate>
			<plx:delegate name="EntityCreatedEventHandler" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
A delegate to handle <see cref="Entities.EntityFactoryBase.EntityCreated" /> events
</summary>
						<param name="sender"></param>
						<param name="e"></param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="sender" dataTypeName=".object"/>
				<plx:param name="e" dataTypeName="EntityEventArgs" dataTypeQualifier="EntityFactoryBase"/>
			</plx:delegate>
			<plx:class name="EntityEventArgs" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Used to suppliment information for the EntityCreating and EntityCreated events.
</summary>
						<remarks>
The EntityCreating and EntityCreated events occur when an Entity is about to be created,
or just after an Entity is created.
</remarks>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:derivesFromClass dataTypeName="EventArgs" dataTypeQualifier="System"/>
				<plx:field name="entity" visibility="private" dataTypeName="IEntity"/>
				<plx:field name="creationalType" visibility="private" dataTypeName="Type" dataTypeQualifier="System"/>
				<plx:property name="Entity" visibility="public">
					<plx:leadingInfo>
						<plx:docComment>
							<summary>
The entity that is about to be created or has just been created.
</summary>
							<value>The entity.</value>
						</plx:docComment>
					</plx:leadingInfo>
					<plx:returns dataTypeName="IEntity"/>
					<plx:get>
						<plx:return>
							<plx:callThis name="entity" type="field"/>
						</plx:return>
					</plx:get>
				</plx:property>
				<plx:property name="CreationalType" visibility="public">
					<plx:leadingInfo>
						<plx:docComment>
							<summary>
Gets the type of the entity to be created.
</summary>
							<value>The type of the creational.</value>
						</plx:docComment>
					</plx:leadingInfo>
					<plx:returns dataTypeName="Type" dataTypeQualifier="System"/>
					<plx:get>
						<plx:return>
							<plx:callThis name="creationalType" type="field"/>
						</plx:return>
					</plx:get>
				</plx:property>
				<plx:function name=".construct" visibility="public">
					<plx:leadingInfo>
						<plx:docComment>
							<summary>
Initalizes a new Instance of the ComponentEntityEventArgs class.
</summary>
							<param name="entity">The entity.</param>
							<param name="type">The type.</param>
						</plx:docComment>
					</plx:leadingInfo>
					<plx:param name="entity" dataTypeName="IEntity"/>
					<plx:param name="type" dataTypeName="Type" dataTypeQualifier="System"/>
					<plx:assign>
						<plx:left>
							<plx:callThis name="entity" type="field"/>
						</plx:left>
						<plx:right>
							<plx:nameRef name="entity" type="parameter"/>
						</plx:right>
					</plx:assign>
					<plx:assign>
						<plx:left>
							<plx:callThis name="creationalType" type="field"/>
						</plx:left>
						<plx:right>
							<plx:nameRef name="type" type="parameter"/>
						</plx:right>
					</plx:assign>
				</plx:function>
			</plx:class>
		</plx:class>
	</xsl:template>
	<xsl:template name="EntityFactory">
		<plx:class name="EntityFactory" visibility="public">
			<plx:leadingInfo>
				<plx:docComment>
					<summary>
Entity Factory provides methods to create entity types from type names as strings.
</summary>
				</plx:docComment>
			</plx:leadingInfo>
			<plx:derivesFromClass dataTypeName="EntityFactoryBase"/>
			<plx:implementsInterface dataTypeName="IEntityFactory"/>
			<plx:function name=".construct" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Initializes a new instance of the <see cref="Entities.EntityFactory" /> class.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:assign>
					<plx:left>
						<plx:callThis name="CurrentEntityAssembly" type="property" accessor="base"/>
					</plx:left>
					<plx:right>
						<plx:callInstance name="Assembly" type="property">
							<plx:callObject>
								<plx:typeOf dataTypeName="EntityFactory"/>
							</plx:callObject>
						</plx:callInstance>
					</plx:right>
				</plx:assign>
			</plx:function>
		</plx:class>

	</xsl:template>
	<xsl:template name="EntityData">

	</xsl:template>
	<xsl:template name="EntityCache">
		<plx:class name="EntityCache" visibility="public" modifier="static">
			<plx:leadingInfo>
				<plx:docComment>
					<summary>
Entity Cache provides a caching mechanism for entities on a by entity level.
</summary>
				</plx:docComment>
			</plx:leadingInfo>
			<plx:field name="cacheManagerFactory" visibility="private" static="true" dataTypeName="CacheManagerFactory" dataTypeQualifier="Microsoft.Practices.EnterpriseLibrary.Caching"/>
			<plx:field name="cacheManager" visibility="private" static="true" dataTypeName="CacheManager" dataTypeQualifier="Microsoft.Practices.EnterpriseLibrary.Caching"/>
			<plx:field name="cacheManagerKey" visibility="private" static="true" dataTypeName=".string"/>
			<plx:field name="syncObject" visibility="private" static="true" dataTypeName=".object"/>
			<plx:field name="configurationFile" visibility="private" static="true" dataTypeName=".string"/>
			<plx:property name="CacheManager" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Gets the cache manager.
</summary>
						<value>The cache manager.</value>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:returns dataTypeName="CacheManager" dataTypeQualifier="Microsoft.Practices.EnterpriseLibrary.Caching"/>
				<plx:get>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="identityEquality">
								<plx:left>
									<plx:callStatic name="cacheManager" type="field" dataTypeName="EntityCache"/>
								</plx:left>
								<plx:right>
									<plx:nullKeyword/>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:assign>
							<plx:left>
								<plx:callStatic name="cacheManager" type="field" dataTypeName="EntityCache"/>
							</plx:left>
							<plx:right>
								<plx:callInstance name="Create">
									<plx:callObject>
										<plx:callStatic name="CacheManagerFactory" type="property" dataTypeName="EntityCache"/>
									</plx:callObject>
									<plx:passParam>
										<plx:callStatic name="cacheManagerKey" type="field" dataTypeName="EntityCache"/>
									</plx:passParam>
								</plx:callInstance>
							</plx:right>
						</plx:assign>
					</plx:branch>
					<plx:return>
						<plx:callStatic name="cacheManager" type="field" dataTypeName="EntityCache"/>
					</plx:return>
				</plx:get>
			</plx:property>
			<plx:property name="ConfigurationFile" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Gets or sets the configuration file.
</summary>
						<value>The configuration file.</value>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:returns dataTypeName=".string"/>
				<plx:get>
					<plx:return>
						<plx:callStatic name="configurationFile" type="field" dataTypeName="EntityCache"/>
					</plx:return>
				</plx:get>
				<plx:set>
					<plx:lock>
						<plx:initialize>
							<plx:callStatic name="syncObject" type="field" dataTypeName="EntityCache"/>
						</plx:initialize>
						<plx:assign>
							<plx:left>
								<plx:callStatic name="configurationFile" type="field" dataTypeName="EntityCache"/>
							</plx:left>
							<plx:right>
								<plx:nameRef name="value" type="parameter"/>
							</plx:right>
						</plx:assign>
					</plx:lock>
				</plx:set>
			</plx:property>
			<plx:property name="CacheManagerFactory" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Gets or sets the cache manager factory.
</summary>
						<value>The cache manager factory.</value>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:returns dataTypeName="CacheManagerFactory" dataTypeQualifier="Microsoft.Practices.EnterpriseLibrary.Caching"/>
				<plx:get>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="identityEquality">
								<plx:left>
									<plx:callStatic name="cacheManagerFactory" type="field" dataTypeName="EntityCache"/>
								</plx:left>
								<plx:right>
									<plx:nullKeyword/>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:lock>
							<plx:initialize>
								<plx:callStatic name="syncObject" type="field" dataTypeName="EntityCache"/>
							</plx:initialize>
							<plx:local name="configurationSource" dataTypeName="IConfigurationSource" dataTypeQualifier="Microsoft.Practices.EnterpriseLibrary.Common.Configuration">
								<plx:initialize>
									<plx:nullKeyword/>
								</plx:initialize>
							</plx:local>
							<plx:branch>
								<plx:condition>
									<plx:binaryOperator type="booleanAnd">
										<plx:left>
											<plx:binaryOperator type="identityInequality">
												<plx:left>
													<plx:callStatic name="ConfigurationFile" type="property" dataTypeName="EntityCache"/>
												</plx:left>
												<plx:right>
													<plx:nullKeyword/>
												</plx:right>
											</plx:binaryOperator>
										</plx:left>
										<plx:right>
											<plx:callStatic name="Exists" dataTypeName="File" dataTypeQualifier="System.IO">
												<plx:passParam>
													<plx:callStatic name="ConfigurationFile" type="property" dataTypeName="EntityCache"/>
												</plx:passParam>
											</plx:callStatic>
										</plx:right>
									</plx:binaryOperator>
								</plx:condition>
								<plx:assign>
									<plx:left>
										<plx:nameRef name="configurationSource"/>
									</plx:left>
									<plx:right>
										<plx:callNew dataTypeName="FileConfigurationSource" dataTypeQualifier="Microsoft.Practices.EnterpriseLibrary.Common.Configuration">
											<plx:passParam>
												<plx:callStatic name="ConfigurationFile" type="property" dataTypeName="EntityCache"/>
											</plx:passParam>
										</plx:callNew>
									</plx:right>
								</plx:assign>
								<plx:assign>
									<plx:left>
										<plx:callStatic name="cacheManagerFactory" type="field" dataTypeName="EntityCache"/>
									</plx:left>
									<plx:right>
										<plx:callNew dataTypeName="CacheManagerFactory" dataTypeQualifier="Microsoft.Practices.EnterpriseLibrary.Caching">
											<plx:passParam>
												<plx:nameRef name="configurationSource"/>
											</plx:passParam>
										</plx:callNew>
									</plx:right>
								</plx:assign>
							</plx:branch>
							<plx:fallbackBranch>
								<plx:try>
									<plx:local name="userConfiguration" dataTypeName="IConfigurationSource" dataTypeQualifier="Microsoft.Practices.EnterpriseLibrary.Common.Configuration">
										<plx:initialize>
											<plx:callNew dataTypeName="SystemConfigurationSource" dataTypeQualifier="Microsoft.Practices.EnterpriseLibrary.Common.Configuration"/>
										</plx:initialize>
									</plx:local>
									<plx:assign>
										<plx:left>
											<plx:callStatic name="cacheManagerFactory" type="field" dataTypeName="EntityCache"/>
										</plx:left>
										<plx:right>
											<plx:callNew dataTypeName="CacheManagerFactory" dataTypeQualifier="Microsoft.Practices.EnterpriseLibrary.Caching">
												<plx:passParam>
													<plx:nameRef name="userConfiguration"/>
												</plx:passParam>
											</plx:callNew>
										</plx:right>
									</plx:assign>
									<plx:callInstance name="Create">
										<plx:callObject>
											<plx:callStatic name="cacheManagerFactory" type="field" dataTypeName="EntityCache"/>
										</plx:callObject>
										<plx:passParam>
											<plx:callStatic name="CacheManagerKey" type="property" dataTypeName="EntityCache"/>
										</plx:passParam>
									</plx:callInstance>
									<plx:catch dataTypeName="Exception" dataTypeQualifier="System">
										<plx:assign>
											<plx:left>
												<plx:callStatic name="cacheManagerFactory" type="field" dataTypeName="EntityCache"/>
											</plx:left>
											<plx:right>
												<plx:callNew dataTypeName="CacheManagerFactory" dataTypeQualifier="Microsoft.Practices.EnterpriseLibrary.Caching">
													<plx:passParam>
														<plx:callStatic name="GenerateConfiguration" dataTypeName="EntityCache"/>
													</plx:passParam>
												</plx:callNew>
											</plx:right>
										</plx:assign>
									</plx:catch>
								</plx:try>
							</plx:fallbackBranch>
						</plx:lock>
					</plx:branch>
					<plx:return>
						<plx:callStatic name="cacheManagerFactory" type="field" dataTypeName="EntityCache"/>
					</plx:return>
				</plx:get>
				<plx:set>
					<plx:assign>
						<plx:left>
							<plx:callStatic name="cacheManagerFactory" type="field" dataTypeName="EntityCache"/>
						</plx:left>
						<plx:right>
							<plx:nameRef name="value" type="parameter"/>
						</plx:right>
					</plx:assign>
				</plx:set>
			</plx:property>
			<plx:property name="CacheManagerKey" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Assigns the Default CacheManagerKey To Be Used.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:returns dataTypeName=".string"/>
				<plx:get>
					<plx:return>
						<plx:callStatic name="cacheManagerKey" type="field" dataTypeName="EntityCache"/>
					</plx:return>
				</plx:get>
				<plx:set>
					<plx:lock>
						<plx:initialize>
							<plx:callStatic name="syncObject" type="field" dataTypeName="EntityCache"/>
						</plx:initialize>
						<plx:assign>
							<plx:left>
								<plx:callStatic name="cacheManagerKey" type="field" dataTypeName="EntityCache"/>
							</plx:left>
							<plx:right>
								<plx:nameRef name="value" type="parameter"/>
							</plx:right>
						</plx:assign>
					</plx:lock>
				</plx:set>
			</plx:property>
			<plx:function name="GenerateConfiguration" visibility="internal" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Generates the configuration.
</summary>
						<returns>DictionaryConfigurationSource to Configure the cache</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:returns dataTypeName="DictionaryConfigurationSource" dataTypeQualifier="Microsoft.Practices.EnterpriseLibrary.Common.Configuration"/>
				<plx:local name="sections" dataTypeName="DictionaryConfigurationSource" dataTypeQualifier="Microsoft.Practices.EnterpriseLibrary.Common.Configuration">
					<plx:initialize>
						<plx:callNew dataTypeName="DictionaryConfigurationSource" dataTypeQualifier="Microsoft.Practices.EnterpriseLibrary.Common.Configuration"/>
					</plx:initialize>
				</plx:local>
				<plx:callInstance name="Add">
					<plx:callObject>
						<plx:nameRef name="sections"/>
					</plx:callObject>
					<plx:passParam>
						<plx:string>cachingConfiguration</plx:string>
					</plx:passParam>
					<plx:passParam>
						<plx:callStatic name="GenerateDefaultCacheManagerSettings" dataTypeName="EntityCache"/>
					</plx:passParam>
				</plx:callInstance>
				<plx:return>
					<plx:nameRef name="sections"/>
				</plx:return>
			</plx:function>
			<plx:function name="GenerateDefaultCacheManagerSettings" visibility="private" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Generates the default cache manager settings.
</summary>
						<returns></returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:returns dataTypeName="CacheManagerSettings" dataTypeQualifier="Microsoft.Practices.EnterpriseLibrary.Caching.Configuration"/>
				<plx:local name="settings" dataTypeName="CacheManagerSettings" dataTypeQualifier="Microsoft.Practices.EnterpriseLibrary.Caching.Configuration">
					<plx:initialize>
						<plx:callNew dataTypeName="CacheManagerSettings" dataTypeQualifier="Microsoft.Practices.EnterpriseLibrary.Caching.Configuration"/>
					</plx:initialize>
				</plx:local>
				<plx:callInstance name="Add">
					<plx:callObject>
						<plx:callInstance name="BackingStores" type="property">
							<plx:callObject>
								<plx:nameRef name="settings"/>
							</plx:callObject>
						</plx:callInstance>
					</plx:callObject>
					<plx:passParam>
						<plx:callNew dataTypeName="CacheStorageData" dataTypeQualifier="Microsoft.Practices.EnterpriseLibrary.Caching.Configuration">
							<plx:passParam>
								<plx:string>inMemoryWithEncryptor</plx:string>
							</plx:passParam>
							<plx:passParam>
								<plx:typeOf dataTypeName="NullBackingStore" dataTypeQualifier="Microsoft.Practices.EnterpriseLibrary.Caching.BackingStoreImplementations"/>
							</plx:passParam>
							<plx:passParam>
								<plx:string>dpapiEncryptor</plx:string>
							</plx:passParam>
						</plx:callNew>
					</plx:passParam>
				</plx:callInstance>
				<plx:callInstance name="Add">
					<plx:callObject>
						<plx:callInstance name="EncryptionProviders" type="property">
							<plx:callObject>
								<plx:nameRef name="settings"/>
							</plx:callObject>
						</plx:callInstance>
					</plx:callObject>
					<plx:passParam>
						<plx:callNew dataTypeName="SymmetricStorageEncryptionProviderData" dataTypeQualifier="Microsoft.Practices.EnterpriseLibrary.Caching.Cryptography.Configuration">
							<plx:passParam>
								<plx:string>dpapiEncryptor</plx:string>
							</plx:passParam>
							<plx:passParam>
								<plx:string>dpapi1</plx:string>
							</plx:passParam>
						</plx:callNew>
					</plx:passParam>
				</plx:callInstance>
				<plx:callInstance name="Add">
					<plx:callObject>
						<plx:callInstance name="CacheManagers" type="property">
							<plx:callObject>
								<plx:nameRef name="settings"/>
							</plx:callObject>
						</plx:callInstance>
					</plx:callObject>
					<plx:passParam>
						<plx:callNew dataTypeName="CacheManagerData" dataTypeQualifier="Microsoft.Practices.EnterpriseLibrary.Caching.Configuration">
							<plx:passParam>
								<plx:callStatic name="cacheManagerKey" type="field" dataTypeName="EntityCache"/>
							</plx:passParam>
							<plx:passParam>
								<plx:value data="10000" type="i4"/>
							</plx:passParam>
							<plx:passParam>
								<plx:value data="1000" type="i4"/>
							</plx:passParam>
							<plx:passParam>
								<plx:value data="100" type="i4"/>
							</plx:passParam>
							<plx:passParam>
								<plx:string>inMemoryWithEncryptor</plx:string>
							</plx:passParam>
						</plx:callNew>
					</plx:passParam>
				</plx:callInstance>
				<plx:return>
					<plx:nameRef name="settings"/>
				</plx:return>
			</plx:function>
			<plx:function name="RemoveItem" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Removes the item.
</summary>
						<param name="id">The id.</param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="id" dataTypeName=".string"/>
				<plx:callInstance name="Remove">
					<plx:callObject>
						<plx:callStatic name="CacheManager" type="property" dataTypeName="EntityCache"/>
					</plx:callObject>
					<plx:passParam>
						<plx:nameRef name="id" type="parameter"/>
					</plx:passParam>
				</plx:callInstance>
			</plx:function>
			<plx:function name="FlushCacheManager" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Flushes the cache manager.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:assign>
					<plx:left>
						<plx:callStatic name="cacheManager" type="field" dataTypeName="EntityCache"/>
					</plx:left>
					<plx:right>
						<plx:nullKeyword/>
					</plx:right>
				</plx:assign>
			</plx:function>
			<plx:function name="FlushCache" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Flushes the cache.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:callInstance name="Flush">
					<plx:callObject>
						<plx:callStatic name="CacheManager" type="property" dataTypeName="EntityCache"/>
					</plx:callObject>
				</plx:callInstance>
			</plx:function>
			<plx:function name="AddCache" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Adds the cache.
</summary>
						<param name="id">The id.</param>
						<param name="entity">The entity.</param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="id" dataTypeName=".string"/>
				<plx:param name="entity" dataTypeName=".object"/>
				<plx:callInstance name="Add">
					<plx:callObject>
						<plx:callStatic name="CacheManager" type="property" dataTypeName="EntityCache"/>
					</plx:callObject>
					<plx:passParam>
						<plx:nameRef name="id" type="parameter"/>
					</plx:passParam>
					<plx:passParam>
						<plx:nameRef name="entity" type="parameter"/>
					</plx:passParam>
				</plx:callInstance>
			</plx:function>
			<plx:function name="GetItem" visibility="public" modifier="static">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Gets the item.
</summary>
						<param name="id">The id.</param>
						<returns></returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:typeParam name="T" requireReferenceType="true"/>
				<plx:param name="id" dataTypeName=".string"/>
				<plx:returns dataTypeName="T"/>
				<plx:return>
					<plx:cast type="testCast" dataTypeName="T">
						<plx:callInstance name="GetData">
							<plx:callObject>
								<plx:callStatic name="CacheManager" type="property" dataTypeName="EntityCache"/>
							</plx:callObject>
							<plx:passParam>
								<plx:nameRef name="id" type="parameter"/>
							</plx:passParam>
						</plx:callInstance>
					</plx:cast>
				</plx:return>
			</plx:function>
			<plx:function name=".construct" visibility="private" modifier="static">
				<plx:assign>
					<plx:left>
						<plx:callStatic name="cacheManagerKey" type="field" dataTypeName="EntityCache"/>
					</plx:left>
					<plx:right>
						<plx:string><xsl:value-of select="$BLLNamespace"/>EntityCache</plx:string>
					</plx:right>
				</plx:assign>
				<plx:assign>
					<plx:left>
						<plx:callStatic name="syncObject" type="field" dataTypeName="EntityCache"/>
					</plx:left>
					<plx:right>
						<plx:callNew dataTypeName=".object"/>
					</plx:right>
				</plx:assign>
			</plx:function>
		</plx:class>
	</xsl:template>
	<xsl:template name="EntityBaseCore.generated">
		<plx:class name="EntityBaseCore" visibility="public" modifier="abstract" defaultMember="Item" partial="true">
			<plx:leadingInfo>
				<plx:docComment>
					<summary>
The base object for each database table entity.
</summary>
				</plx:docComment>
			</plx:leadingInfo>
			<plx:attribute dataTypeName="SerializableAttribute" dataTypeQualifier="System"/>
			<plx:implementsInterface dataTypeName="IEntity"/>
			<plx:implementsInterface dataTypeName="INotifyPropertyChanged" dataTypeQualifier="System.ComponentModel"/>
			<plx:implementsInterface dataTypeName="IDataErrorInfo" dataTypeQualifier="System.ComponentModel"/>
			<plx:implementsInterface dataTypeName="IDeserializationCallback" dataTypeQualifier="System.Runtime.Serialization"/>
			<plx:field name="isEntityTracked" visibility="private" dataTypeName=".boolean">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Determines whether the entity is being tracked by the Locator.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:attribute dataTypeName="NonSerializedAttribute" dataTypeQualifier="System"/>
			</plx:field>
			<plx:field name="suppressEntityEvents" visibility="private" dataTypeName=".boolean">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Suppresses Entity Events from Firing, 
useful when loading the entities from the database.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:attribute dataTypeName="NonSerializedAttribute" dataTypeQualifier="System"/>
			</plx:field>
			<plx:field name="bindingIsNew" visibility="protected" dataTypeName=".boolean">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Used by in place editing of databinding features for new inserted row.
Indicates that we are in the middle of an IBinding insert transaction.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:attribute dataTypeName="NonSerializedAttribute" dataTypeQualifier="System"/>
			</plx:field>
			<plx:field name="entityHashCode" visibility="private" dataTypeName=".string">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
The actual hashcode of the entity.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
			</plx:field>
			<plx:field name="tag" visibility="private" dataTypeName=".object">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Object that contains data to associate with this object
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:attribute dataTypeName="NonSerializedAttribute" dataTypeQualifier="System"/>
			</plx:field>
			<plx:field name="_validationRules" visibility="private" dataTypeName="ValidationRules" dataTypeQualifier="Validation">
				<plx:attribute dataTypeName="NonSerializedAttribute" dataTypeQualifier="System"/>
			</plx:field>
			<plx:property name="EntityTableName" visibility="public" modifier="abstract">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
The name of the underlying database table.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:returns dataTypeName=".string"/>
				<plx:get/>
			</plx:property>
			<plx:property name="TableColumns" visibility="public" modifier="abstract">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
The name of the underlying database table's columns.
</summary>
						<value>A string array that holds the columns names.</value>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:returns dataTypeIsSimpleArray="true" dataTypeName=".string"/>
				<plx:get/>
			</plx:property>
			<plx:property name="IsDeleted" visibility="public" modifier="virtual">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
True if object has been <see cref="Entities.EntityBaseCore.MarkToDelete" />. ReadOnly.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<xsl:if test="$settings[@name='SerializeEntityState']">
					<plx:attribute dataTypeName="XmlIgnoreAttribute" dataTypeQualifier="System.Xml.Serialization"/>
				</xsl:if>
				<plx:attribute dataTypeName="BrowsableAttribute" dataTypeQualifier="System.ComponentModel">
					<plx:passParam>
						<plx:falseKeyword/>
					</plx:passParam>
				</plx:attribute>
				<plx:interfaceMember memberName="IsDeleted" dataTypeName="IEntity"/>
				<plx:returns dataTypeName=".boolean"/>
				<plx:get>
					<plx:return>
						<plx:binaryOperator type="equality">
							<plx:left>
								<plx:callThis name="EntityState" type="property"/>
							</plx:left>
							<plx:right>
								<plx:callStatic name="Deleted" type="field" dataTypeName="EntityState"/>
							</plx:right>
						</plx:binaryOperator>
					</plx:return>
				</plx:get>
			</plx:property>
			<plx:property name="IsDirty" visibility="public" modifier="virtual">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Indicates if the object has been modified from its original state.
</summary>
						<remarks>True if object has been modified from its original state; otherwise False;</remarks>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:attribute dataTypeName="XmlIgnoreAttribute" dataTypeQualifier="System.Xml.Serialization"/>
				<plx:attribute dataTypeName="BrowsableAttribute" dataTypeQualifier="System.ComponentModel">
					<plx:passParam>
						<plx:falseKeyword/>
					</plx:passParam>
				</plx:attribute>
				<plx:interfaceMember memberName="IsDirty" dataTypeName="IEntity"/>
				<plx:returns dataTypeName=".boolean"/>
				<plx:get>
					<plx:return>
						<plx:binaryOperator type="inequality">
							<plx:left>
								<plx:callThis name="EntityState" type="property"/>
							</plx:left>
							<plx:right>
								<plx:callStatic name="Unchanged" type="field" dataTypeName="EntityState"/>
							</plx:right>
						</plx:binaryOperator>
					</plx:return>
				</plx:get>
			</plx:property>
			<plx:property name="IsNew" visibility="public" modifier="virtual">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Indicates if the object is new.
</summary>
						<remarks>True if objectis new; otherwise False;</remarks>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:attribute dataTypeName="BrowsableAttribute" dataTypeQualifier="System.ComponentModel">
					<plx:passParam>
						<plx:falseKeyword/>
					</plx:passParam>
				</plx:attribute>
				<plx:attribute dataTypeName="XmlIgnoreAttribute" dataTypeQualifier="System.Xml.Serialization"/>
				<plx:interfaceMember memberName="IsNew" dataTypeName="IEntity"/>
				<plx:returns dataTypeName=".boolean"/>
				<plx:get>
					<plx:return>
						<plx:binaryOperator type="equality">
							<plx:left>
								<plx:callThis name="EntityState" type="property"/>
							</plx:left>
							<plx:right>
								<plx:callStatic name="Added" type="field" dataTypeName="EntityState"/>
							</plx:right>
						</plx:binaryOperator>
					</plx:return>
				</plx:get>
				<plx:set>
					<plx:assign>
						<plx:left>
							<plx:callThis name="EntityState" type="property"/>
						</plx:left>
						<plx:right>
							<plx:callStatic name="Added" type="field" dataTypeName="EntityState"/>
						</plx:right>
					</plx:assign>
				</plx:set>
			</plx:property>
			<plx:property name="EntityState" visibility="public" modifier="abstract">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Indicates state of object
</summary>
						<remarks>0=Unchanged, 1=Added, 2=Changed</remarks>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:attribute dataTypeName="BrowsableAttribute" dataTypeQualifier="System.ComponentModel">
					<plx:passParam>
						<plx:falseKeyword/>
					</plx:passParam>
				</plx:attribute>
				<plx:attribute dataTypeName="XmlIgnoreAttribute" dataTypeQualifier="System.Xml.Serialization"/>
				<plx:interfaceMember memberName="EntityState" dataTypeName="IEntity"/>
				<plx:returns dataTypeName="EntityState"/>
				<plx:get/>
				<plx:set/>
			</plx:property>
			<plx:property name="ParentCollection" visibility="public" modifier="abstract">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Gets or sets the parent collection.
</summary>
						<value>The parent collection.</value>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:attribute dataTypeName="XmlIgnoreAttribute" dataTypeQualifier="System.Xml.Serialization"/>
				<plx:interfaceMember memberName="ParentCollection" dataTypeName="IEntity"/>
				<plx:returns dataTypeName=".object"/>
				<plx:get/>
				<plx:set/>
			</plx:property>
			<plx:property name="Tag" visibility="public" modifier="virtual">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Gets or sets the object that contains supplemental data about this object.
</summary>
						<value>Object</value>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:attribute dataTypeName="DescriptionAttribute" dataTypeQualifier="System.ComponentModel">
					<plx:passParam>
						<plx:string>Object containing data to be associated with this object</plx:string>
					</plx:passParam>
				</plx:attribute>
				<plx:attribute dataTypeName="LocalizableAttribute" dataTypeQualifier="System.ComponentModel">
					<plx:passParam>
						<plx:falseKeyword/>
					</plx:passParam>
				</plx:attribute>
				<plx:attribute dataTypeName="BindableAttribute" dataTypeQualifier="System.ComponentModel">
					<plx:passParam>
						<plx:falseKeyword/>
					</plx:passParam>
				</plx:attribute>
				<plx:interfaceMember memberName="Tag" dataTypeName="IEntity"/>
				<plx:returns dataTypeName=".object"/>
				<plx:get>
					<plx:return>
						<plx:callThis name="tag" type="field"/>
					</plx:return>
				</plx:get>
				<plx:set>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="identityInequality">
								<plx:left>
									<plx:callThis name="tag" type="field"/>
								</plx:left>
								<plx:right>
									<plx:nameRef name="value" type="parameter"/>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:assign>
							<plx:left>
								<plx:callThis name="tag" type="field"/>
							</plx:left>
							<plx:right>
								<plx:nameRef name="value" type="parameter"/>
							</plx:right>
						</plx:assign>
					</plx:branch>
				</plx:set>
			</plx:property>
			<plx:property name="IsEntityTracked" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Determines whether this entity is being tracked.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:attribute dataTypeName="XmlIgnoreAttribute" dataTypeQualifier="System.Xml.Serialization"/>
				<plx:attribute dataTypeName="BindableAttribute" dataTypeQualifier="System.ComponentModel">
					<plx:passParam>
						<plx:falseKeyword/>
					</plx:passParam>
				</plx:attribute>
				<plx:attribute dataTypeName="BrowsableAttribute" dataTypeQualifier="System.ComponentModel">
					<plx:passParam>
						<plx:falseKeyword/>
					</plx:passParam>
				</plx:attribute>
				<plx:interfaceMember memberName="IsEntityTracked" dataTypeName="IEntity"/>
				<plx:returns dataTypeName=".boolean"/>
				<plx:get>
					<plx:return>
						<plx:callThis name="isEntityTracked" type="field"/>
					</plx:return>
				</plx:get>
				<plx:set>
					<plx:assign>
						<plx:left>
							<plx:callThis name="isEntityTracked" type="field"/>
						</plx:left>
						<plx:right>
							<plx:nameRef name="value" type="parameter"/>
						</plx:right>
					</plx:assign>
				</plx:set>
			</plx:property>
			<plx:property name="SuppressEntityEvents" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Determines whether this entity is to suppress events while set to true.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:attribute dataTypeName="BindableAttribute" dataTypeQualifier="System.ComponentModel">
					<plx:passParam>
						<plx:falseKeyword/>
					</plx:passParam>
				</plx:attribute>
				<plx:attribute dataTypeName="XmlIgnoreAttribute" dataTypeQualifier="System.Xml.Serialization"/>
				<plx:attribute dataTypeName="BrowsableAttribute" dataTypeQualifier="System.ComponentModel">
					<plx:passParam>
						<plx:falseKeyword/>
					</plx:passParam>
				</plx:attribute>
				<plx:returns dataTypeName=".boolean"/>
				<plx:get>
					<plx:return>
						<plx:callThis name="suppressEntityEvents" type="field"/>
					</plx:return>
				</plx:get>
				<plx:set>
					<plx:assign>
						<plx:left>
							<plx:callThis name="suppressEntityEvents" type="field"/>
						</plx:left>
						<plx:right>
							<plx:nameRef name="value" type="parameter"/>
						</plx:right>
					</plx:assign>
				</plx:set>
			</plx:property>
			<plx:property name="EntityTrackingKey" visibility="public" modifier="abstract">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Provides the tracking key for the <see cref="Entities.EntityLocator" />
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:attribute dataTypeName="XmlIgnoreAttribute" dataTypeQualifier="System.Xml.Serialization"/>
				<plx:attribute dataTypeName="BrowsableAttribute" dataTypeQualifier="System.ComponentModel">
					<plx:passParam>
						<plx:falseKeyword/>
					</plx:passParam>
				</plx:attribute>
				<plx:interfaceMember memberName="EntityTrackingKey" dataTypeName="IEntity"/>
				<plx:returns dataTypeName=".string"/>
				<plx:get/>
				<plx:set/>
			</plx:property>
			<plx:property name="Error" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Gets an error message indicating what is wrong with this object.
</summary>
						<value></value>
						<returns>An error message indicating what is wrong with this object. The default is an empty string ("").</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:returns dataTypeName=".string"/>
				<plx:get>
					<plx:local name="errorDescription" dataTypeName=".string">
						<plx:initialize>
							<plx:callStatic name="Empty" type="field" dataTypeName=".string"/>
						</plx:initialize>
					</plx:local>
					<plx:branch>
						<plx:condition>
							<plx:unaryOperator type="booleanNot">
								<plx:callThis name="IsValid" type="property"/>
							</plx:unaryOperator>
						</plx:condition>
						<plx:assign>
							<plx:left>
								<plx:nameRef name="errorDescription"/>
							</plx:left>
							<plx:right>
								<plx:callInstance name="ToString">
									<plx:callObject>
										<plx:callInstance name="GetBrokenRules">
											<plx:callObject>
												<plx:callThis name="ValidationRules" type="property"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:callObject>
								</plx:callInstance>
							</plx:right>
						</plx:assign>
					</plx:branch>
					<plx:return>
						<plx:nameRef name="errorDescription"/>
					</plx:return>
				</plx:get>
			</plx:property>
			<plx:property name="Item" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Gets the <see cref="T:String" /> with the specified column name.
</summary>
						<value></value>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="columnName" dataTypeName=".string"/>
				<plx:returns dataTypeName=".string"/>
				<plx:get>
					<plx:local name="errorDescription" dataTypeName=".string">
						<plx:initialize>
							<plx:callStatic name="Empty" type="field" dataTypeName=".string"/>
						</plx:initialize>
					</plx:local>
					<plx:branch>
						<plx:condition>
							<plx:unaryOperator type="booleanNot">
								<plx:callThis name="IsValid" type="property"/>
							</plx:unaryOperator>
						</plx:condition>
						<plx:assign>
							<plx:left>
								<plx:nameRef name="errorDescription"/>
							</plx:left>
							<plx:right>
								<plx:callInstance name="GetPropertyErrorDescriptions">
									<plx:callObject>
										<plx:callInstance name="GetBrokenRules">
											<plx:callObject>
												<plx:callThis name="ValidationRules" type="property"/>
											</plx:callObject>
										</plx:callInstance>
									</plx:callObject>
									<plx:passParam>
										<plx:nameRef name="columnName" type="parameter"/>
									</plx:passParam>
								</plx:callInstance>
							</plx:right>
						</plx:assign>
					</plx:branch>
					<plx:return>
						<plx:nameRef name="errorDescription"/>
					</plx:return>
				</plx:get>
			</plx:property>
			<plx:property name="ValidationRules" visibility="protected">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Returns the list of <see cref="Entities.Validation.ValidationRules" /> associated with this object.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:attribute dataTypeName="XmlIgnoreAttribute" dataTypeQualifier="System.Xml.Serialization"/>
				<plx:returns dataTypeName="ValidationRules" dataTypeQualifier="Validation"/>
				<plx:get>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="identityEquality">
								<plx:left>
									<plx:callThis name="_validationRules" type="field"/>
								</plx:left>
								<plx:right>
									<plx:nullKeyword/>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:assign>
							<plx:left>
								<plx:callThis name="_validationRules" type="field"/>
							</plx:left>
							<plx:right>
								<plx:callNew dataTypeName="ValidationRules" dataTypeQualifier="Validation">
									<plx:passParam>
										<plx:thisKeyword/>
									</plx:passParam>
								</plx:callNew>
							</plx:right>
						</plx:assign>
						<plx:callThis name="AddValidationRules"/>
					</plx:branch>
					<plx:return>
						<plx:callThis name="_validationRules" type="field"/>
					</plx:return>
				</plx:get>
			</plx:property>
			<plx:property name="IsValid" visibility="public" modifier="virtual">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Returns <see langword="true" /> if the object is valid, 
<see langword="false" /> if the object validation rules that have indicated failure. 
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:attribute dataTypeName="BrowsableAttribute" dataTypeQualifier="System.ComponentModel">
					<plx:passParam>
						<plx:falseKeyword/>
					</plx:passParam>
				</plx:attribute>
				<plx:interfaceMember memberName="IsValid" dataTypeName="IEntity"/>
				<plx:returns dataTypeName=".boolean"/>
				<plx:get>
					<plx:return>
						<plx:callInstance name="IsValid" type="property">
							<plx:callObject>
								<plx:callThis name="ValidationRules" type="property"/>
							</plx:callObject>
						</plx:callInstance>
					</plx:return>
				</plx:get>
			</plx:property>
			<plx:property name="BrokenRulesList" visibility="public" modifier="virtual">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Returns a list of all the validation rules that failed.
</summary>
						<returns>
							<see cref="Entities.Validation.BrokenRulesList" />
						</returns>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:attribute dataTypeName="XmlIgnoreAttribute" dataTypeQualifier="System.Xml.Serialization"/>
				<plx:returns dataTypeName="BrokenRulesList" dataTypeQualifier="Validation"/>
				<plx:get>
					<plx:return>
						<plx:callInstance name="GetBrokenRules">
							<plx:callObject>
								<plx:callThis name="ValidationRules" type="property"/>
							</plx:callObject>
						</plx:callInstance>
					</plx:return>
				</plx:get>
			</plx:property>
			<plx:event name="PropertyChanged" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Event to indicate that a property has changed.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:attribute type="implicitField" dataTypeName="NonSerializedAttribute" dataTypeQualifier="System"/>
				<plx:attribute type="implicitAccessorFunction" dataTypeName="MethodImplAttribute" dataTypeQualifier="System.Runtime.CompilerServices">
					<plx:passParam>
						<plx:callStatic name="Synchronized" type="field" dataTypeName="MethodImplOptions" dataTypeQualifier="System.Runtime.CompilerServices"/>
					</plx:passParam>
				</plx:attribute>
				<plx:interfaceMember memberName="PropertyChanged" dataTypeName="IEntity"/>
				<plx:param name="sender" dataTypeName=".object"/>
				<plx:param name="e" dataTypeName="PropertyChangedEventArgs" dataTypeQualifier="System.ComponentModel"/>
				<plx:explicitDelegateType dataTypeName="PropertyChangedEventHandler" dataTypeQualifier="System.ComponentModel"/>
			</plx:event>
			<plx:function name=".construct" visibility="protected">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Initializes a new instance of the <see cref="T:EntityBaseCore" /> class.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:assign>
					<plx:left>
						<plx:callThis name="isEntityTracked" type="field"/>
					</plx:left>
					<plx:right>
						<plx:falseKeyword/>
					</plx:right>
				</plx:assign>
				<plx:assign>
					<plx:left>
						<plx:callThis name="suppressEntityEvents" type="field"/>
					</plx:left>
					<plx:right>
						<plx:falseKeyword/>
					</plx:right>
				</plx:assign>
				<plx:assign>
					<plx:left>
						<plx:callThis name="bindingIsNew" type="field"/>
					</plx:left>
					<plx:right>
						<plx:trueKeyword/>
					</plx:right>
				</plx:assign>
			</plx:function>
			<plx:function name="AcceptChanges" visibility="public" modifier="virtual">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Accepts the changes made to this object.
</summary>
						<remarks>
After calling this method <see cref="Entities.EntityBaseCore.IsDirty" /> and <see cref="Entities.EntityBaseCore.IsNew" /> are false. <see cref="Entities.EntityBaseCore.IsDeleted" /> flag remain unchanged as it is handled by the parent List.
</remarks>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:interfaceMember memberName="AcceptChanges" dataTypeName="IEntity"/>
				<plx:assign>
					<plx:left>
						<plx:callThis name="bindingIsNew" type="field"/>
					</plx:left>
					<plx:right>
						<plx:falseKeyword/>
					</plx:right>
				</plx:assign>
				<plx:assign>
					<plx:left>
						<plx:callThis name="EntityState" type="property"/>
					</plx:left>
					<plx:right>
						<plx:callStatic name="Unchanged" type="field" dataTypeName="EntityState"/>
					</plx:right>
				</plx:assign>
				<plx:callThis name="OnPropertyChanged">
					<plx:passParam>
						<plx:callStatic name="Empty" type="field" dataTypeName=".string"/>
					</plx:passParam>
				</plx:callThis>
			</plx:function>
			<plx:function name="CancelChanges" visibility="public" modifier="abstract">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Revert all changes and restore original values.  To be implemented in concrete class.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
			</plx:function>
			<plx:function name="MarkToDelete" visibility="public" modifier="virtual">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Marks entity to be deleted.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:interfaceMember memberName="MarkToDelete" dataTypeName="IEntity"/>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="inequality">
							<plx:left>
								<plx:callThis name="EntityState" type="property"/>
							</plx:left>
							<plx:right>
								<plx:callStatic name="Added" type="field" dataTypeName="EntityState"/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:assign>
						<plx:left>
							<plx:callThis name="EntityState" type="property"/>
						</plx:left>
						<plx:right>
							<plx:callStatic name="Deleted" type="field" dataTypeName="EntityState"/>
						</plx:right>
					</plx:assign>
				</plx:branch>
			</plx:function>
			<plx:function name="RemoveDeleteMark" visibility="public" modifier="virtual">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Remove the "isDeleted" mark from the entity.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="inequality">
							<plx:left>
								<plx:callThis name="EntityState" type="property"/>
							</plx:left>
							<plx:right>
								<plx:callStatic name="Added" type="field" dataTypeName="EntityState"/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:assign>
						<plx:left>
							<plx:callThis name="EntityState" type="property"/>
						</plx:left>
						<plx:right>
							<plx:callStatic name="Changed" type="field" dataTypeName="EntityState"/>
						</plx:right>
					</plx:assign>
				</plx:branch>
			</plx:function>
			<plx:function name="GetHashCode" visibility="public" modifier="override">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Provides a unique HashCode throughout the lifetime of the entity.
</summary>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:returns dataTypeName=".i4"/>
				<plx:branch>
					<plx:condition>
						<plx:binaryOperator type="identityEquality">
							<plx:left>
								<plx:callThis name="entityHashCode" type="field"/>
							</plx:left>
							<plx:right>
								<plx:nullKeyword/>
							</plx:right>
						</plx:binaryOperator>
					</plx:condition>
					<plx:assign>
						<plx:left>
							<plx:callThis name="entityHashCode" type="field"/>
						</plx:left>
						<plx:right>
							<plx:callInstance name="ToString">
								<plx:callObject>
									<plx:callStatic name="NewGuid" dataTypeName="Guid" dataTypeQualifier="System"/>
								</plx:callObject>
							</plx:callInstance>
						</plx:right>
					</plx:assign>
				</plx:branch>
				<plx:return>
					<plx:callInstance name="GetHashCode">
						<plx:callObject>
							<plx:callThis name="entityHashCode" type="field"/>
						</plx:callObject>
					</plx:callInstance>
				</plx:return>
			</plx:function>
			<plx:function name="OnPropertyChanged" visibility="protected" modifier="virtual">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Called when a property is changed
</summary>
						<param name="propertyName">The name of the property that has changed.</param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="propertyName" dataTypeName=".string"/>
				<plx:branch>
					<plx:condition>
						<plx:unaryOperator type="booleanNot">
							<plx:callThis name="suppressEntityEvents" type="field"/>
						</plx:unaryOperator>
					</plx:condition>
					<plx:callThis name="OnPropertyChanged">
						<plx:passParam>
							<plx:callNew dataTypeName="PropertyChangedEventArgs" dataTypeQualifier="System.ComponentModel">
								<plx:passParam>
									<plx:nameRef name="propertyName" type="parameter"/>
								</plx:passParam>
							</plx:callNew>
						</plx:passParam>
					</plx:callThis>
				</plx:branch>
			</plx:function>
			<plx:function name="OnPropertyChanged" visibility="protected" modifier="virtual">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Called when a property is changed
</summary>
						<param name="e">PropertyChangedEventArgs</param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="e" dataTypeName="PropertyChangedEventArgs" dataTypeQualifier="System.ComponentModel"/>
				<plx:branch>
					<plx:condition>
						<plx:unaryOperator type="booleanNot">
							<plx:callThis name="suppressEntityEvents" type="field"/>
						</plx:unaryOperator>
					</plx:condition>
					<plx:callInstance name="ValidateRules">
						<plx:callObject>
							<plx:callThis name="ValidationRules" type="property"/>
						</plx:callObject>
						<plx:passParam>
							<plx:callInstance name="PropertyName" type="property">
								<plx:callObject>
									<plx:nameRef name="e" type="parameter"/>
								</plx:callObject>
							</plx:callInstance>
						</plx:passParam>
					</plx:callInstance>
					<plx:branch>
						<plx:condition>
							<plx:binaryOperator type="identityInequality">
								<plx:left>
									<plx:nullKeyword/>
								</plx:left>
								<plx:right>
									<plx:callThis name="PropertyChanged" type="field"/>
								</plx:right>
							</plx:binaryOperator>
						</plx:condition>
						<plx:callInstance name=".implied" type="delegateCall">
							<plx:callObject>
								<plx:callThis name="PropertyChanged" type="field"/>
							</plx:callObject>
							<plx:passParam>
								<plx:thisKeyword/>
							</plx:passParam>
							<plx:passParam>
								<plx:nameRef name="e" type="parameter"/>
							</plx:passParam>
						</plx:callInstance>
					</plx:branch>
				</plx:branch>
			</plx:function>
			<plx:function name="AddValidationRules" visibility="protected" modifier="virtual">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Assigns validation rules to this object.
</summary>
						<remarks>
This method can be overridden in a derived class to add custom validation rules. 
</remarks>
					</plx:docComment>
				</plx:leadingInfo>
			</plx:function>
			<plx:function name="AddValidationRuleHandler" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Adds a rule to the list of validated rules.
</summary>
						<param name="handler">The method that implements the rule.</param>
						<param name="propertyName">
The name of the property on the target object where the rule implementation can retrieve
the value to be validated.
</param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="handler" dataTypeName="ValidationRuleHandler" dataTypeQualifier="Validation"/>
				<plx:param name="propertyName" dataTypeName=".string"/>
				<plx:callInstance name="AddRule">
					<plx:callObject>
						<plx:callThis name="ValidationRules" type="property"/>
					</plx:callObject>
					<plx:passParam>
						<plx:nameRef name="handler" type="parameter"/>
					</plx:passParam>
					<plx:passParam>
						<plx:nameRef name="propertyName" type="parameter"/>
					</plx:passParam>
				</plx:callInstance>
			</plx:function>
			<plx:function name="AddValidationRuleHandler" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Adds a rule to the list of validated rules.
</summary>
						<remarks>
						</remarks>
						<param name="handler">The method that implements the rule.</param>
						<param name="args">
A <see cref="Entities.Validation.ValidationRuleArgs" /> object specifying the property name and other arguments
passed to the rule method
</param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="handler" dataTypeName="ValidationRuleHandler" dataTypeQualifier="Validation"/>
				<plx:param name="args" dataTypeName="ValidationRuleArgs" dataTypeQualifier="Validation"/>
				<plx:callInstance name="AddRule">
					<plx:callObject>
						<plx:callThis name="ValidationRules" type="property"/>
					</plx:callObject>
					<plx:passParam>
						<plx:nameRef name="handler" type="parameter"/>
					</plx:passParam>
					<plx:passParam>
						<plx:nameRef name="args" type="parameter"/>
					</plx:passParam>
				</plx:callInstance>
			</plx:function>
			<plx:function name="Validate" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Force this object to validate itself using the assigned business rules.
</summary>
						<remarks>Validates all properties.</remarks>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:callInstance name="ValidateRules">
					<plx:callObject>
						<plx:callThis name="ValidationRules" type="property"/>
					</plx:callObject>
				</plx:callInstance>
			</plx:function>
			<plx:function name="Validate" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Force the object to validate itself using the assigned business rules.
</summary>
						<param name="propertyName">Name of the property to validate.</param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="propertyName" dataTypeName=".string"/>
				<plx:callInstance name="ValidateRules">
					<plx:callObject>
						<plx:callThis name="ValidationRules" type="property"/>
					</plx:callObject>
					<plx:passParam>
						<plx:nameRef name="propertyName" type="parameter"/>
					</plx:passParam>
				</plx:callInstance>
			</plx:function>
			<plx:function name="Validate" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Force the object to validate itself using the assigned business rules.
</summary>
						<param name="column">Column enumeration representingt the column to validate.</param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:param name="column" dataTypeName="Enum" dataTypeQualifier="System"/>
				<plx:callThis name="Validate">
					<plx:passParam>
						<plx:callInstance name="ToString">
							<plx:callObject>
								<plx:nameRef name="column" type="parameter"/>
							</plx:callObject>
						</plx:callInstance>
					</plx:passParam>
				</plx:callThis>
			</plx:function>
			<plx:function name="OnDeserialization" visibility="public">
				<plx:leadingInfo>
					<plx:docComment>
						<summary>
Runs when the entire object graph has been deserialized.
</summary>
						<param name="sender">The object that initiated the callback. The functionality for this parameter is not currently implemented.</param>
					</plx:docComment>
				</plx:leadingInfo>
				<plx:interfaceMember memberName="OnDeserialization" dataTypeName="IDeserializationCallback" dataTypeQualifier="System.Runtime.Serialization"/>
				<plx:param name="sender" dataTypeName=".object"/>
				<plx:branch>
					<plx:condition>
						<plx:unaryOperator type="booleanNot">
							<plx:callThis name="suppressEntityEvents" type="field"/>
						</plx:unaryOperator>
					</plx:condition>
					<plx:assign>
						<plx:left>
							<plx:callInstance name="Target" type="property">
								<plx:callObject>
									<plx:callThis name="ValidationRules" type="property"/>
								</plx:callObject>
							</plx:callInstance>
						</plx:left>
						<plx:right>
							<plx:thisKeyword/>
						</plx:right>
					</plx:assign>
					<plx:callThis name="AddValidationRules"/>
				</plx:branch>
			</plx:function>
		</plx:class>
	</xsl:template>
	<xsl:template name="EntityBase">
		<plx:class name="EntityBase" visibility="public" modifier="abstract" partial="true">
			<plx:leadingInfo>
				<plx:docComment>
					<summary>
The base object for each database table entity.
</summary>
				</plx:docComment>
			</plx:leadingInfo>
			<plx:attribute dataTypeName="SerializableAttribute" dataTypeQualifier="System"/>
			<plx:derivesFromClass dataTypeName="EntityBaseCore"/>
		</plx:class>
	</xsl:template>
</xsl:stylesheet>
