package org.eclipselabs.scwork.template.generator.uiswt

import org.eclipselabs.scwork.template.InputParam
import org.eclipselabs.scwork.template.generator.ITextFileGenerator

import static extension org.eclipselabs.scwork.template.generator.common.GeneratorExtensions.*

class SwtPluginXmlGenerator implements ITextFileGenerator {
	
	override shouldGenerate(InputParam param) {
		param.uiswtIncluded
	}
	
	override provideFile(InputParam param) {
		param.uiswtFile("plugin.xml")
	}
	
	override provideContent(InputParam param) 
'''
<?xml version="1.0" encoding="UTF-8"?>
<plugin>

   <extension
         name=""
         point="org.eclipse.ui.perspectives">
      <perspective
            name="«param.projectAlias»"
            icon="resources/icons/eclipse_scout.gif"
            fixed="false"
            class="«param.uiswtProjectName».perspective.Perspective"
            id="«param.uiswtProjectName».perspective.Perspective">
      </perspective>
   </extension>
   <extension
         name=""
         point="org.eclipse.ui.views">
      <view
            name="Center View"
            allowMultiple="true"
            icon="resources/icons/eclipse_scout.gif"
            category="«param.uiswtProjectName».viewCategory"
            restorable="true"
            class="«param.uiswtProjectName».views.CenterView"
            id="«param.uiswtProjectName».views.CenterView">
      </view>
      <view
            name="West view"
            allowMultiple="true"
            icon="resources/icons/eclipse_scout.gif"
            category="«param.uiswtProjectName».viewCategory"
            restorable="true"
            class="«param.uiswtProjectName».views.WestView"
            id="«param.uiswtProjectName».views.WestView">
      </view>
      <view
            name="North view"
            allowMultiple="true"
            icon="resources/icons/eclipse_scout.gif"
            category="«param.uiswtProjectName».viewCategory"
            restorable="true"
            class="«param.uiswtProjectName».views.NorthView"
            id="«param.uiswtProjectName».views.NorthView">
      </view>
      <view
            name="North west view"
            allowMultiple="true"
            icon="resources/icons/eclipse_scout.gif"
            category="«param.uiswtProjectName».viewCategory"
            restorable="true"
            class="«param.uiswtProjectName».views.NorthWestView"
            id="«param.uiswtProjectName».views.NorthWestView">
      </view>
      <view
            name="North east view"
            allowMultiple="true"
            icon="resources/icons/eclipse_scout.gif"
            category="«param.uiswtProjectName».viewCategory"
            restorable="true"
            class="«param.uiswtProjectName».views.NorthEastView"
            id="«param.uiswtProjectName».views.NorthEastView">
      </view>
      <view
            name="East view"
            allowMultiple="true"
            icon="resources/icons/eclipse_scout.gif"
            category="«param.uiswtProjectName».viewCategory"
            restorable="true"
            class="«param.uiswtProjectName».views.EastView"
            id="«param.uiswtProjectName».views.EastView">
      </view>
      <view
            name="South view"
            allowMultiple="true"
            icon="resources/icons/eclipse_scout.gif"
            category="«param.uiswtProjectName».viewCategory"
            restorable="true"
            class="«param.uiswtProjectName».views.SouthView"
            id="«param.uiswtProjectName».views.SouthView">
      </view>
      <view
            name="South west view"
            allowMultiple="true"
            icon="resources/icons/eclipse_scout.gif"
            category="«param.uiswtProjectName».viewCategory"
            restorable="true"
            class="«param.uiswtProjectName».views.SouthWestView"
            id="«param.uiswtProjectName».views.SouthWestView">
      </view>
      <view
            name="South east view"
            allowMultiple="true"
            icon="resources/icons/eclipse_scout.gif"
            category="«param.uiswtProjectName».viewCategory"
            restorable="true"
            class="«param.uiswtProjectName».views.SouthEastView"
            id="«param.uiswtProjectName».views.SouthEastView">
      </view>
      <view
            name="Progress View"
            allowMultiple="false"
            icon="resources/icons/progress_view.gif"
            category="org.eclipse.ui"
            restorable="true"
            class="org.eclipse.ui.ExtensionFactory:progressView"
            id="org.eclipse.ui.views.ProgressView">
      </view>
      <category
            name="«param.projectAlias»"
            id="«param.uiswtProjectName».viewCategory">
      </category>
   </extension>
   <extension
         name=""
         point="org.eclipse.ui.startup">
      <startup
            class="«param.uiswtProjectName».SwtStartup">
      </startup>
   </extension>
   <extension
         id="application"
         name="Application"
         point="org.eclipse.core.runtime.applications">
      <application>
         <run
               class="«param.uiswtProjectName».application.Application">
         </run>
      </application>
   </extension>
   <extension
         name=""
         point="org.eclipse.ui.editors">
      <editor
            name="ScoutEditorPart"
            default="false"
            icon="resources/icons/eclipse_scout.gif"
            matchingStrategy="org.eclipse.scout.rt.ui.swt.window.desktop.editor.ScoutEditorMatchingStrategy"
            class="«param.uiswtProjectName».editor.ScoutEditorPart"
            id="«param.uiswtProjectName».editor.ScoutEditorPart">
      </editor>
   </extension>
   <extension
         id="product"
         name=""
         point="org.eclipse.core.runtime.products">
      <product
            name=""
            application="«param.uiswtProjectName».application">
         <property
               name="appName"
               value="«param.projectAlias»">
         </property>
         <property
               name="windowImages"
               value="resources/icons/eclipseScout16x16.gif,resources/icons/eclipseScout32x32.gif">
         </property>
         <property
               name="applicationXMI"
               value="org.eclipse.platform/LegacyIDE.e4xmi">
         </property>
         <property
               name="cssTheme"
               value="org.eclipse.e4.ui.css.theme.e4_default">
         </property>
         <property
               name="applicationCSSResources"
               value="platform:/plugin/org.eclipse.platform/images/">
         </property>
      </product>
   </extension>
   <extension
         name=""
         point="org.eclipse.ui.menus">
      <menuContribution
            allPopups="false"
            locationURI="menu:org.eclipse.ui.main.menu">
         <dynamic
               class="«param.uiswtProjectName».application.menu.DesktopMenuBar"
               id="org.eclipse.scout.swt.menu.dynamic">
         </dynamic>
      </menuContribution>
   </extension>

</plugin>
'''
}
