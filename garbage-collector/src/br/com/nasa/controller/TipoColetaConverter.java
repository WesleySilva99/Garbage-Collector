package br.com.nasa.controller;

import org.springframework.core.convert.converter.Converter;

import br.com.nasa.dao.TipoColetaDao;
import br.com.nasa.model.TipoColeta;

public class TipoColetaConverter implements Converter<String, TipoColeta> {

    public TipoColeta convert(String id) {

	if (id != null && !id.equals("")) {
	    TipoColetaDao dao = new TipoColetaDao();
	    TipoColeta tc = dao.pegarId(Integer.valueOf(id));
	    return tc;
	} else {
	    return null;
	}

    }
}