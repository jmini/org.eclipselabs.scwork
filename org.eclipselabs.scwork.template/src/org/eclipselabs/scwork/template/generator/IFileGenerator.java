package org.eclipselabs.scwork.template.generator;

import java.io.File;

import org.eclipselabs.scwork.template.InputParam;

public interface IFileGenerator {

  File provideFile(InputParam param);

  boolean shouldGenerate(InputParam param);

}
