package org.eclipselabs.scwork.template.generator.clientmobile

import org.eclipselabs.scwork.template.InputParam
import org.eclipselabs.scwork.template.generator.common.AbstractManifestMfGenerator

import static extension org.eclipselabs.scwork.template.generator.common.GeneratorExtensions.*

class MobileClientManifestMfGenerator extends AbstractManifestMfGenerator {
	
	override shouldGenerate(InputParam param) {
		param.uirapIncluded
	}
	
	override provideFile(InputParam param) {
		param.clientmobileFile(#["META-INF", "MANIFEST.MF"])
	}
	
	override provideProjectName(InputParam param) {
		param.clientmobileProjectName
	}
	
	override provideBundleClassPath(InputParam param) {
		null
	}

	override provideExportPackage(InputParam param) {
		#[param.clientmobileProjectName]
	}

	override provideRequireBundle(InputParam param) {
		#[
			"org.eclipse.core.runtime",
			param.clientProjectName,
			param.sharedProjectName,
			"org.eclipse.scout.rt.client.mobile",
			"org.eclipse.scout.rt.extension.client",
			"org.eclipse.scout.rt.client.mobile",
			"org.eclipse.scout.svg.client"
		]
	}

	override provideImportPackage(InputParam param) {
		#['org.w3c.dom.svg;version="[1.1.0,2.0.0)"']
	}
}
