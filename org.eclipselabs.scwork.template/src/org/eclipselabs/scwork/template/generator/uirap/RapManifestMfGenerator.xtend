package org.eclipselabs.scwork.template.generator.uirap

import org.eclipselabs.scwork.template.InputParam
import org.eclipselabs.scwork.template.generator.ITextFileGenerator

import static extension org.eclipselabs.scwork.template.generator.common.GeneratorExtensions.*

class RapManifestMfGenerator implements ITextFileGenerator {
	
	override shouldGenerate(InputParam param) {
		param.uirapIncluded
	}
	
	override provideFile(InputParam param) {
		param.uirapFile(#["META-INF", "MANIFEST.MF"])
	}
	
	override provideContent(InputParam param) 
'''
Manifest-Version: 1.0
Bundle-ManifestVersion: 2
Bundle-Name: RAP Bundle
Bundle-SymbolicName: «param.uirapProjectName»;singleton:=true
Bundle-Version: 1.0.0.qualifier
Bundle-Activator: «param.uirapProjectName».Activator
Bundle-Vendor: Eclipse Scout Project
Export-Package: «param.uirapProjectName»
Require-Bundle: org.eclipse.core.runtime,
 «param.clientProjectName»,
 «param.sharedProjectName»,
 org.eclipse.scout.rt.ui.rap,
 org.eclipse.scout.net,
 org.eclipse.equinox.http.registry,
 org.eclipse.scout.rt.server.commons,
 org.eclipse.scout.rt.ui.rap.mobile,
 org.eclipse.scout.rt.ui.rap.theme.rayo,
 org.eclipse.scout.rt.client.mobile
Bundle-RequiredExecutionEnvironment: JavaSE-1.8
Bundle-ActivationPolicy: lazy
'''
}
