package org.eclipselabs.scwork.template.generator.common

import org.eclipselabs.scwork.template.InputParam

abstract class AbstractJavaDotProjectGenerator extends AbstractDotProjectGenerator {
	
	override provideBuildCommandName(InputParam param) {
		#[
			"org.eclipse.jdt.core.javabuilder",
			"org.eclipse.pde.ManifestBuilder",
			"org.eclipse.pde.SchemaBuilder"
		]
	}
	
	override provideNatures(InputParam param) {
		#[
			"org.eclipse.jdt.core.javanature",
			"org.eclipse.pde.PluginNature"
		]
	}
}
