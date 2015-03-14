package org.eclipselabs.scwork.template.generator.clientmobile

import org.eclipselabs.scwork.template.InputParam
import org.eclipselabs.scwork.template.generator.ITextFileGenerator

import static extension org.eclipselabs.scwork.template.generator.common.GeneratorExtensions.*

class MobileClientManifestMfGenerator implements ITextFileGenerator {
	
	override shouldGenerate(InputParam param) {
		param.uirapIncluded
	}
	
	override provideFile(InputParam param) {
		param.clientmobileFile(#["META-INF", "MANIFEST.MF"])
	}
	
	override provideContent(InputParam param) 
'''
Manifest-Version: 1.0
Bundle-ManifestVersion: 2
Bundle-Name: «param.clientmobileProjectName»
Bundle-SymbolicName: «param.clientmobileProjectName»;singleton:=true
Bundle-Version: «param.projectVersion»
Bundle-Activator: «param.clientmobileProjectName».Activator
Bundle-Vendor: Eclipse Scout Project
Require-Bundle: org.eclipse.core.runtime,
 «param.clientProjectName»,
 «param.sharedProjectName»,
 org.eclipse.scout.rt.client.mobile,
 org.eclipse.scout.rt.extension.client,
 org.eclipse.scout.rt.client.mobile,
 org.eclipse.scout.svg.client
Import-Package: org.w3c.dom.svg;version="[1.1.0,2.0.0)"
Bundle-RequiredExecutionEnvironment: JavaSE-1.8
Bundle-ActivationPolicy: lazy
Export-Package: «param.clientmobileProjectName»
'''
}
