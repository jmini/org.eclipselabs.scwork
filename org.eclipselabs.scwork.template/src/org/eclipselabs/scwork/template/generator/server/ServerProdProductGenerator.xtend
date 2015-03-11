package org.eclipselabs.scwork.template.generator.server

import org.eclipselabs.scwork.template.InputParam
import org.eclipselabs.scwork.template.generator.ITextFileGenerator

import static extension org.eclipselabs.scwork.template.generator.common.GeneratorExtensions.*

class ServerProdProductGenerator implements ITextFileGenerator {
	
	override shouldGenerate(InputParam param) {
		param.serverIncluded
	}
	
	override provideFile(InputParam param) {
		param.serverFile(#["products", "production", param.projectAlias + "-server.product"])
	}
	
	override provideContent(InputParam param) 
'''
<?xml version="1.0" encoding="UTF-8"?>
<?pde version="3.5"?>

<product name="«param.projectAlias» Server" id="«param.serverProjectName».product" application="«param.serverProjectName».app" useFeatures="false" includeLaunchers="true">

   <configIni use="default">
      <linux>/«param.serverProjectName»/products/production/config.ini</linux>
      <macosx>/«param.serverProjectName»/products/production/config.ini</macosx>
      <win32>/«param.serverProjectName»/products/production/config.ini</win32>
   </configIni>

   <launcherArgs>
      <programArgsLin>-os ${target.os} -ws ${target.ws} -arch ${target.arch} -nl ${target.nl}
      </programArgsLin>
      <programArgsMac>-os ${target.os}  -arch ${target.arch} -nl ${target.nl}
      </programArgsMac>
      <programArgsWin>-os ${target.os} -ws ${target.ws} -arch ${target.arch} -nl ${target.nl}
      </programArgsWin>
      <vmArgs>-Xms64m
-Xmx512m
      </vmArgs>
   </launcherArgs>

   <launcher>
      <solaris/>
      <win useIco="false">
         <bmp/>
      </win>
   </launcher>

   <vm>
   </vm>

   <plugins>
      <plugin id="«param.serverProjectName»"/>
      <plugin id="«param.sharedProjectName»"/>
      <plugin id="javax.xml"/>
      <plugin id="org.apache.derby.jdbc_1091.fragment" fragment="true"/>
      <plugin id="org.eclipse.core.contenttype"/>
      <plugin id="org.eclipse.core.jobs"/>
      <plugin id="org.eclipse.core.runtime"/>
      <plugin id="org.eclipse.equinox.app"/>
      <plugin id="org.eclipse.equinox.common"/>
      <plugin id="org.eclipse.equinox.http.registry"/>
      <plugin id="org.eclipse.equinox.http.servlet"/>
      <plugin id="org.eclipse.equinox.http.servletbridge"/>
      <plugin id="org.eclipse.equinox.preferences"/>
      <plugin id="org.eclipse.equinox.registry"/>
      <plugin id="org.eclipse.equinox.security"/>
      <plugin id="org.eclipse.equinox.security.win32.x86_64" fragment="true"/>
      <plugin id="org.eclipse.equinox.servletbridge"/>
      <plugin id="org.eclipse.osgi"/>
      <plugin id="org.eclipse.osgi.services"/>
      <plugin id="org.eclipse.scout.commons"/>
      <plugin id="org.eclipse.scout.jaxws216"/>
      <plugin id="org.eclipse.scout.rt.jdbc.derby10"/>
      <plugin id="org.eclipse.scout.rt.server"/>
      <plugin id="org.eclipse.scout.rt.server.commons"/>
      <plugin id="org.eclipse.scout.rt.shared"/>
      <plugin id="org.eclipse.scout.service"/>
      <plugin id="org.eclipse.update.configurator"/>
   </plugins>


</product>
'''
}
