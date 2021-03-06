<!-- Password Input-->
<md-content md-theme="blue-theme"
            layout-gt-sm="row"
            layout-padding
            ng-show="resolveLogic()">
    <div>
        <md-input-container>
            <label>{{input.label}}
                <span ng-if="isRequired()"
                      ng-show="asteriskResolver()">
                        <sup>
                            &nbsp;
                            <i class="fa fa-asterisk fa-sm"></i>
                        </sup>
                </span>
            </label>
            <input type="password"
                   ng-model-options="{allowInvalid:true}"
                   md-no-asterisk
                   md-placeholder="{{input.placeholder}}"
                   name="{{input.name}}"
                   ng-model="input.value"
                   ng-required="isRequired()"
                   ng-readonly="readOnly"
                   ff-validations
                   ff-logic
                   ff-focus-tracker="{{input.name}}">
            <div ng-messages="form[input.name].$error" multiple>
                <div ng-show="form.$dirty">
                    <div ng-message-exp="(validationName | normalize)"
                         ng-repeat="(validationName, validation) in input.validations">
                        {{validation.message}}
                    </div>
                </div>
            </div>
        </md-input-container>
    </div>
</md-content>