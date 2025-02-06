package com.benjamin.servicios;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.benjamin.modelos.Artista;
import com.benjamin.repositorios.RepositorioArtistas;

@Service
public class ServicioArtistas {
	
	@Autowired
	private RepositorioArtistas repoArtistas;
	
	public List<Artista> obtenerTodosLosArtistas() {
		return repoArtistas.findAll();
	}
	
	public Artista obtenerArtistaPorId(Long id) {
		return repoArtistas.findById(id).orElse(null);
	}
	
	public Artista agregarArtista(Artista nuevoArtista) {
		return repoArtistas.save(nuevoArtista);
	}
}
