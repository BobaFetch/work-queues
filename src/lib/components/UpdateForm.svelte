<script>
	export let part;

	let mutated = {
		part_number: part.part_number,
		run: String(part.run).replace(/\D/g, ''),
		po_num: part.po_num,
		item: String(part.item).replace(/\D/g, ''),
		comments: part.comments,
		expedite: 'N'
	};
	let add = part.comments == null;

	let submit = false;
	let url = '/api/comments';

	function handleSubmit(method) {
		try {
			fetch(url, {
				method,
				headers: {
					'content-type': 'application/json'
				},
				body: JSON.stringify(mutated)
			});
		} catch (err) {
			alert(`Error: ${err.message}`);
		} finally {
			submit = false;
			if (method == 'POST') {
				add = false;
				alert(`Comment Added: ${mutated.comments}`);
			} else if (method === 'PUT') {
				alert(`Comment Updated: ${mutated.comments}`);
			} else if (method === 'DELETE') {
				mutated.comments = null;
				alert('Comment Deleted');
				// add = true
			}
		}
	}
</script>

<form
	type="submit"
	class="new_comment"
	method="post"
	on:submit|preventDefault={() => handleSubmit('POST')}
>
	<label for="part_number"
		>Part Number:
		<input type="text" id="part_number" name="part_number" bind:value={mutated.part_number} />
	</label>

	<label for="run_number"
		>Run:
		<input type="text" id="run_number" name="run_number" bind:value={mutated.run} />
	</label>

	<label for="po_number"
		>PO#:
		<input type="text" bind:value={mutated.po_num} />
	</label>

	<label for="item_line"
		>Item:
		<input type="text" class="box-sm" bind:value={mutated.item} />
	</label>

	<label for="exp"
		>Customer Expedite:{' '}
		<input type="text" class="box-sm" bind:value={mutated.expedite} />
	</label>

	<label for="comments"
		>Comments:
		<textarea
			id="comments"
			name="comments"
			class="comments"
			rows="4"
			cols="50"
			bind:value={mutated.comments}
		/>
	</label>

	<div class="btn-group">
		{#if add}
			<input class="btn" type="submit" value={submit ? 'sending' : 'Add Comment'} />
		{:else}
			<button class="btn" on:click|preventDefault={() => handleSubmit('PUT')}>Update</button>
			<button class="btn btn-danger" on:click|preventDefault={() => handleSubmit('DELETE')}
				>Delete Comment</button
			>
		{/if}
	</div>
</form>

<style>
	.new_comment {
		display: flex;
		flex-direction: column;
		height: 350px;
		width: 400px;
		align-items: flex-start;
		justify-content: space-around;
		padding: 5px;
		background-color: #fbfbfb;
		border: 1px solid lightblue;
		box-shadow: 1.5px 1.5px slategray;
		border-radius: 15px;
	}
	label {
		padding: 5px;
	}

	.box-sm {
		width: 2rem;
		text-align: center;
	}

	.btn {
		align-self: center;
	}

	textarea {
		font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell,
			'Open Sans', 'Helvetica Neue', sans-serif;
		background-color: #fff;
		width: 95%;
		margin: 0 auto;
	}

	.btn-danger {
		color: red;
	}

	.btn-group {
		align-self: center;
	}
</style>
