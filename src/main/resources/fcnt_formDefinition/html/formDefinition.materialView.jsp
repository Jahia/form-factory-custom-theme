<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>

<div layout="row"
     layout-sm="column"
     ng-if="!_.isUndefined(vm.currentForm.progressBar) && vm.currentForm.progressBar.position === 'top' || vm.currentForm.progressBar.position === 'both'">
    <div flex>
        <ff-progress-bar view-type="materialView"
                         form="vm.currentForm"
                         current-step="vm.currentStep">
        </ff-progress-bar>
    </div>
</div>

<div layout="row" layout-sm="column">
    <div flex>
        <form novalidate name="{{vm.formName}}"
              ng-model-options="{updateOn:'default blur', debounce: { default: 0, blur: 0 } }"
              ng-submit="vm.preventSubmit($event)"
              class="{{vm.cssClassName}}">
            <div layout="row" layout-sm="column">
                <div flex>
                    <fieldset>
                        <legend ng-if="vm.showFormTitle">{{vm.currentForm.displayableName}}</legend>

                        <!--** START ** Display after form submission **-->
                        <div layout="row" layout-wrap layout-margin
                             ng-if="vm.getFormController().$submitted">
                            <div flex-auto>
                                <div layout="row">
                                    <div flex-auto="100"
                                         class="text-center"
                                         ng-if="!vm.displaySubmissionText && (!vm.runCallbacks && vm.currentForm.callbacks.displayTemplates)
     || !vm.displaySubmissionText && (vm.runCallbacks && !vm.currentForm.callbacks.displayTemplates)
     || !vm.displaySubmissionText && vm.currentForm.callbacks === null">
                                        <i class="fa fa-spinner fa-spin fa-3x"></i>
                                    </div>
                                </div>
                                <div layout="row">
                                    <div flex-auto="100">
                                        <ff-callback ng-if="vm.runCallbacks"
                                                     action-data="vm.actionData"
                                                     result-data="vm.resultData"
                                                     callback-directives="vm.currentForm.callbacks.callbacks"
                                                     all-completed-flag="vm.displaySubmissionText"
                                                     display-templates="vm.currentForm.callbacks.displayTemplates">
                                        </ff-callback>
                                    </div>
                                </div>
                                <div layout="row">
                                    <div flex-auto="100" ng-if="vm.displaySubmissionText">
                                        <strong ng-bind-html="vm.currentForm.afterSubmissionText"></strong>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--** END ** Display after form submission **-->

                        <div layout="row"
                             layout-sm="column"
                             ng-repeat="input in vm.inputs">
                            <div flex>
                                <ff-input
                                          input="input"
                                          resolve-logic="vm.resolveLogic(input, vm.getFormController())"
                                          resolve-placeholder="vm.resolvePlaceholder(input)"
                                          resolve-inputsize="vm.resolveInputsize(input)"
                                          resolve-name="vm.resolveName(input)"
                                          resolve-label="vm.resolveLabel(input)">
                                </ff-input>
                            </div>
                        </div>
                        <div layout="row"
                             layout-sm="column"
                             ng-if="vm.getCaptchaKey() !== null && vm.currentForm.steps.length-1 === vm.currentStep && vm.currentForm.displayCaptcha">
                            <div flex
                                class="text-right">
                                <div vc-recaptcha theme="'light'"
                                     key="vm.getCaptchaKey()"
                                     on-create="vm.notifyOfCaptchaLoad()">
                                </div>
                            </div>
                        </div>
                        <div layout="row"
                             layout-sm="column">
                            <div flex-offset="15" flex="85">
                                <md-button type="button"
                                        ng-click="vm.update(false)"
                                        ng-disabled="vm.getFormController().$submitted"
                                        ng-show="vm.currentStep>0&&!vm.isSubmitted()">
                                    <span message-key="angular.ffController.button.previousStep"></span>
                                </md-button>
                                <md-button class="md-primary"
                                        type="button"
                                        ng-click="vm.update(true)"
                                        ng-disabled="vm.getFormController().$invalid
                                            || vm.getFormController().$submitted
                                            || vm.isPreviewMode
                                            || (vm.getCaptchaKey() !== null && !vm.captchaLoaded)
                                            || vm.currentStep<vm.currentForm.steps.length-1"
                                        ng-show="vm.currentStep==vm.currentForm.steps.length-1&&!vm.isSubmitted()">
                                    <span message-key="angular.ffController.button.submit"></span>
                                </md-button>
                                <md-button type="button"
                                        ng-click="vm.update(true)"
                                        ng-disabled="vm.getFormController().$invalid || vm.getFormController().$submitted"
                                        ng-show="vm.currentStep<vm.currentForm.steps.length-1&&!vm.isSubmitted()">
                                    <span message-key="angular.ffController.button.nextStep"></span>
                                </md-button>
                                <md-button class="md-warn"
                                        type="button" ng-click="vm.reset()"
                                        ng-disabled="vm.getFormController().$submitted || vm.currentForm.steps[vm.currentStep].resetDisabled"
                                        ng-show="!vm.isSubmitted()">
                                    <span message-key="angular.ffController.button.reset"></span>
                                </md-button>
                            </div>
                        </div>
                    </fieldset>
                </div>
            </div>
        </form>
    </div>
</div>

<div layout="row"
     layout-sm="column"
     ng-if="!_.isUndefined(vm.currentForm.progressBar) && vm.currentForm.progressBar.position === 'bottom' || vm.currentForm.progressBar.position === 'both'">
    <div flex>
        <ff-progress-bar view-type="materialView"
                         form="vm.currentForm"
                         current-step="vm.currentStep">
        </ff-progress-bar>
    </div>
</div>


