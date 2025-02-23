package domain.tendencias;

import domain.catalogo.Cancion;
import domain.utils.Icono;

public class EnAuge extends Popularidad {
    private Integer cantReproducciones;
    
    @Override
    protected String leyenda(Cancion cancion){
        return cancion.getAlbum().getArtista().getNombre();
    }

    @Override
    protected String icono(){
        return Icono.ROCKET.texto();
    }

    @Override
    public void reproducir(Cancion cancion) {
        this.cantReproducciones++;


        // Transicion de EnAuge a EnTendencia
        if(this.cantReproducciones > 50000 && cancion.getCantLikes() > 20000){
            cancion.setPopularidad(new EnTendencia());
        }
    }
}
