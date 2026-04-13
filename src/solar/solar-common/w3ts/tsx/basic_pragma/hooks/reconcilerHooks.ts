/** @noSelfInFile **/

import { hooks } from "../reconciler";
import { hookContext, hookMap } from "./context";

const oldBeforeRender = hooks.beforeRender;
const oldBeforeUnmount = hooks.beforeUnmount;

hooks.beforeRender = (instance) => {
	oldBeforeRender(instance);

	hookContext.currentInstance = instance;
	hookContext.currentIndex = 0;

	if (!hookMap.has(instance)) hookMap.set(instance, []);
};

hooks.beforeUnmount = (instance) => {
	oldBeforeUnmount(instance);

	const hooks = hookMap.get(instance);

	if (hooks)
		hooks.forEach(
			(hook) => hook.type === "effect" && hook.cleanup && hook.cleanup(),
		);
};
