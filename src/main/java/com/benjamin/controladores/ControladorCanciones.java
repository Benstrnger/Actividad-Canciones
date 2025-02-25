package com.benjamin.controladores;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.benjamin.modelos.Artista;
import com.benjamin.modelos.Cancion;
import com.benjamin.servicios.ServicioArtistas;
import com.benjamin.servicios.ServicioCanciones;

import jakarta.validation.Valid;

@Controller
@RequestMapping("/canciones")
public class ControladorCanciones {
	
	@Autowired
	private ServicioCanciones serv;
	
	@Autowired
	private ServicioArtistas servArtist;
	
	@GetMapping("")
	public String desplegarCanciones(Model model) {
		
		List<Cancion> canciones = serv.obtenerTodasLasCanciones();
		
		model.addAttribute("canciones", canciones);
		
		return "canciones.jsp";
	}
	
	@GetMapping("/detalle/{idCancion}")
	public String desplegarDetalleCancion(@PathVariable("idCancion") Long id, Model model) {
		
		Cancion busqueda = serv.obtenerCancionPorId(id);
		
		model.addAttribute("cancion", busqueda);
		
		return "detalleCancion.jsp";
	}
	
	//Ruta 1
	@GetMapping("/formulario/agregar")
	public String formularioAgregarCancion(@ModelAttribute("cancion") Cancion newSong, Model model) {
		
		List<Artista> artistas = servArtist.obtenerTodosLosArtistas();
		model.addAttribute("artistas", artistas);
		
		return "agregarCancion.jsp";
	}
	
	//Ruta 2
	@PostMapping("/procesa/agregar")
	public String procesarAgregarCancion(@Valid @ModelAttribute("cancion") Cancion newSong,
										 BindingResult result,
										 Model model) {
		
		if(result.hasErrors()) {
			List<Artista> artistas = servArtist.obtenerTodosLosArtistas();
			model.addAttribute("artistas", artistas);
			return "agregarCancion.jsp";
		} else {
			serv.agregarCancion(newSong);
			return "redirect:/canciones";
		}
	}
	
	//Ruta 1 Actualizacion
	@GetMapping("/formulario/editar/{idCancion}")
	public String formularioEditarCancion(@ModelAttribute("cancion") Cancion EditSong,
										  @PathVariable("idCancion") Long id, Model model) {
		Cancion cancionActual = this.serv.obtenerCancionPorId(id);
		model.addAttribute("cancion", cancionActual);
		
		List<Artista> artistas = servArtist.obtenerTodosLosArtistas();
		model.addAttribute("artistas", artistas);
		
		return "editarCancion.jsp";
	}
	
	//Ruta 2 Actualizacion
	@PutMapping("/procesa/editar/{idCancion}")
	public String procesarEditarCancion(@Valid @ModelAttribute("cancion") Cancion EditSong,
										BindingResult result,
										@PathVariable("idCancion") Long id, Model model) {
		if(result.hasErrors()) {
			List<Artista> artistas = servArtist.obtenerTodosLosArtistas();
			model.addAttribute("artistas", artistas);
			return "editarCancion.jsp";
		}
		
		EditSong.setId(id);
		this.serv.actualizaCancion(EditSong);
		
		return "redirect:/canciones";
	}
	
	@DeleteMapping("/eliminar/{idCancion}")
	public String procesarEliminarCancion(@PathVariable("idCancion") Long id) {
		serv.eliminaCancion(id);
		
		return "redirect:/canciones";
	}
	
	
}














