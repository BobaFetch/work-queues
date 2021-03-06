// import { commentRoute } from './apiRoutes';

export function convertTime(time: number): string {
	let days: number = Math.floor(time / 1440);
	let hours: number = Math.floor(time / 60);
	let mins: number = time % 60;
	let diff: string = '';

	if (days > 0) {
		diff += days === 1 ? `${days} day` : `${days} days`;
		return diff;
	} else if (hours > 0) {
		diff += hours === 1 ? `${hours} hour` : `${hours} hours`;
		return diff;
	}

	return mins === 0 ? `${mins} minute` : `${mins} minutes`;
}

export function handleFetch(url: string): [string] {
	let data: [string];
	fetch(url, {
		method: 'GET',
		mode: 'cors',
		headers: { 'content-type': 'application/json' }
	})
		.then((res) => res.json())
		.then((json) => {
			data = json;
		})
		.catch((err) => err);

	console.log(data);
	return data;
}

// export function handleComments(method: string, part: any): string {
// 	try {
// 		fetch(commentRoute, {
// 			method,
// 			headers: {
// 				'content-type': 'application/json'
// 			},
// 			body: JSON.stringify(part)
// 		});
// 	} catch (err) {
// 		return `Error: ${err.message}`;
// 	} finally {
// 		if (method === 'POST') {
// 			return `Comment Added: ${part.Comments}`;
// 		} else if (method === 'PUT') {
// 			return `Comment Updated: ${part.Comments}`;
// 		} else if (method === 'DELETE') {
// 			return 'Comment Deleted';
// 		}
// 	}
// }
