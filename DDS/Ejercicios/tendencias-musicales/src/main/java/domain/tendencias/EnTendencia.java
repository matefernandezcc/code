package domain.tendencias;

import domain.catalogo.Cancion;
import domain.utils.Icono;

public class EnTendencia extends Popularidad {

    @Override
    protected String leyenda(Cancion cancion){
        return cancion.getAlbum().getArtista().getNombre();
    }

    @Override
    protected String icono(){
        return Icono.FIRE.texto();
    }

    @Override
    public void reproducir(Cancion cancion) {
        //TODO
    }
}
