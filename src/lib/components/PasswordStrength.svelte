<script lang="ts">
	import { cn } from '$lib/utils';
	import { Progress } from '$lib/components/ui/progress';
	import zxcvbn from "zxcvbn";

	let { password }: { password: string } = $props();

	const SCORE_COLORS = [
		'[&>div]:bg-red-500',
		'[&>div]:bg-orange-500',
		'[&>div]:bg-yellow-500',
		'[&>div]:bg-green-500',
		'[&>div]:bg-emerald-500',
	];

	const score = $derived(zxcvbn(password).score);
	const percent = $derived((score + 1) / 5 * 100);
</script>

<Progress value={percent} class={cn('bg-muted', SCORE_COLORS[score])} />
