package org.eclipselabs.scwork.template.generator.server

import org.eclipselabs.scwork.template.InputParam
import org.eclipselabs.scwork.template.ProjectType
import org.eclipselabs.scwork.template.generator.ITextFileGenerator

import static extension org.eclipselabs.scwork.template.generator.common.GeneratorExtensions.*

class ServerPluginXmlGenerator implements ITextFileGenerator {
	
	override shouldGenerate(InputParam param) {
		param.serverIncluded
	}
	
	override provideFile(InputParam param) {
		param.serverFile("plugin.xml")
	}
	
	override provideContent(InputParam param) 
'''
<?xml version="1.0" encoding="UTF-8"?>
<plugin>

   <extension
         name=""
         point="org.eclipse.scout.service.services">
      <service
            factory="org.eclipse.scout.rt.server.services.ServerServiceFactory"
            class="org.eclipse.scout.rt.server.services.common.bookmark.FileSystemBookmarkStorageService"
            session="«param.serverProjectName».ServerSession">
      </service>
      <service
            factory="org.eclipse.scout.rt.server.services.ServerServiceFactory"
            class="org.eclipse.scout.rt.server.services.common.workflow.WorkflowProviderService"
            session="«param.serverProjectName».ServerSession">
      </service>
      <service
            factory="org.eclipse.scout.rt.server.services.ServerServiceFactory"
            class="«param.serverProjectName».services.common.security.AccessControlService"
            session="«param.serverProjectName».ServerSession">
      </service>
«IF(param.projectType == ProjectType.OUTLINE_BASED_APPLICATION)»      <service
            factory="org.eclipse.scout.rt.server.services.ServerServiceFactory"
            class="«param.serverProjectName».services.StandardOutlineService"
            session="«param.serverProjectName».ServerSession">
      </service>«ENDIF»
«IF(param.projectType == ProjectType.SINGLE_FORM_APPLICATION)»      <service
            factory="org.eclipse.scout.rt.server.services.ServerServiceFactory"
            class="«param.serverProjectName».services.DesktopService"
            session="«param.serverProjectName».ServerSession">
      </service>«ENDIF»
   </extension>
   <extension
         name=""
         point="org.eclipse.equinox.http.registry.servlets">
      <servlet
            alias="/process"
            class="org.eclipse.scout.rt.server.ServiceTunnelServlet">
         <init-param
               name="min-version"
               value="0.0.0">
         </init-param>
      </servlet>
      <servlet
            alias="/remotefiles"
            class="org.eclipse.scout.rt.server.RemoteFileServlet">
      </servlet>
      <servlet
            alias="/updatesite"
            class="org.eclipse.scout.rt.server.RemoteFileServlet">
         <init-param
               name="folder"
               value="/updatesite">
         </init-param>
      </servlet>
      <servlet
            alias="/"
            class="org.eclipse.scout.rt.server.ResourceServlet">
         <init-param
               name="bundle-name"
               value="«param.serverProjectName»">
         </init-param>
         <init-param
               name="bundle-path"
               value="/resources/html">
         </init-param>
      </servlet>
«IF(param.uirapIncluded)»      <servlet
            alias="/ajax"
            class="org.eclipse.scout.rt.server.ServiceTunnelServlet">
      </servlet>«ENDIF»
   </extension>
   <extension
         name=""
         point="org.eclipse.scout.rt.server.commons.filters">
      <filter
            aliases="/process /remotefiles /updatesite"
            class="org.eclipse.scout.rt.server.commons.servletfilter.security.BasicSecurityFilter"
            ranking="20">
      </filter>
      <filter
            aliases="/process /remotefiles /updatesite"
            class="org.eclipse.scout.rt.server.commons.servletfilter.security.AnonymousSecurityFilter"
            ranking="30">
      </filter>
   </extension>
   <extension
         id="app"
         name="Server Application"
         point="org.eclipse.core.runtime.applications">
      <application>
         <run
               class="«param.serverProjectName».ServerApplication">
         </run>
      </application>
   </extension>
   <extension
         id="product"
         name=""
         point="org.eclipse.core.runtime.products">
      <product
            application="«param.serverProjectName».app"
            name="«param.projectAlias» Server">
         <property
               name="appName"
               value="«param.projectAlias» Server">
         </property>
      </product>
   </extension>

</plugin>
'''
}
