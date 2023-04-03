import Navbar from "./components/Navbar";

import affiche from "./images/affiche-43e-foire.jpg";

export default function App() {
	const downloadFile = () => {
		const url = "./documents/bulletin-inscription.odt";

		fetch(url).then(response => response.blob())
		.then(blob => {
			const blobURL = window.URL.createObjectURL(new Blob([blob]));
			const fileName = url.split("/").pop();
			const aTag = window.document.createElement("a");

			aTag.href = blobURL;
			aTag.setAttribute("download", fileName);

			window.document.body.appendChild(aTag);

			aTag.click();
			aTag.remove();
		})
	};

	return (
		<>
			<Navbar />

			<div className='uk-container uk-margin-top'>
				<p>Le site de l'AACCP est enfin en ligne, avec des nouveautés et des surprises à venir.</p>

				<p>Si vous souhaitez un avant-goût, rendez-vous sur la <a href="https://lukam90.github.io/">documentation</a>.</p>

				<p>En attendant, le prochain salon multi-collections se tiendra à <b>Huttendorf</b> le 7 mai 2023.</p>

				<p>Si ce n'est pas déjà fait, vous pouvez vous inscrire comme exposant en téléchargeant le <a onClick={() => downloadFile()}>bulletin d'inscription</a>.</p>

				<p>Vous pourrez ensuite le renvoyer à l'adresse indiquée.</p>

				<p>
					<img src={affiche} alt="Affiche 43ème Foire AACCP" width={"40%"} height={"40%"} />
				</p>
			</div>
		</>
	);
}