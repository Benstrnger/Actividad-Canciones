package com.benjamin.repositorios;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.benjamin.modelos.Artista;

@Repository
public interface RepositorioArtistas extends CrudRepository<Artista, Long>{

	List<Artista> findAll();
}
