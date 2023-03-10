export default function Navbar() {
    return (
        <nav className="uk-navbar-container">
            <div className="uk-container">
                <div uk-navbar="true">
                    <div className="uk-navbar-left">
                        <ul className="uk-navbar-nav">
                            <li className="uk-active"><a href="#">Accueil</a></li>
                            <li><a href="#">Connexion</a></li>
                            <li><a href="#">Profil</a></li>
                            <li><a href="#">Administration</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>
    )
}