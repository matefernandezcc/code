package domain.tendencias;

import domain.catalogo.Cancion;
import domain.utils.Icono;

public class Normal extends Popularidad {
    private Integer cantReproducciones = 0;

    @Override
    protected String leyenda(Cancion cancion){
        return cancion.getAlbum().getArtista().getNombre();
    }

    @Override
    protected String icono(){
        return Icono.MUSICAL_NOTE.texto();
    }

    @Override
    public void reproducir(Cancion cancion) {
        this.cantReproducciones++;

        // Transicion de Normal a EnAuge
        if(this.cantReproducciones > 1000){
            cancion.setPopularidad(new EnAuge());
        }
    }
}
