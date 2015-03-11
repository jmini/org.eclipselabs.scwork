package org.eclipselabs.scwork.template.generator.uiswt

import org.eclipselabs.scwork.template.InputParam
import org.eclipselabs.scwork.template.generator.ITextFileGenerator

import static extension org.eclipselabs.scwork.template.generator.common.GeneratorExtensions.*

class SwtManifestMfGenerator implements ITextFileGenerator {
	
	override shouldGenerate(InputParam param) {
		param.uiswtIncluded
	}
	
	override provideFile(InputParam param) {
		param.uiswtFile(#["META-INF", "MANIFEST.MF"])
	}
	
	override provideContent(InputParam param) 
'''
Manifest-Version: 1.0
Bundle-ManifestVersion: 2
Bundle-Name: My Application
Bundle-SymbolicName: «param.uiswtProjectName»;singleton:=true
Bundle-Version: 1.0.0.qualifier
Bundle-ClassPath: .
Bundle-Activator: «param.uiswtProjectName».Activator
Export-Package: «param.uiswtProjectName»;uses:="org.eclipse.scout.rt.ui.swt,org.eclipse.scout.rt.client.session,org.osgi.framework",
 «param.uiswtProjectName».application,
 «param.uiswtProjectName».application.menu,
 «param.uiswtProjectName».editor,
 «param.uiswtProjectName».perspective,
 «param.uiswtProjectName».views
Require-Bundle: «param.clientProjectName»;visibility:=reexport,
 «param.sharedProjectName»,
 org.eclipse.scout.rt.ui.swt,
 org.eclipse.scout.net,
 org.eclipse.equinox.app,
 org.eclipse.core.runtime,
 org.eclipse.ui,
 org.eclipse.ui.views
Bundle-RequiredExecutionEnvironment: JavaSE-1.8
Bundle-ActivationPolicy: lazy
'''
}
