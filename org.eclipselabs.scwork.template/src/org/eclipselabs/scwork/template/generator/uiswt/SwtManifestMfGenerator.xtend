package org.eclipselabs.scwork.template.generator.uiswt

import org.eclipselabs.scwork.template.InputParam
import org.eclipselabs.scwork.template.generator.common.AbstractManifestMfGenerator

import static extension org.eclipselabs.scwork.template.generator.common.GeneratorExtensions.*

class SwtManifestMfGenerator extends AbstractManifestMfGenerator {
	
	override shouldGenerate(InputParam param) {
		param.uiswtIncluded
	}
	
	override provideFile(InputParam param) {
		param.uiswtFile(#["META-INF", "MANIFEST.MF"])
	}

	override provideProjectName(InputParam param) {
		param.uiswtProjectName
	}
	
	override provideBundleClassPath(InputParam param) {
		"."
	}
	
	override provideExportPackage(InputParam param) {
		#[
			param.uiswtProjectName + ';uses:="org.eclipse.scout.rt.ui.swt,org.eclipse.scout.rt.client.session,org.osgi.framework"',
			param.uiswtProjectName + '.application',
			param.uiswtProjectName + '.application.menu',
			param.uiswtProjectName + '.editor',
			param.uiswtProjectName + '.perspective',
			param.uiswtProjectName + '.views'
		]
	}
	
	override provideRequireBundle(InputParam param) {
		#[
			param.clientProjectName +";visibility:=reexport",
			param.sharedProjectName,
			"org.eclipse.scout.rt.ui.swt",
			"org.eclipse.scout.net",
			"org.eclipse.equinox.app",
			"org.eclipse.core.runtime",
			"org.eclipse.ui",
			"org.eclipse.ui.views"
		]
	}
	
	override provideImportPackage(InputParam param) {
	}
}
