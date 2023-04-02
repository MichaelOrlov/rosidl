@# Included from rosidl_generator_c/resource/idl__description.c.em
@{
from rosidl_generator_type_description import GET_DESCRIPTION_FUNC
from rosidl_generator_type_description import GET_SOURCES_FUNC

def typename_to_c(typename):
  return typename.replace('/', '__')
}@

/// Define exported TypeDescriptions and TypeSources
@[for msg in [toplevel_type_description] + implicit_type_descriptions]@
@{
td_typename = msg['type_description']['type_name']
td_c_typename = typename_to_c(td_typename)
}@

const rosidl_runtime_c__type_description__TypeDescription *
@(td_c_typename)__@(GET_DESCRIPTION_FUNC)()
{
  static const rosidl_runtime_c__type_description__TypeDescription description = {
    {
      {NULL, 0, 0},
      {NULL, 0, 0},
    },
    {NULL, 0, 0},
  };
  return &description;
}

const rosidl_runtime_c__type_description__TypeSource__Sequence *
@(td_c_typename)__@(GET_SOURCES_FUNC)()
{
  static const rosidl_runtime_c__type_description__TypeSource__Sequence sources = {NULL, 0, 0};
  return &sources;
}
@[end for]@
