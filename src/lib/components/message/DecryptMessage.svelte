<script lang="ts">
	import { Lock } from '@lucide/svelte';
	import { Button } from '$lib/components/ui/button';
	import { Label } from '$lib/components/ui/label';
	import PasswordInput from '$lib/components/PasswordInput.svelte';

	let { key = $bindable<string>(null) }: { key: string } = $props();

	let password = $state('');

	function decrypt(event: SubmitEvent) {
		event.preventDefault();
		key = password;
	}
</script>

<form onsubmit={decrypt} class="space-y-4">
	<div class="space-y-2">
		<Label for="password" class="flex items-center gap-2 text-sm font-medium">
			<Lock class="h-3 w-3" />
			Password
		</Label>
		<PasswordInput
			id="password"
			bind:value={password}
			placeholder="Enter password"
			class="w-full pr-10"
			name="password"
			autocomplete="off"
			autofocus
		/>
	</div>

	<Button type="submit" disabled={!password} class="w-full">Decrypt Message</Button>
</form>
