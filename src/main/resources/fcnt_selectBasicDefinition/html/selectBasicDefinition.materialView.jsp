<!-- Select Basic -->
<md-content md-theme="blue-theme"
            layout-gt-sm="row"
            layout-padding
            ng-show="resolveLogic()">
    <div>
        <md-input-container class="md-block">
            <label>
                {{input.label}}
            </label>
            <md-select type="select-basic"
                    ng-model-options="{allowInvalid:true}"
                    name="{{input.name}}"
                    ng-model="input.value"
                    ng-required="isRequired()"
                    ng-disabled="readOnly"
                    ff-validations
                    ff-logic
                       ff-focus-tracker="{{input.name}}">
                <md-option ng-if="input.value == '' || input.value === null" value="">{{input.placeholder}}</md-option>
                <md-option ng-repeat="option in input.options | filter: 'true' : null : visible" value="{{option.key}}">{{option.value}}</md-option>
            </md-select>
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