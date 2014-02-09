window.SAPMS = window.SAPMS || {};

SAPMS.serviceURL = "SAPMS_V3";
SAPMS.uiFramework = "bootstrap";

SAPMS.waitForLoading = '<center> <div class="div_loading"> <img src="img/ajax-loader.gif" width="20px"/> </div> </center>';

SAPMS.user = {
    userType: "UNKNOWN",
    isUserLoggedIn: false,
    accountID: "UNKNOWN",
    kfupmID:"UNKNOWN"
};
SAPMS.util = SAPMS.util || {};
SAPMS.navBarPage = SAPMS.navBarPage || {};
SAPMS.loginPage = SAPMS.loginPage || {};
SAPMS.studentPage = SAPMS.studentPage || {};
SAPMS.facultyPage = SAPMS.facultyPage || {};

SAPMS.util.loadPage = function(path, params, where) {
    $(where).html(SAPMS.waitForLoading);
    $.ajax({
        type: 'POST',
        url: SAPMS.serviceURL,
        dataType: 'html',
        data: {cmd: 'loadPage',
            path: path,
            params: params,
            framework: SAPMS.uiFramework
        },
        success: function(result) {
            $(where).html(result);
            $(where).find('script').each(function() {
                eval($(this).text());
            });
        },
        error: function() {
            SAPMS.util.setLoadingAnimationVisible(false, where);
            SAPMS.util.showError("Communication Error! Could not load " + path + "UI.jsp! Check network connection and try again.");
        }
    });
};


SAPMS.util.init = function() {
    SAPMS.util.loadPage("login/login.jsp", "", "#div_login");
};

$(document).ready(function() {
    SAPMS.util.init();
});