<!-- Text input-->
<md-content md-theme="docs-dark" layout-gt-sm="row" layout-padding>
    <div>
        <md-input-container>
            <label>{{input.label}}</label>
            <input type="text"
                   md-placeholder="{{input.placeholder}}"
                   name="{{input.name}}"
                   ng-model="input.value"
                   ng-required="isRequired()"
                   ng-readonly="readOnly"
                   ff-validations
                   ff-logic>
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