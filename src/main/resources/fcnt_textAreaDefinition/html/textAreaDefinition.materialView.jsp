<!-- Text Area -->
<md-content md-theme="blue-theme"
            layout-gt-sm="row"
            layout-padding
            ng-show="resolveLogic()">
    <div>
        <md-input-container>
            <label>{{input.label}}
                <span ng-if="isRequired()"
                      ng-show="form.$dirty">
                        <sup>
                            &nbsp;
                            <i class="fa fa-asterisk fa-sm"></i>
                        </sup>
                </span>
            </label>
            <textarea rows="{{input.rows}}"
                      md-no-asterisk
                      ng-model-options="{allowInvalid:true}"
                      ng-model="input.value"
                      md-placeholder="{{input.placeholder}}"
                      name="{{input.name}}"
                      ng-required="isRequired()"
                      ng-readonly="readOnly"
                      ff-validations
                      ff-logic
                      ff-focus-tracker="{{input.name}}">
                {{input.value}}
            </textarea>
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