package org.eclipselabs.scwork.template.generator.uiswing

import org.eclipselabs.scwork.template.InputParam
import org.eclipselabs.scwork.template.generator.common.AbstractManifestMfGenerator

import static extension org.eclipselabs.scwork.template.generator.common.GeneratorExtensions.*

class SwingManifestMfGenerator extends AbstractManifestMfGenerator {
	
	override shouldGenerate(InputParam param) {
		param.uiswingIncluded
	}
	
	override provideFile(InputParam param) {
		param.uiswingFile(#["META-INF", "MANIFEST.MF"])
	}

	override provideProjectName(InputParam param) {
		param.uiswingProjectName
	}

	override provideBundleClassPath(InputParam param) {
		"."
	}

	override provideExportPackage(InputParam param) {
		#[param.uiswingProjectName + ';uses:="org.eclipse.scout.rt.ui.swing,org.eclipse.scout.rt.client.session,org.osgi.framework"']
	}
	
	override provideRequireBundle(InputParam param) {
		#[
			"org.eclipse.scout.rt.ui.swing",
			param.clientProjectName+";visibility:=reexport",
			param.sharedProjectName,
			"org.eclipse.scout.net"
		]
	}

	override provideImportPackage(InputParam param) {
	}
}
