<script lang="ts">
	import * as InputGroup from '$lib/components/ui/input-group/index.js';
	import { EyeIcon, EyeOffIcon } from '@lucide/svelte';

	let { value = $bindable<string>(), ...props } = $props();

	let showPassword = $state(false);
</script>

<InputGroup.Root>
	<InputGroup.Input {...props} type={showPassword ? 'text' : 'password'} bind:value />
	<InputGroup.Addon align="inline-end">
		<InputGroup.Button
			class="rounded-full"
			size="icon-xs"
			onclick={() => (showPassword = !showPassword)}
			aria-label={showPassword ? 'Hide Password' : 'Show Password'}
			aria-pressed={showPassword}
		>
			{#if showPassword}
				<EyeOffIcon />
			{:else}
				<EyeIcon />
			{/if}
		</InputGroup.Button>
	</InputGroup.Addon>
</InputGroup.Root>
