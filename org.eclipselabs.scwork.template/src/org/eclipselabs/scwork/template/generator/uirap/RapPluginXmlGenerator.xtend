package org.eclipselabs.scwork.template.generator.uirap

import org.eclipselabs.scwork.template.InputParam
import org.eclipselabs.scwork.template.generator.ITextFileGenerator

import static extension org.eclipselabs.scwork.template.generator.common.GeneratorExtensions.*

class RapPluginXmlGenerator implements ITextFileGenerator {
	
	override shouldGenerate(InputParam param) {
		param.uirapIncluded
	}
	
	override provideFile(InputParam param) {
		param.uirapFile("plugin.xml")
	}
	
	override provideContent(InputParam param) 
'''
<?xml version="1.0" encoding="UTF-8"?>
<?eclipse version="3.4"?>
<plugin>
  <extension id="product" point="org.eclipse.core.runtime.products">
    <product
      application="«param.uirapProjectName».app"
      name="«param.projectAlias»">
      <property
        name="appName"
        value="«param.projectAlias»">
      </property>
    </product>
  </extension>
  <extension id="app" name="«param.projectAlias»" point="org.eclipse.core.runtime.applications">
   <application>
     <run class="org.eclipse.scout.rt.ui.rap.RwtApplication"/>
   </application>
  </extension>
  <extension point="org.eclipse.scout.rt.ui.rap.lookAndFeel">
    <decorations
      scope="global">
      <mandatory>
        <starMarker
          placement="afterLabel">
        </starMarker>
      </mandatory>
    </decorations>
    <properties
      scope="global">
      <property
        name="formMainBoxBorder.visible"
        value="false">
      </property>
    </properties>
  </extension>
  <extension point="org.eclipse.rap.ui.entrypoint">
    <entrypoint
      class="«param.uirapProjectName».StandaloneRwtEnvironment"
      id="«param.uirapProjectName».entrypoint.web"
      brandingId="«param.uirapProjectName».branding.web"
      path="/web"/>
    <entrypoint
      class="«param.uirapProjectName».MobileStandaloneRwtEnvironment"
      id="«param.uirapProjectName».entrypoint.mobile"
      brandingId="«param.uirapProjectName».branding.mobile"
      path="/mobile"/>
    <entrypoint
      class="«param.uirapProjectName».TabletStandaloneRwtEnvironment"
      id="«param.uirapProjectName».entrypoint.tablet"
      brandingId="«param.uirapProjectName».branding.tablet"
      path="/tablet"/>
  </extension>
  <extension point="org.eclipse.rap.ui.branding">
    <branding
      body="web-resources/startup-body.html"
      favicon="web-resources/eclipseScout.gif"
      id="«param.uirapProjectName».branding.web"
      themeId="org.eclipse.scout.rt.ui.rap.theme"
      title="«param.projectAlias»">
      <additionalHeaders>
        <link href="res/html-styles.css" rel="stylesheet"/>
      </additionalHeaders>
    </branding>
    <branding
      body="web-resources/startup-body.html"
      favicon="web-resources/eclipseScout.gif"
      id="«param.uirapProjectName».branding.mobile"
      themeId="org.eclipse.scout.rt.ui.rap.mobile.theme"
      title="«param.projectAlias»">
      <additionalHeaders>
        <link href="res/html-styles.css" rel="stylesheet"/>
        <meta content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport"></meta>
      </additionalHeaders>
    </branding>
    <branding
      body="web-resources/startup-body.html"
      favicon="web-resources/eclipseScout.gif"
      id="«param.uirapProjectName».branding.tablet"
      themeId="org.eclipse.scout.rt.ui.rap.mobile.theme"
      title="«param.projectAlias»">
      <additionalHeaders>
        <link href="res/html-styles.css" rel="stylesheet"/>
        <meta content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport"></meta>
      </additionalHeaders>
    </branding>
  </extension>
  <extension point="org.eclipse.rap.ui.themes">
    <themeContribution file="theme/application.css" themeId="org.eclipse.scout.rt.ui.rap.theme"/>
  </extension>
  <extension point="org.eclipse.equinox.http.registry.resources">
    <resource alias="/res" base-name="/web-resources"/>
  </extension>
  <extension point="org.eclipse.scout.rt.server.commons.filters">
    <filter
      aliases="/"
      class="org.eclipse.scout.rt.server.commons.servletfilter.security.AnonymousSecurityFilter"
      ranking="10">
    </filter>
    <filter
      aliases="/"
      class="org.eclipse.scout.rt.server.commons.servletfilter.security.BasicSecurityFilter"
      ranking="20">
    </filter>
    <filter
      aliases="/"
      class="org.eclipse.scout.rt.ui.rap.servletfilter.LogoutFilter"
      ranking="-1000000">
      <init-param
        name="active"
        value="true">
      </init-param>
    </filter>
  </extension>
  <extension point="org.eclipse.equinox.http.registry.servlets">
    <servlet
      alias="/"
      class="org.eclipse.scout.rt.ui.rap.mobile.servlets.DeviceDispatcherServlet">
    </servlet>
  </extension>
</plugin>
'''
}
