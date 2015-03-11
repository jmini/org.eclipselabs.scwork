package org.eclipselabs.scwork.template.generator.uirap

import org.eclipselabs.scwork.template.InputParam
import org.eclipselabs.scwork.template.generator.ITextFileGenerator

import static extension org.eclipselabs.scwork.template.generator.common.GeneratorExtensions.*

class RapDevRapProductGenerator implements ITextFileGenerator {
	
	override shouldGenerate(InputParam param) {
		param.uirapIncluded
	}
	
	override provideFile(InputParam param) {
		param.uirapFile(#["products", "development", param.projectAlias + "-rap-dev.product"])
	}
	
	override provideContent(InputParam param) 
'''
<?xml version="1.0" encoding="UTF-8"?>
<?pde version="3.5"?>

<product name="«param.projectAlias»" id="«param.uirapProjectName».product" application="«param.uirapProjectName».app" useFeatures="false" includeLaunchers="true">

   <configIni use="default">
      <linux>/«param.uirapProjectName»/products/development/config.ini</linux>
      <macosx>/«param.uirapProjectName»/products/development/config.ini</macosx>
      <solaris>/«param.uirapProjectName»/products/development/config.ini</solaris>
      <win32>/«param.uirapProjectName»/products/development/config.ini</win32>
   </configIni>

   <launcherArgs>
      <vmArgs>-Xms32m
-Xmx512m
-Dorg.eclipse.rap.rwt.developmentMode=true
      </vmArgs>
   </launcherArgs>

   <windowImages/>

   <launcher>
      <solaris/>
      <win useIco="false">
         <bmp/>
      </win>
   </launcher>

   <vm>
   </vm>

   <plugins>
      <plugin id="«param.clientProjectName»"/>
      <plugin id="«param.clientmobileProjectName»"/>
      <plugin id="«param.sharedProjectName»"/>
      <plugin id="«param.uirapProjectName»"/>
      <plugin id="com.ibm.icu"/>
      <plugin id="javax.servlet"/>
      <plugin id="javax.xml"/>
      <plugin id="org.apache.batik.bridge"/>
      <plugin id="org.apache.batik.css"/>
      <plugin id="org.apache.batik.dom"/>
      <plugin id="org.apache.batik.dom.svg"/>
      <plugin id="org.apache.batik.ext.awt"/>
      <plugin id="org.apache.batik.parser"/>
      <plugin id="org.apache.batik.svggen"/>
      <plugin id="org.apache.batik.swing"/>
      <plugin id="org.apache.batik.transcoder"/>
      <plugin id="org.apache.batik.util"/>
      <plugin id="org.apache.batik.util.gui"/>
      <plugin id="org.apache.batik.xml"/>
      <plugin id="org.apache.commons.logging"/>
      <plugin id="org.eclipse.core.commands"/>
      <plugin id="org.eclipse.core.contenttype"/>
      <plugin id="org.eclipse.core.databinding"/>
      <plugin id="org.eclipse.core.databinding.observable"/>
      <plugin id="org.eclipse.core.databinding.property"/>
      <plugin id="org.eclipse.core.expressions"/>
      <plugin id="org.eclipse.core.jobs"/>
      <plugin id="org.eclipse.core.net"/>
      <plugin id="org.eclipse.core.runtime"/>
      <plugin id="org.eclipse.equinox.app"/>
      <plugin id="org.eclipse.equinox.common"/>
      <plugin id="org.eclipse.equinox.http.jetty"/>
      <plugin id="org.eclipse.equinox.http.registry"/>
      <plugin id="org.eclipse.equinox.http.servlet"/>
      <plugin id="org.eclipse.equinox.preferences"/>
      <plugin id="org.eclipse.equinox.registry"/>
      <plugin id="org.eclipse.equinox.security"/>
      <plugin id="org.eclipse.equinox.security.win32.x86_64" fragment="true"/>
      <plugin id="org.eclipse.help"/>
      <plugin id="org.eclipse.jetty.continuation"/>
      <plugin id="org.eclipse.jetty.http"/>
      <plugin id="org.eclipse.jetty.io"/>
      <plugin id="org.eclipse.jetty.security"/>
      <plugin id="org.eclipse.jetty.server"/>
      <plugin id="org.eclipse.jetty.servlet"/>
      <plugin id="org.eclipse.jetty.util"/>
      <plugin id="org.eclipse.osgi"/>
      <plugin id="org.eclipse.osgi.services"/>
      <plugin id="org.eclipse.rap.jface"/>
      <plugin id="org.eclipse.rap.jface.databinding"/>
      <plugin id="org.eclipse.rap.rwt"/>
      <plugin id="org.eclipse.rap.rwt.osgi"/>
      <plugin id="org.eclipse.rap.ui"/>
      <plugin id="org.eclipse.rap.ui.forms"/>
      <plugin id="org.eclipse.rap.ui.workbench"/>
      <plugin id="org.eclipse.scout.commons"/>
      <plugin id="org.eclipse.scout.net"/>
      <plugin id="org.eclipse.scout.org.w3c.dom.svg.fragment" fragment="true"/>
      <plugin id="org.eclipse.scout.rt.client"/>
      <plugin id="org.eclipse.scout.rt.client.mobile"/>
      <plugin id="org.eclipse.scout.rt.extension.client"/>
      <plugin id="org.eclipse.scout.rt.server.commons"/>
      <plugin id="org.eclipse.scout.rt.servicetunnel"/>
      <plugin id="org.eclipse.scout.rt.shared"/>
      <plugin id="org.eclipse.scout.rt.ui.rap"/>
      <plugin id="org.eclipse.scout.rt.ui.rap.mobile"/>
      <plugin id="org.eclipse.scout.rt.ui.rap.theme.rayo"/>
      <plugin id="org.eclipse.scout.rt.ui.rap.theme.rayo.mobile" fragment="true"/>
      <plugin id="org.eclipse.scout.rt.ui.svg.calendar"/>
      <plugin id="org.eclipse.scout.service"/>
      <plugin id="org.eclipse.scout.svg.client"/>
      <plugin id="org.eclipse.scout.svg.ui.rap"/>
      <plugin id="org.eclipse.update.configurator"/>
      <plugin id="org.w3c.css.sac"/>
      <plugin id="org.w3c.dom.events"/>
      <plugin id="org.w3c.dom.smil"/>
      <plugin id="org.w3c.dom.svg"/>
   </plugins>


</product>
'''
}
