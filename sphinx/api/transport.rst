Transport
=========

.. uml::

    interface transport {
    	write(data, data_len)
    	read(buf, bufsize)
    }

.. doxygenfile:: pl4/include/pl4/transport.h
   :project: libmcu
.. doxygenfile:: pl4/include/pl4/transport_interface.h
   :project: libmcu
