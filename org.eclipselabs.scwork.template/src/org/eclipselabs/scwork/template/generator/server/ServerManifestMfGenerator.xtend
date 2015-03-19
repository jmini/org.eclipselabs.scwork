package org.eclipselabs.scwork.template.generator.server

import org.eclipselabs.scwork.template.InputParam
import org.eclipselabs.scwork.template.ProjectType
import org.eclipselabs.scwork.template.generator.common.AbstractManifestMfGenerator

import static extension org.eclipselabs.scwork.template.generator.common.GeneratorExtensions.*

class ServerManifestMfGenerator extends AbstractManifestMfGenerator {
	
	override shouldGenerate(InputParam param) {
		param.serverIncluded
	}
	
	override provideFile(InputParam param) {
		param.serverFile(subFilePath())
	}
	
	override provideProjectName(InputParam param) {
		param.serverProjectName
	}
	
	override provideBundleClassPath(InputParam param) {
		"."
	}
	
	override provideExportPackage(InputParam param) {
		switch(param.projectType) {
			case ProjectType.EMPTY_APPLICATION : {
				#[
					param.serverProjectName,
					param.serverProjectName + ".services.common.security"
				]
			}
			case ProjectType.OUTLINE_BASED_APPLICATION : {
				#[
					param.serverProjectName,
					param.serverProjectName + ".services",
					param.serverProjectName + ".services.common.security"
				]			}
			case ProjectType.SINGLE_FORM_APPLICATION : {
				#[
					param.serverProjectName,
					param.serverProjectName + ".services",
					param.serverProjectName + ".services.common.security"
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
			param.sharedProjectName,
			"org.eclipse.scout.rt.server",
			"org.eclipse.scout.rt.server.commons",
			"org.eclipse.equinox.http.registry",
			"org.eclipse.scout.rt.jdbc.derby10",
			'org.eclipse.scout.jaxws216;bundle-version="2.1.6"'
		]
	}
	
	override provideImportPackage(InputParam param) {
		#[
			'javax.servlet;version="2.4.0"',
			'javax.servlet.http;version="2.4.0"'
		]
	}
}
