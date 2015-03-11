package org.eclipselabs.scwork.template

import com.google.common.base.Charsets
import com.google.common.io.ByteStreams
import com.google.common.io.Files
import com.google.common.reflect.ClassPath
import java.io.File
import java.util.Arrays
import java.util.List
import org.eclipselabs.scwork.template.generator.IBinFileGenerator
import org.eclipselabs.scwork.template.generator.IFileGenerator
import org.eclipselabs.scwork.template.generator.ITextFileGenerator
import org.eclipselabs.scwork.template.generator.client.ClientActivatorJavaGenerator
import org.eclipselabs.scwork.template.generator.client.ClientBuildPropertiesGenerator
import org.eclipselabs.scwork.template.generator.client.ClientDotClasspathGenerator
import org.eclipselabs.scwork.template.generator.client.ClientDotProjectGenerator
import org.eclipselabs.scwork.template.generator.client.ClientManifestMfGenerator
import org.eclipselabs.scwork.template.generator.client.ClientOrgEclipseJdtCorePrefsGenerator
import org.eclipselabs.scwork.template.generator.client.ClientOrgEclipseJdtUiPrefsGenerator
import org.eclipselabs.scwork.template.generator.client.ClientPluginXmlGenerator
import org.eclipselabs.scwork.template.generator.client.ClientScoutGifGenerator
import org.eclipselabs.scwork.template.generator.client.ClientSessionJavaGenerator
import org.eclipselabs.scwork.template.generator.client.DesktopFormJavaGenerator
import org.eclipselabs.scwork.template.generator.client.DesktopJavaGenerator
import org.eclipselabs.scwork.template.generator.client.EyePngGenerator
import org.eclipselabs.scwork.template.generator.client.StandardOutlineJavaGenerator
import org.eclipselabs.scwork.template.generator.clientmobile.DesktopExtensionJavaGenerator
import org.eclipselabs.scwork.template.generator.clientmobile.MobileClientActivatorJavaGenerator
import org.eclipselabs.scwork.template.generator.clientmobile.MobileClientBuildPropertiesGenerator
import org.eclipselabs.scwork.template.generator.clientmobile.MobileClientDotClasspathGenerator
import org.eclipselabs.scwork.template.generator.clientmobile.MobileClientDotProjectGenerator
import org.eclipselabs.scwork.template.generator.clientmobile.MobileClientManifestMfGenerator
import org.eclipselabs.scwork.template.generator.clientmobile.MobileClientOrgEclipseJdtCorePrefsGenerator
import org.eclipselabs.scwork.template.generator.clientmobile.MobileClientOrgEclipseJdtUiPrefsGenerator
import org.eclipselabs.scwork.template.generator.clientmobile.MobileClientPluginXmlGenerator
import org.eclipselabs.scwork.template.generator.clientmobile.MobileHomeFormJavaGenerator
import org.eclipselabs.scwork.template.generator.server.AccessControlServiceJavaGenerator
import org.eclipselabs.scwork.template.generator.server.DesktopServiceJavaGenerator
import org.eclipselabs.scwork.template.generator.server.IndexHtmlGenerator
import org.eclipselabs.scwork.template.generator.server.ServerActivatorJavaGenerator
import org.eclipselabs.scwork.template.generator.server.ServerApplicationJavaGenerator
import org.eclipselabs.scwork.template.generator.server.ServerBuildPropertiesGenerator
import org.eclipselabs.scwork.template.generator.server.ServerDevConfigIniGenerator
import org.eclipselabs.scwork.template.generator.server.ServerDevProductGenerator
import org.eclipselabs.scwork.template.generator.server.ServerDotClasspathGenerator
import org.eclipselabs.scwork.template.generator.server.ServerDotProjectGenerator
import org.eclipselabs.scwork.template.generator.server.ServerManifestMfGenerator
import org.eclipselabs.scwork.template.generator.server.ServerOrgEclipseJdtCorePrefsGenerator
import org.eclipselabs.scwork.template.generator.server.ServerOrgEclipseJdtUiPrefsGenerator
import org.eclipselabs.scwork.template.generator.server.ServerPluginXmlGenerator
import org.eclipselabs.scwork.template.generator.server.ServerProdConfigIniGenerator
import org.eclipselabs.scwork.template.generator.server.ServerProdProductGenerator
import org.eclipselabs.scwork.template.generator.server.ServerScoutGifGenerator
import org.eclipselabs.scwork.template.generator.server.ServerSessionJavaGenerator
import org.eclipselabs.scwork.template.generator.server.StandardOutlineServiceJavaGenerator
import org.eclipselabs.scwork.template.generator.shared.DesktopFormDataJavaGenerator
import org.eclipselabs.scwork.template.generator.shared.DocsPropertiesGenerator
import org.eclipselabs.scwork.template.generator.shared.DocumentationTextProviderServiceJavaGenerator
import org.eclipselabs.scwork.template.generator.shared.IDesktopServiceJavaGenerator
import org.eclipselabs.scwork.template.generator.shared.IStandardOutlineServiceJavaGenerator
import org.eclipselabs.scwork.template.generator.shared.IconsJavaGenerator
import org.eclipselabs.scwork.template.generator.shared.SharedActivatorJavaGenerator
import org.eclipselabs.scwork.template.generator.shared.SharedBuildPropertiesGenerator
import org.eclipselabs.scwork.template.generator.shared.SharedDotClasspathGenerator
import org.eclipselabs.scwork.template.generator.shared.SharedDotProjectGenerator
import org.eclipselabs.scwork.template.generator.shared.SharedManifestMfGenerator
import org.eclipselabs.scwork.template.generator.shared.SharedOrgEclipseJdtCorePrefsGenerator
import org.eclipselabs.scwork.template.generator.shared.SharedOrgEclipseJdtUiPrefsGenerator
import org.eclipselabs.scwork.template.generator.shared.SharedPluginXmlGenerator
import org.eclipselabs.scwork.template.generator.shared.TextProviderServiceJavaGenerator
import org.eclipselabs.scwork.template.generator.shared.TextsPropertiesGenerator
import org.eclipselabs.scwork.template.generator.target.TargetDotProjectGenerator
import org.eclipselabs.scwork.template.generator.target.TargetGenerator
import org.eclipselabs.scwork.template.generator.uirap.ApplicationCssGenerator
import org.eclipselabs.scwork.template.generator.uirap.HtmlStylesCssGenerator
import org.eclipselabs.scwork.template.generator.uirap.LogoutHtmlGenerator
import org.eclipselabs.scwork.template.generator.uirap.MobileStandaloneRwtEnvironmentJavaGenerator
import org.eclipselabs.scwork.template.generator.uirap.RapActivatorJavaGenerator
import org.eclipselabs.scwork.template.generator.uirap.RapBuildPropertiesGenerator
import org.eclipselabs.scwork.template.generator.uirap.RapDevConfigIniGenerator
import org.eclipselabs.scwork.template.generator.uirap.RapDevRapProductGenerator
import org.eclipselabs.scwork.template.generator.uirap.RapDotClasspathGenerator
import org.eclipselabs.scwork.template.generator.uirap.RapDotProjectGenerator
import org.eclipselabs.scwork.template.generator.uirap.RapManifestMfGenerator
import org.eclipselabs.scwork.template.generator.uirap.RapOrgEclipseJdtCorePrefsGenerator
import org.eclipselabs.scwork.template.generator.uirap.RapOrgEclipseJdtUiPrefsGenerator
import org.eclipselabs.scwork.template.generator.uirap.RapPluginXmlGenerator
import org.eclipselabs.scwork.template.generator.uirap.RapProdConfigIniGenerator
import org.eclipselabs.scwork.template.generator.uirap.RapProdRapProductGenerator
import org.eclipselabs.scwork.template.generator.uirap.StandaloneRwtEnvironmentJavaGenerator
import org.eclipselabs.scwork.template.generator.uirap.StartupBodyHtmlGenerator
import org.eclipselabs.scwork.template.generator.uirap.TabletStandaloneRwtEnvironmentJavaGenerator
import org.eclipselabs.scwork.template.generator.uiswing.SwingActivatorJavaGenerator
import org.eclipselabs.scwork.template.generator.uiswing.SwingApplicationJavaGenerator
import org.eclipselabs.scwork.template.generator.uiswing.SwingBuildPropertiesGenerator
import org.eclipselabs.scwork.template.generator.uiswing.SwingDevConfigIniGenerator
import org.eclipselabs.scwork.template.generator.uiswing.SwingDevProductGenerator
import org.eclipselabs.scwork.template.generator.uiswing.SwingDotClasspathGenerator
import org.eclipselabs.scwork.template.generator.uiswing.SwingDotProjectGenerator
import org.eclipselabs.scwork.template.generator.uiswing.SwingEnvironmentJavaGenerator
import org.eclipselabs.scwork.template.generator.uiswing.SwingManifestMfGenerator
import org.eclipselabs.scwork.template.generator.uiswing.SwingOrgEclipseJdtCorePrefsGenerator
import org.eclipselabs.scwork.template.generator.uiswing.SwingOrgEclipseJdtUiPrefsGenerator
import org.eclipselabs.scwork.template.generator.uiswing.SwingPluginXmlGenerator
import org.eclipselabs.scwork.template.generator.uiswing.SwingProdConfigIniGenerator
import org.eclipselabs.scwork.template.generator.uiswing.SwingProdProductGenerator
import org.eclipselabs.scwork.template.generator.uiswing.SwingScoutGifGenerator
import org.eclipselabs.scwork.template.generator.uiswt.ApplicationJavaGenerator
import org.eclipselabs.scwork.template.generator.uiswt.ApplicationWorkbenchAdvisorJavaGenerator
import org.eclipselabs.scwork.template.generator.uiswt.ApplicationWorkbenchWindowAdvisorJavaGenerator
import org.eclipselabs.scwork.template.generator.uiswt.CenterViewJavaGenerator
import org.eclipselabs.scwork.template.generator.uiswt.DesktopMenuBarJavaGenerator
import org.eclipselabs.scwork.template.generator.uiswt.EastViewJavaGenerator
import org.eclipselabs.scwork.template.generator.uiswt.NorthEastViewJavaGenerator
import org.eclipselabs.scwork.template.generator.uiswt.NorthViewJavaGenerator
import org.eclipselabs.scwork.template.generator.uiswt.NorthWestViewJavaGenerator
import org.eclipselabs.scwork.template.generator.uiswt.PerspectiveJavaGenerator
import org.eclipselabs.scwork.template.generator.uiswt.ScoutEditorPartJavaGenerator
import org.eclipselabs.scwork.template.generator.uiswt.SouthEastViewJavaGenerator
import org.eclipselabs.scwork.template.generator.uiswt.SouthViewJavaGenerator
import org.eclipselabs.scwork.template.generator.uiswt.SouthWestViewJavaGenerator
import org.eclipselabs.scwork.template.generator.uiswt.SwtActivatorJavaGenerator
import org.eclipselabs.scwork.template.generator.uiswt.SwtBuildPropertiesGenerator
import org.eclipselabs.scwork.template.generator.uiswt.SwtDevConfigIniGenerator
import org.eclipselabs.scwork.template.generator.uiswt.SwtDevSwtProductGenerator
import org.eclipselabs.scwork.template.generator.uiswt.SwtDotClasspathGenerator
import org.eclipselabs.scwork.template.generator.uiswt.SwtDotProjectGenerator
import org.eclipselabs.scwork.template.generator.uiswt.SwtEnvironmentJavaGenerator
import org.eclipselabs.scwork.template.generator.uiswt.SwtManifestMfGenerator
import org.eclipselabs.scwork.template.generator.uiswt.SwtOrgEclipseJdtCorePrefsGenerator
import org.eclipselabs.scwork.template.generator.uiswt.SwtOrgEclipseJdtUiPrefsGenerator
import org.eclipselabs.scwork.template.generator.uiswt.SwtPluginXmlGenerator
import org.eclipselabs.scwork.template.generator.uiswt.SwtProdConfigIniGenerator
import org.eclipselabs.scwork.template.generator.uiswt.SwtProdSwtProductGenerator
import org.eclipselabs.scwork.template.generator.uiswt.SwtStartupJavaGenerator
import org.eclipselabs.scwork.template.generator.uiswt.WestViewJavaGenerator
import org.eclipselabs.scwork.template.generator.uiswt.ProgressViewGifGenerator
import org.eclipselabs.scwork.template.generator.uiswt.Scout16GifGenerator
import org.eclipselabs.scwork.template.generator.uiswt.Scout32GifGenerator
import org.eclipselabs.scwork.template.generator.uiswt.SplashBmpGenerator
import org.eclipselabs.scwork.template.generator.uiswt.SwtScoutGifGenerator
import org.eclipselabs.scwork.template.generator.uirap.LoadingGifGenerator
import org.eclipselabs.scwork.template.generator.uirap.RapScoutGifGenerator
import org.eclipselabs.scwork.template.generator.uirap.ScoutBackgroundPngGenerator

class TemplateUtility {
	
	def static List<IFileGenerator> getAllGenerators() {
		Arrays.asList(
			//client:
			new ClientActivatorJavaGenerator,
			new ClientBuildPropertiesGenerator,
			new ClientDotClasspathGenerator,
			new ClientDotProjectGenerator,
			new ClientManifestMfGenerator,
			new ClientOrgEclipseJdtCorePrefsGenerator,
			new ClientOrgEclipseJdtUiPrefsGenerator,
			new ClientPluginXmlGenerator,
			new ClientScoutGifGenerator,
			new ClientSessionJavaGenerator,
			new DesktopFormJavaGenerator,
			new DesktopJavaGenerator,
			new EyePngGenerator,
			new StandardOutlineJavaGenerator,
			
			//client mobile:
			new DesktopExtensionJavaGenerator,
			new MobileClientActivatorJavaGenerator,
			new MobileClientBuildPropertiesGenerator,
			new MobileClientDotClasspathGenerator,
			new MobileClientDotProjectGenerator,
			new MobileClientManifestMfGenerator,
			new MobileClientOrgEclipseJdtCorePrefsGenerator,
			new MobileClientOrgEclipseJdtUiPrefsGenerator,
			new MobileClientPluginXmlGenerator,
			new MobileHomeFormJavaGenerator,
			
			//shared:
			new DesktopFormDataJavaGenerator,
			new DocsPropertiesGenerator,
			new DocumentationTextProviderServiceJavaGenerator,
			new IconsJavaGenerator,
			new IDesktopServiceJavaGenerator,
			new IStandardOutlineServiceJavaGenerator,
			new SharedActivatorJavaGenerator,
			new SharedBuildPropertiesGenerator,
			new SharedDotClasspathGenerator,
			new SharedDotProjectGenerator,
			new SharedManifestMfGenerator,
			new SharedOrgEclipseJdtCorePrefsGenerator,
			new SharedOrgEclipseJdtUiPrefsGenerator,
			new SharedPluginXmlGenerator,
			new TextProviderServiceJavaGenerator,
			new TextsPropertiesGenerator,
			
			//server:
			new AccessControlServiceJavaGenerator,
			new DesktopServiceJavaGenerator,
			new IndexHtmlGenerator,
			new ServerActivatorJavaGenerator,
			new ServerApplicationJavaGenerator,
			new ServerBuildPropertiesGenerator,
			new ServerDevProductGenerator,
			new ServerDevConfigIniGenerator,
			new ServerDotClasspathGenerator,
			new ServerDotProjectGenerator,
			new ServerManifestMfGenerator,
			new ServerOrgEclipseJdtCorePrefsGenerator,
			new ServerOrgEclipseJdtUiPrefsGenerator,
			new ServerPluginXmlGenerator,
			new ServerProdProductGenerator,
			new ServerProdConfigIniGenerator,
			new ServerScoutGifGenerator,
			new ServerSessionJavaGenerator,
			new StandardOutlineServiceJavaGenerator,
			
			//Target:
			new TargetDotProjectGenerator,
			new TargetGenerator,
			
			//UI Rap:
			new ApplicationCssGenerator,
			new HtmlStylesCssGenerator,
			new LoadingGifGenerator,
			new LogoutHtmlGenerator,
			new MobileStandaloneRwtEnvironmentJavaGenerator,
			new RapActivatorJavaGenerator,
			new RapBuildPropertiesGenerator,
			new RapDevConfigIniGenerator,
			new RapDevRapProductGenerator,
			new RapDotClasspathGenerator,
			new RapDotProjectGenerator,
			new RapManifestMfGenerator,
			new RapOrgEclipseJdtCorePrefsGenerator,
			new RapOrgEclipseJdtUiPrefsGenerator,
			new RapPluginXmlGenerator,
			new RapProdConfigIniGenerator,
			new RapProdRapProductGenerator,
			new RapScoutGifGenerator,
			new ScoutBackgroundPngGenerator,
			new StandaloneRwtEnvironmentJavaGenerator,
			new StartupBodyHtmlGenerator,
			new TabletStandaloneRwtEnvironmentJavaGenerator,
			
			//UI Swing:
			new SwingActivatorJavaGenerator,
			new SwingApplicationJavaGenerator,
			new SwingBuildPropertiesGenerator,
			new SwingDevConfigIniGenerator,
			new SwingDevProductGenerator,
			new SwingDotClasspathGenerator,
			new SwingDotProjectGenerator,
			new SwingEnvironmentJavaGenerator,
			new SwingManifestMfGenerator,
			new SwingOrgEclipseJdtCorePrefsGenerator,
			new SwingOrgEclipseJdtUiPrefsGenerator,
			new SwingPluginXmlGenerator,
			new SwingProdConfigIniGenerator,
			new SwingProdProductGenerator,
			new SwingScoutGifGenerator,
		
			//UI Swt:
			new ApplicationJavaGenerator,
			new ApplicationWorkbenchAdvisorJavaGenerator,
			new ApplicationWorkbenchWindowAdvisorJavaGenerator,
			new CenterViewJavaGenerator,
			new DesktopMenuBarJavaGenerator,
			new EastViewJavaGenerator,
			new NorthEastViewJavaGenerator,
			new NorthViewJavaGenerator,
			new NorthWestViewJavaGenerator,
			new PerspectiveJavaGenerator,
			new ProgressViewGifGenerator,
			new Scout16GifGenerator,
			new Scout32GifGenerator,
			new ScoutEditorPartJavaGenerator,
			new SouthEastViewJavaGenerator,
			new SouthViewJavaGenerator,
			new SouthWestViewJavaGenerator,
			new SplashBmpGenerator,
			new SwtActivatorJavaGenerator,
			new SwtBuildPropertiesGenerator,
			new SwtDevConfigIniGenerator,
			new SwtDevSwtProductGenerator,
			new SwtDotClasspathGenerator,
			new SwtDotProjectGenerator,
			new SwtEnvironmentJavaGenerator,
			new SwtManifestMfGenerator,
			new SwtOrgEclipseJdtCorePrefsGenerator,
			new SwtOrgEclipseJdtUiPrefsGenerator,
			new SwtPluginXmlGenerator,
			new SwtProdConfigIniGenerator,
			new SwtProdSwtProductGenerator,
			new SwtScoutGifGenerator,
			new SwtStartupJavaGenerator,
			new WestViewJavaGenerator
		)
	}
	
	def static void generateAll(List<IFileGenerator> generators, InputParam param) {
		generators.forEach[g |
			g.generate(param)
		]
	}
	
	def static void generate(IFileGenerator g, InputParam param) {
		if(g.shouldGenerate(param)) {
			val f = g.provideFile(param)
			Files.createParentDirs(f)
			g.writeToFile(param, f)
		}
	}
	
	def static private dispatch void writeToFile(IFileGenerator g, InputParam param, File file) {
		throw new UnsupportedOperationException("no implementation")
	}
	
	def static private dispatch void writeToFile(ITextFileGenerator g, InputParam param, File file) {
		Files.write(g.provideContent(param), file, Charsets.UTF_8)
	}
	
	def static private dispatch void writeToFile(IBinFileGenerator g, InputParam param, File file) {
		val inputStream = ClassPath.getResourceAsStream("/org/eclipselabs/scwork/template/bin/" + g.provideResourceName)
		ByteStreams.copy(inputStream, Files.newOutputStreamSupplier(file));
	}
}