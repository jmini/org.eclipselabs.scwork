package org.eclipselabs.scwork.template.generator.uirap

import org.eclipselabs.scwork.template.InputParam
import org.eclipselabs.scwork.template.generator.common.AbstractManifestMfGenerator

import static extension org.eclipselabs.scwork.template.generator.common.GeneratorExtensions.*

class RapManifestMfGenerator extends AbstractManifestMfGenerator {
	
	override shouldGenerate(InputParam param) {
		param.uirapIncluded
	}
	
	override provideFile(InputParam param) {
		param.uirapFile(#["META-INF", "MANIFEST.MF"])
	}
	
	override provideProjectName(InputParam param) {
		param.uirapProjectName
	}
	
	override provideBundleClassPath(InputParam param) {
		null
	}

	override provideExportPackage(InputParam param) {
		#[param.uirapProjectName]
	}
	
	override provideRequireBundle(InputParam param) {
		#[
			"org.eclipse.core.runtime",
			param.clientProjectName,
			param.sharedProjectName,
			"org.eclipse.scout.rt.ui.rap",
			"org.eclipse.scout.net",
			"org.eclipse.equinox.http.registry",
			"org.eclipse.scout.rt.server.commons",
			"org.eclipse.scout.rt.ui.rap.mobile",
			"org.eclipse.scout.rt.ui.rap.theme.rayo",
			"org.eclipse.scout.rt.client.mobile"
		]
	}
	
	override provideImportPackage(InputParam param) {
	}
}
