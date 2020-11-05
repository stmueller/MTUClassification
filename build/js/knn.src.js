
// This file is an automatically generated and should not be edited

'use strict';

const options = [{"name":"data","type":"Data"},{"name":"dv","title":"Dependent Variable","type":"Variable"},{"name":"idv","title":"Independent Variables","type":"Variables"},{"name":"k","title":"Number of Levels (K)","type":"Integer","default":2,"min":1},{"name":"split","title":"Train/test split(50% to 90%)","type":"Integer","default":75,"min":50,"max":90},{"name":"isNorm","title":"Normalize Variables","type":"Bool","default":false}];

const view = View.extend({
    jus: "2.0",

    events: [

	]

});

view.layout = ui.extend({

    label: "K Nearest Neighbor",
    jus: "2.0",
    type: "root",
    stage: 0, //0 - release, 1 - development, 2 - proposed
    controls: [
		{
			type: DefaultControls.VariableSupplier,
			persistentItems: false,
			stretchFactor: 1,
			controls: [
				{
					type: DefaultControls.TargetLayoutBox,
					label: "Dependent Variable",
					controls: [
						{
							type: DefaultControls.VariablesListBox,
							name: "dv",
							maxItemCount: 1,
							isTarget: true
						}
					]
				},
				{
					type: DefaultControls.TargetLayoutBox,
					label: "Independent Variables",
					controls: [
						{
							type: DefaultControls.VariablesListBox,
							name: "idv",
							isTarget: true
						}
					]
				}
			]
		},
		{
			type: DefaultControls.LayoutBox,
			margin: "large",
			controls: [
				{
					type: DefaultControls.TextBox,
					name: "k",
					format: FormatDef.number,
					inputPattern: "[0-9]+"
				}
			]
		},
		{
			type: DefaultControls.LayoutBox,
			margin: "large",
			controls: [
				{
					type: DefaultControls.TextBox,
					name: "split",
					format: FormatDef.number,
					inputPattern: "[0-9]+"
				}
			]
		},
		{
			type: DefaultControls.LayoutBox,
			margin: "large",
			controls: [
				{
					type: DefaultControls.CheckBox,
					name: "isNorm"
				}
			]
		}
	]
});

module.exports = { view : view, options: options };
