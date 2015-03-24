package org.eclipselabs.scwork.template.generator.common

import java.util.List
import org.eclipselabs.scwork.template.InputParam
import org.eclipselabs.scwork.template.generator.ITextFileGenerator

import static extension org.eclipselabs.scwork.template.generator.common.GeneratorExtensions.*

abstract class AbstractManifestMfGenerator implements ITextFileGenerator {
	
	def subFilePath() {
		#["META-INF", "MANIFEST.MF"]
	}
	
	override provideContent(InputParam param) 
'''
Manifest-Version: 1.0
Bundle-ManifestVersion: 2
Bundle-Name: «param.provideProjectName»
Bundle-SymbolicName: «param.provideProjectName»;singleton:=true
Bundle-Version: «param.projectVersion»
«param.provideBundleClassPath.box("Bundle-ClassPath: ", "")»
Bundle-Activator: «param.provideProjectName».Activator
Export-Package: «param.provideExportPackage?.join(",\n ")»
Require-Bundle: «param.provideRequireBundle?.join(",\n ")»
Bundle-RequiredExecutionEnvironment: «param.javaVersion»
«param.provideImportPackage?.join("Import-Package: ", ",\n ", "", [it])»
Bundle-ActivationPolicy: lazy
'''
	
	def abstract String provideProjectName(InputParam param)

	def abstract String provideBundleClassPath(InputParam param)
	
	def abstract List<String> provideExportPackage(InputParam param)
	
	def abstract List<String> provideRequireBundle(InputParam param)
	
	def abstract List<String> provideImportPackage(InputParam param)
}
