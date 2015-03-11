package org.eclipselabs.scwork.template.generator.uiswing

import org.eclipselabs.scwork.template.InputParam
import org.eclipselabs.scwork.template.generator.ITextFileGenerator

import static extension org.eclipselabs.scwork.template.generator.common.GeneratorExtensions.*

class SwingManifestMfGenerator implements ITextFileGenerator {
	
	override shouldGenerate(InputParam param) {
		param.uiswingIncluded
	}
	
	override provideFile(InputParam param) {
		param.uiswingFile(#["META-INF", "MANIFEST.MF"])
	}
	
	override provideContent(InputParam param) 
'''
Manifest-Version: 1.0
Bundle-ManifestVersion: 2
Bundle-Name: My Application
Bundle-SymbolicName: «param.uiswingProjectName»;singleton:=true
Bundle-Version: 1.0.0.qualifier
Bundle-Activator: «param.uiswingProjectName».Activator
Bundle-ActivationPolicy: lazy
Require-Bundle: org.eclipse.scout.rt.ui.swing,
 «param.clientProjectName»;visibility:=reexport,
 «param.sharedProjectName»,
 org.eclipse.scout.net
Export-Package: «param.uiswingProjectName»;uses:="org.eclipse.scout.rt.ui.swing,org.eclipse.scout.rt.client.session,org.osgi.framework"
Bundle-ClassPath: .
Bundle-RequiredExecutionEnvironment: JavaSE-1.8
'''
}
