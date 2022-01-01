function y = basic_plot_selector(basic_plot_name,x)
  switch basic_plot_name
      case 'impulse'
          y=impulse_response(x);
      case {'unit','unit-step'}
          y=unit_response(x);
      case 'ramp'
          y=ramp_response(x);
      case {'rectangular','rect'}
          y=rectangular_response(x/2);
      otherwise 
          error('The function you want is not found.');
  end
end 