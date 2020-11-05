
// This file is an automatically generated and should not be edited

'use strict';

const options = [{"name":"data","type":"Data"},{"name":"dep","title":"Dependent Variable","type":"Variable"},{"name":"indep","title":"Independent Variable/s","type":"Variables"},{"name":"split","title":"Split train/test data (60-90)","type":"Number","min":60,"max":90,"default":75},{"name":"method","title":"Method","type":"List","options":["Class","Anova"],"default":"Class"},{"name":"Control","title":"Control Tree Growth (Minbucket)","type":"Number","min":1,"max":100,"default":15}];

const view = View.extend({
    jus: "2.0",

    events: [

	]

});

view.layout = ui.extend({

    label: "Classification using Decision Tree",
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
							name: "dep",
							maxItemCount: 1,
							isTarget: true
						}
					]
				},
				{
					type: DefaultControls.TargetLayoutBox,
					label: "Independent Variable/s",
					controls: [
						{
							type: DefaultControls.VariablesListBox,
							name: "indep",
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
					type: DefaultControls.ComboBox,
					name: "method"
				}
			]
		},
		{
			type: DefaultControls.LayoutBox,
			margin: "large",
			controls: [
				{
					type: DefaultControls.TextBox,
					name: "Control",
					format: FormatDef.number,
					inputPattern: "[0-9]+"
				}
			]
		}
	]
});

module.exports = { view : view, options: options };
