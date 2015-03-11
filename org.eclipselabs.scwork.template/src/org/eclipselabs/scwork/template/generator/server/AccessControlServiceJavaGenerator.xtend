package org.eclipselabs.scwork.template.generator.server

import org.eclipselabs.scwork.template.InputParam
import org.eclipselabs.scwork.template.generator.ITextFileGenerator

import static extension org.eclipselabs.scwork.template.generator.common.GeneratorExtensions.*

class AccessControlServiceJavaGenerator implements ITextFileGenerator {
	
	override shouldGenerate(InputParam param) {
		param.serverIncluded
	}
	
	override provideFile(InputParam param) {
		param.serverSourceFile(#["services", "common", "security", "AccessControlService.java"])
	}
	
	override provideContent(InputParam param) 
'''
package «param.serverProjectName».services.common.security;

import java.security.AllPermission;
import java.security.Permissions;

import org.eclipse.scout.rt.server.services.common.security.AbstractAccessControlService;
import org.eclipse.scout.rt.shared.security.RemoteServiceAccessPermission;

public class AccessControlService extends AbstractAccessControlService {

  @Override
  protected Permissions execLoadPermissions() {
    Permissions permissions = new Permissions();
    permissions.add(new RemoteServiceAccessPermission("*.shared.*", "*"));
    //TODO jbr fill access control service
    permissions.add(new AllPermission());
    return permissions;
  }

}
'''
}
