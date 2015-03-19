package org.eclipselabs.scwork.template.generator.shared

import org.eclipselabs.scwork.template.InputParam
import org.eclipselabs.scwork.template.ProjectType
import org.eclipselabs.scwork.template.generator.common.AbstractManifestMfGenerator

import static extension org.eclipselabs.scwork.template.generator.common.GeneratorExtensions.*

class SharedManifestMfGenerator extends AbstractManifestMfGenerator {
	
	override shouldGenerate(InputParam param) {
		param.sharedIncluded
	}
	
	override provideFile(InputParam param) {
		param.sharedFile(subFilePath())
	}

	override provideProjectName(InputParam param) {
		param.sharedProjectName
	}
	
	override provideBundleClassPath(InputParam param) {
	}
	
	override provideExportPackage(InputParam param) {
		switch(param.projectType) {
			case ProjectType.EMPTY_APPLICATION : {
				#[
					param.sharedProjectName,
					param.sharedProjectName + ".services.common.text"
				]
			}
			case ProjectType.OUTLINE_BASED_APPLICATION : {
				#[
					param.sharedProjectName,
					param.sharedProjectName + ".services",
					param.sharedProjectName + ".services.common.text"
				]			}
			case ProjectType.SINGLE_FORM_APPLICATION : {
				#[
					param.sharedProjectName,
					param.sharedProjectName + ".services",
					param.sharedProjectName + ".services.common.text"
				]
			}
			default : {
				throw new IllegalStateException("Unknown application type")
			}
		}
	}
	
	override provideRequireBundle(InputParam param) {
		#[
			"org.eclipse.core.runtime",
			"org.eclipse.scout.rt.shared;visibility:=reexport"
		]
	}
	
	override provideImportPackage(InputParam param) {
	}
}
