package CURDoperation.portlet;

import CURDoperation.constants.CURDoperationPortletKeys;

import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.json.JSONFactoryUtil;
import com.liferay.portal.kernel.json.JSONObject;
import com.liferay.portal.kernel.language.Language;
import com.liferay.portal.kernel.language.LanguageUtil;
import com.liferay.portal.kernel.model.Contact;
import com.liferay.portal.kernel.model.Country;
import com.liferay.portal.kernel.model.CountryModel;
import com.liferay.portal.kernel.model.Image;
import com.liferay.portal.kernel.model.ListType;
import com.liferay.portal.kernel.model.Organization;
import com.liferay.portal.kernel.model.Role;
import com.liferay.portal.kernel.model.User;
import com.liferay.portal.kernel.model.UserGroupRole;
import com.liferay.portal.kernel.model.UserModel;
import com.liferay.portal.kernel.model.UserSoap;
import com.liferay.portal.kernel.portlet.bridges.mvc.MVCPortlet;
import com.liferay.portal.kernel.security.permission.PermissionThreadLocal;
import com.liferay.portal.kernel.service.ContactLocalServiceUtil;
import com.liferay.portal.kernel.service.CountryServiceUtil;
import com.liferay.portal.kernel.service.ImageLocalService;
import com.liferay.portal.kernel.service.ImageLocalServiceUtil;
import com.liferay.portal.kernel.service.ListTypeLocalServiceUtil;
import com.liferay.portal.kernel.service.ListTypeServiceUtil;
import com.liferay.portal.kernel.service.OrganizationLocalServiceUtil;
import com.liferay.portal.kernel.service.RoleLocalServiceUtil;
import com.liferay.portal.kernel.service.UserGroupRoleLocalServiceUtil;
import com.liferay.portal.kernel.service.UserLocalServiceUtil;
import com.liferay.portal.kernel.theme.ThemeDisplay;
import com.liferay.portal.kernel.upload.UploadPortletRequest;
import com.liferay.portal.kernel.util.File;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.kernel.util.PortalUtil;
import com.liferay.portal.kernel.util.WebKeys;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.List;
import java.util.Locale;
import java.util.Set;

import javax.imageio.ImageIO;
import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.MimeResponse;
import javax.portlet.Portlet;
import javax.portlet.PortletException;
import javax.portlet.ProcessAction;
import javax.portlet.RenderParameters;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;

import org.osgi.service.component.annotations.Component;

/**
 * @author axxonet5
 */
@Component(immediate = true, property = { "com.liferay.portlet.display-category=category.sample",
		"com.liferay.portlet.header-portlet-css=/css/main.css", "com.liferay.portlet.instanceable=true",
		"javax.portlet.display-name=CURDoperation", "javax.portlet.init-param.template-path=/",
		"javax.portlet.init-param.view-template=/view.jsp",
		"javax.portlet.name=" + CURDoperationPortletKeys.CURDOPERATION,
		"javax.portlet.resource-bundle=content.Language",
		"javax.portlet.security-role-ref=power-user,user" }, service = Portlet.class)
public class CURDoperationPortlet extends MVCPortlet {

	// render the list of organization and users
	@Override
	public void render(RenderRequest renderRequest, RenderResponse renderResponse)
			throws IOException, PortletException {

		try {
			long companyid = PermissionThreadLocal.getPermissionChecker().getCompanyId();
			long userid = PermissionThreadLocal.getPermissionChecker().getUserId();
			boolean defaultuser = false;
			System.out.println(" " + userid);

			List<ListType> prefixList = ListTypeServiceUtil.getListTypes(Contact.class.getName() + ".prefix");
			List<ListType> suffixList = ListTypeServiceUtil.getListTypes(Contact.class.getName() + ".suffix");

			// System.out.println(" "+roleIds);
			// Set<Locale> Language = LanguageUtil.getAvailableLocales();

//			     List <Image> image = ImageLocalServiceUtil.getImages();		     
//			     System.out.println(" "+image);

			List<Country> Country = CountryServiceUtil.getCountries();

			// List<Role> userRoles=RoleLocalServiceUtil.getUserRoles(userid);

			List<Role> userRoles = RoleLocalServiceUtil.getRoles(companyid);

			List<Organization> organizationList = OrganizationLocalServiceUtil.getOrganizations(companyid, 0, -1, -1);

			// List<Organization> organizationList =
			// OrganizationLocalServiceUtil.getOrganizations(userid, -1, -1, null);
			// List<Organization> organizationList =
			// OrganizationLocalServiceUtil.getUserOrganizations(userid);
			// System.out.println("org "+organizationList);

			List<User> userList = UserLocalServiceUtil.getUsers(companyid, defaultuser, 0, -1, -1, null);

			List<Contact> Contact = ContactLocalServiceUtil.getCompanyContacts(companyid, -1, -1);

			List<ListType> list = ListTypeLocalServiceUtil.getListTypes(-1, -1);

			int dashorganization = OrganizationLocalServiceUtil.getOrganizationsCount();
			int organ = OrganizationLocalServiceUtil.getUserOrganizationsCount(userid);
			int companyuser = UserLocalServiceUtil.getCompanyUsersCount(companyid);

			renderRequest.setAttribute("userRoles", userRoles);
			renderRequest.setAttribute("organizationList", organizationList);
			renderRequest.setAttribute("userList", userList);
			renderRequest.setAttribute("Country", Country);
			renderRequest.setAttribute("prefixList", prefixList);
			renderRequest.setAttribute("suffixList", suffixList);
			renderRequest.setAttribute("Contact", Contact);
			renderRequest.setAttribute("dashorganization", dashorganization);
			renderRequest.setAttribute("organ", organ);
			renderRequest.setAttribute("companyuser", companyuser);
			renderRequest.setAttribute("list", list);
			renderRequest.setAttribute("userid", userid);

		} catch (SystemException e) {
			e.printStackTrace();
		}

		super.render(renderRequest, renderResponse);
	}

	// validation
	@Override
	public void serveResource(ResourceRequest resourceRequest, ResourceResponse resourceResponse)
			throws IOException, PortletException {

		String cmd = ParamUtil.getString(resourceRequest, "cmd");
		String emailAddress = ParamUtil.getString(resourceRequest, "emailAddress");
		String screeName = ParamUtil.getString(resourceRequest, "screeName");
		String organizationName = ParamUtil.getString(resourceRequest, "organizationName");

		if (cmd.equals("EMAIL")) {
			emailValidation(resourceRequest, resourceResponse, emailAddress);
		}
		if (cmd.equals("SCREENNAME")) {
			screenNameValidation(resourceRequest, resourceResponse, screeName);
		}
		if (cmd.equals("ORGANIZATION")) {
			organizationNameValidation(resourceRequest, resourceResponse, organizationName);
		}
	}

	// screenName validation
	public void screenNameValidation(ResourceRequest resourceRequest, ResourceResponse resourceResponse,
			String screeName) throws IOException, PortletException {

		User user = null;
		JSONObject jsonUser = JSONFactoryUtil.createJSONObject();
		ThemeDisplay themeDisplay = (ThemeDisplay) resourceRequest.getAttribute(WebKeys.THEME_DISPLAY);
		try {
			user = UserLocalServiceUtil.getUserByScreenName(themeDisplay.getCompanyId(), screeName);

			if (user != null) {
				jsonUser.put("screenNameExist", "true");
			}
		} catch (PortalException e) {
			jsonUser.put("screenNameExist", "false");
		} catch (SystemException e) {
			jsonUser.put("screenNameExist", "false");
		}
		PrintWriter out = resourceResponse.getWriter();
		out.println(jsonUser.toString());
	}

	// email validation
	public void emailValidation(ResourceRequest resourceRequest, ResourceResponse resourceResponse, String emailAddress)
			throws IOException, PortletException {

		User user = null;
		JSONObject jsonUser = JSONFactoryUtil.createJSONObject();
		ThemeDisplay themeDisplay = (ThemeDisplay) resourceRequest.getAttribute(WebKeys.THEME_DISPLAY);
		try {
			user = UserLocalServiceUtil.getUserByEmailAddress(themeDisplay.getCompanyId(), emailAddress);

			if (user != null) {
				jsonUser.put("emailExist", "true");
			} else {
				jsonUser.put("emailExist", "false");
			}
		} catch (PortalException e) {
			jsonUser.put("emailExist", "false");
		} catch (SystemException e) {
			jsonUser.put("emailExist", "false");
		}
		PrintWriter out = resourceResponse.getWriter();
		out.println(jsonUser.toString());
	}

	// organization validation
	public void organizationNameValidation(ResourceRequest resourceRequest, ResourceResponse resourceResponse,
			String organizationName) throws IOException, PortletException {

		Organization org = null;
		JSONObject jsonUser = JSONFactoryUtil.createJSONObject();
		ThemeDisplay themeDisplay = (ThemeDisplay) resourceRequest.getAttribute(WebKeys.THEME_DISPLAY);

		try {
			org = OrganizationLocalServiceUtil.getOrganization(themeDisplay.getCompanyId(), organizationName);

			System.out.println(" " + org);
			if (org != null) {
				jsonUser.put("organizationNameExist", "true");
			}
		} catch (PortalException e) {
			jsonUser.put("organizationNameExist", "false");
		} catch (SystemException e) {
			jsonUser.put("organizationNameExist", "false");
		}
		PrintWriter out = resourceResponse.getWriter();
		out.println(jsonUser.toString());
	}

	// create organization
	@ProcessAction(name = "createorg")
	public void createorg(ActionRequest actionRequest, ActionResponse actionResponse)
			throws IOException, PortletException, PortalException, SystemException {

		String orgname = ParamUtil.getString(actionRequest, "organizationName");
		String country = ParamUtil.getString(actionRequest, "CountryId");
		int CountryId = Integer.parseInt(country);
		long userid = PermissionThreadLocal.getPermissionChecker().getUserId();
		String type = "organization";

		try {
			Organization org = OrganizationLocalServiceUtil.addOrganization(userid, 0, orgname, type, 0, CountryId,
					12017, null, addProcessActionSuccessMessage, null);
			long orgId = org.getOrganizationId();

			organization.insertorganization(orgId, orgname, CountryId);

			System.out.println("organization added succesfuly");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// create user
	@ProcessAction(name = "createuser")
	public void createuser(ActionRequest actionRequest, ActionResponse actionResponse)
			throws IOException, PortletException, PortalException, SystemException {

		ThemeDisplay themeDisplay = (ThemeDisplay) actionRequest.getAttribute(WebKeys.THEME_DISPLAY);
		String screenName = ParamUtil.getString(actionRequest, "screeName");
		String emailAddress = ParamUtil.getString(actionRequest, "emailAddress");
		String firstName = ParamUtil.getString(actionRequest, "firstName");
		String middleName = ParamUtil.getString(actionRequest, "middleName");
		String lastName = ParamUtil.getString(actionRequest, "lastName");
		String jobTitle = ParamUtil.getString(actionRequest, "jobTitle");
		String password1 = ParamUtil.getString(actionRequest, "password1");
		String password2 = ParamUtil.getString(actionRequest, "password2");
		String languageId = ParamUtil.getString(actionRequest, "Language");
		long prefixId = ParamUtil.getLong(actionRequest, "prefixId");
		long suffixId = ParamUtil.getLong(actionRequest, "suffixId");
		String ge = ParamUtil.getString(actionRequest, "Gender");
		boolean gen = Boolean.parseBoolean(ge);
		String Birthday = ParamUtil.getString(actionRequest, "Birthday");
		String[] out = Birthday.split("-");
		int Year = Integer.parseInt(out[0]);
		int Month = Integer.parseInt(out[1]);
		int mon = Month - 1;
		int Day = Integer.parseInt(out[2]);
		String comments = ParamUtil.getString(actionRequest, "comments");
		long[] RoleId = ParamUtil.getLongValues(actionRequest, "Role");
		long[] OrgId = ParamUtil.getLongValues(actionRequest, "OrgId");
		System.out.println(" " + RoleId);
		System.out.println(" " + OrgId);
		long companyId = themeDisplay.getCompanyId();
		Locale currentLocale = Locale.getDefault();

		try {
			User use = UserLocalServiceUtil.addUser(0, companyId, true, password1, password2, true, screenName,
					emailAddress, 0, null, currentLocale, firstName, middleName, lastName, prefixId, suffixId, gen, mon,
					Day, Year, jobTitle, null, OrgId, RoleId, null, addProcessActionSuccessMessage, null);
			long userid = use.getUserId();

			UserLocalServiceUtil.updateUser(userid, null, password1, password2, true, null, null, screenName,
					emailAddress, 0, null, true, null, languageId, null, null, comments, firstName, middleName,
					lastName, prefixId, suffixId, gen, mon, Day, Year, null, null, null, null, null, jobTitle, null,
					OrgId, RoleId, null, null, null);

			user.insertUser(screenName, emailAddress, firstName, middleName, lastName, jobTitle, comments, gen, userid);

			System.out.println("user added succesfuly");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// delete organization
	@ProcessAction(name = "deleteorganization")
	public void deleteorganization(ActionRequest actionRequest, ActionResponse actionResponse)
			throws IOException, PortletException, PortalException, SystemException {

		long organizationId = ParamUtil.getLong(actionRequest, "organizationId");
		try {
			OrganizationLocalServiceUtil.deleteOrganization(organizationId);

			organization.deleteorganization(organizationId);

			System.out.println("organization delete succesfuly");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// delete user
	@ProcessAction(name = "deleteuser")
	public void deleteuser(ActionRequest actionRequest, ActionResponse actionResponse)
			throws IOException, PortletException, PortalException, SystemException {

		long userid = ParamUtil.getLong(actionRequest, "userId");
		try {
			UserLocalServiceUtil.deleteUser(userid);

			user.deleteUser(userid);

			System.out.println("user delete succesfuly");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// edit organization
	@ProcessAction(name = "updateorg")
	public void updateorg(ActionRequest actionRequest, ActionResponse actionResponse)
			throws IOException, PortletException, PortalException, SystemException {

		long uporganizationId = ParamUtil.getLong(actionRequest, "uporganizationId");
		String name = ParamUtil.getString(actionRequest, "uporganizationName");
		String Country = ParamUtil.getString(actionRequest, "CountryId");
		int CountryId = Integer.parseInt(Country);
		String type = "organization";
		String mess = "organization";
		long companyid = PermissionThreadLocal.getPermissionChecker().getCompanyId();

		try {
			OrganizationLocalServiceUtil.updateOrganization(companyid, uporganizationId, 0, name, type, 0, CountryId,
					12017, mess, alwaysSendRedirect, null, addProcessActionSuccessMessage, null);

			organization.updateorganization(uporganizationId, name, CountryId);

			System.out.println("organization updated succesfuly");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// edit user
	@ProcessAction(name = "Updateuser")
	public void Updateuser(ActionRequest actionRequest, ActionResponse actionResponse)
			throws IOException, PortletException, PortalException, SystemException {

		long userId = ParamUtil.getLong(actionRequest, "upuserId");
		String screenname = ParamUtil.getString(actionRequest, "screenName");
		String email = ParamUtil.getString(actionRequest, "emailAddress");
		String firstname = ParamUtil.getString(actionRequest, "firstName");
		String middlename = ParamUtil.getString(actionRequest, "middleName");
		String lastname = ParamUtil.getString(actionRequest, "lastName");
		String password1 = ParamUtil.getString(actionRequest, "password1");
		String password2 = ParamUtil.getString(actionRequest, "password2");
		String comments = ParamUtil.getString(actionRequest, "comments");
		String jobTitle = ParamUtil.getString(actionRequest, "jobTitle");
		long[] RoleId = ParamUtil.getLongValues(actionRequest, "Role");
		long[] OrgId = ParamUtil.getLongValues(actionRequest, "OrgId");
		String languageId = ParamUtil.getString(actionRequest, "languageId");
		String ge = ParamUtil.getString(actionRequest, "Gender");
		boolean gen = Boolean.parseBoolean(ge);
		long prefixId = ParamUtil.getLong(actionRequest, "prefixId");
		long suffixId = ParamUtil.getLong(actionRequest, "suffixId");
		String Birthday = ParamUtil.getString(actionRequest, "Birthday");
		String[] out = Birthday.split("/");
		int Day = Integer.parseInt(out[1]);
		int Month = Integer.parseInt(out[0]);
		int mon = Month - 1;
		int  Year= Integer.parseInt(out[2]);	

		try {
			UserLocalServiceUtil.updateUser(userId, null, password1, password2, true, null, null, screenname, email, 0,
					null, true, null, languageId, null, null, comments, firstname, middlename, lastname, prefixId,
					suffixId, gen, mon, Day, Year, null, null, null, null, null, jobTitle, null, OrgId,
					RoleId, null, null, null);

			user.updateUser(screenname, email, firstname, middlename, lastname, jobTitle, comments, gen, userId);

			System.out.println("user updated succesfuly");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// @MultipartConfig
	@ProcessAction(name = "addimage")
	public void addimage(ActionRequest actionRequest, ActionResponse actionResponse)
			throws IOException, PortletException, PortalException, SystemException {

		long userId = ParamUtil.getLong(actionRequest, "userId");
		
	//	String imag=ParamUtil.getString(actionRequest,"img");
		 Part file=actionRequest.getPart("img"); 
		 System.out.println(file);	 
		// FileInputStream fs=new FileInputStream(imag);
		 
		 InputStream is=file.getInputStream();
		 byte[] date=new byte[is.available()];
		 System.out.println(date);	

		try {
			UserLocalServiceUtil.updatePortrait(userId, date);
			System.out.println(" profile uploaded successfuly ");

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
		}
	}

	public static void insertUser(User newUser) {

	}

	public static void deleteUser(long userid) {

	}

	public static void updateUser(User newUser) {

	}

	public static void updateorganization(Organization neworganization) {

	}

	public static void insertorganization(Organization neworganization) {

	}

	public static void deleteorganizaition(long organizationid) {

	}
}
