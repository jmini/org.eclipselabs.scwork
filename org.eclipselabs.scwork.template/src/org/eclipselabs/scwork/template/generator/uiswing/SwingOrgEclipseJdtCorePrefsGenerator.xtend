package org.eclipselabs.scwork.template.generator.uiswing

import org.eclipselabs.scwork.template.InputParam
import org.eclipselabs.scwork.template.generator.common.AbstractOrgEclipseJdtCorePrefsGenerator

import static extension org.eclipselabs.scwork.template.generator.common.GeneratorExtensions.*

class SwingOrgEclipseJdtCorePrefsGenerator extends AbstractOrgEclipseJdtCorePrefsGenerator {
	
	override shouldGenerate(InputParam param) {
		param.uiswingIncluded
	}
	
	override provideFile(InputParam param) {
		param.uiswingFile(subFilePath())
	}
}
