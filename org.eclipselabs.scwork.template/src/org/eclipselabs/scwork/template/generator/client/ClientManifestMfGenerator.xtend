package org.eclipselabs.scwork.template.generator.client

import org.eclipselabs.scwork.template.InputParam
import org.eclipselabs.scwork.template.ProjectType
import org.eclipselabs.scwork.template.generator.common.AbstractManifestMfGenerator

import static extension org.eclipselabs.scwork.template.generator.common.GeneratorExtensions.*

class ClientManifestMfGenerator extends AbstractManifestMfGenerator {
	
	override shouldGenerate(InputParam param) {
		param.clientIncluded
	}
	
	override provideFile(InputParam param) {
		param.clientFile(subFilePath())
	}
	
	override provideProjectName(InputParam param) {
		param.clientProjectName
	}
	
	override provideBundleClassPath(InputParam param) {
	}
	
	override provideExportPackage(InputParam param) {
		switch(param.projectType) {
			case ProjectType.EMPTY_APPLICATION : {
				#[
					param.clientProjectName,
					param.clientProjectName + ".ui.desktop"
				]
			}
			case ProjectType.OUTLINE_BASED_APPLICATION : {
				#[
					param.clientProjectName,
					param.clientProjectName + ".ui.desktop",
					param.clientProjectName + ".ui.desktop.outlines"
				]			}
			case ProjectType.SINGLE_FORM_APPLICATION : {
				#[
					param.clientProjectName,
					param.clientProjectName + ".ui.desktop",
					param.clientProjectName + ".ui.forms"
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
			"org.eclipse.scout.rt.client;visibility:=reexport",
			"org.eclipse.scout.rt.extension.client;visibility:=reexport",
			param.sharedProjectName,
			"org.eclipse.scout.svg.client"
		]
	}
	
	override provideImportPackage(InputParam param) {
		#['org.w3c.dom.svg;version="[1.1.0,2.0.0)"']
	}
}
