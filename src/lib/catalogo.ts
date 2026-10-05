import { supabase } from './supabase';
import { stores as visualStores, restaurants as visualRestaurants, services as visualServices,
  type Store, type Promotion, type LocalSpace, type Restaurant, type ServiceItem, type Category } from '../data';

export let stores: Store[] = [];
export let promotions: Promotion[] = [];
export let localSpaces: LocalSpace[] = [];
export let restaurants: Restaurant[] = [];
export let services: ServiceItem[] = [];

const placeholder = 'data:image/svg+xml,' + encodeURIComponent('<svg xmlns="http://www.w3.org/2000/svg" width="600" height="400"><rect width="100%" height="100%" fill="#eee8f4"/><text x="50%" y="50%" text-anchor="middle" fill="#665577" font-size="24">Imagen pendiente</text></svg>');
const normalize = (value: string) => value.normalize('NFD').replace(/[\u0300-\u036f]/g, '').toLowerCase();
function category(value: string): Category {
  const mapping: Record<string, Category> = { moda:'moda', tecnologia:'tecnologia', entretenimiento:'entretenimiento', belleza:'belleza', servicios:'servicios', hogar:'hogar', supermercado:'supermercado', restaurantes:'restaurantes', departamental:'hogar' };
  return mapping[normalize(value)] ?? 'servicios';
}

export async function cargarCatalogo() {
  const tables = ['tiendas','promociones','locales','restaurantes','servicios'];
  const results = await Promise.all(tables.map(table => supabase.from(table).select('*').order('id')));
  results.forEach((result, index) => { if (result.error) throw new Error(`${tables[index]}: ${result.error.message}`); });
  const [shopRows, promoRows, spaceRows, restaurantRows, serviceRows] = results.map(result => result.data ?? []);
  const newStores: Store[] = shopRows.filter(r => r.activa).map(r => {
    const visual = visualStores.find(s => normalize(s.name) === normalize(r.nombre));
    return { id:visual?.id ?? `tienda-${r.id}`, name:r.nombre, category:category(r.categoria), description:'',
      local:r.local, floor:r.piso, image:visual?.image ?? placeholder, gallery:visual?.gallery ?? [],
      hours:r.horario, phone:r.telefono ?? '', tags:[], mapX:visual?.mapX ?? 300,
      mapY:visual?.mapY ?? 200, featured:visual?.featured ?? false };
  });
  const newPromotions: Promotion[] = promoRows.filter(r => r.activa).map(r => {
    const shopRow = shopRows.find(s => s.id === r.tienda_id);
    const shop = newStores.find(s => s.name === shopRow?.nombre);
    return { id:String(r.id), title:r.titulo, storeId:shop?.id ?? `tienda-${r.tienda_id}`, storeName:shop?.name ?? '',
      category:shop?.category ?? 'servicios', description:r.descripcion, discount:r.descuento,
      validUntil:r.vigencia, image:shop?.image ?? placeholder, terms:'Condiciones pendientes de registrar.' };
  });
  const newSpaces: LocalSpace[] = spaceRows.map(r => ({ id:String(r.id), code:r.codigo,
    area:Number(r.area_m2), dimensions:'Pendiente de registrar', floor:r.piso, zone:r.zona,
    features:[], price:Number(r.precio_mensual).toLocaleString('es-MX', { style:'currency', currency:'MXN', maximumFractionDigits:0 }) + ' MXN/mes', status:r.estado,
    image:placeholder, gallery:[placeholder], description:'', mapX:300, mapY:200 }));
  const newRestaurants: Restaurant[] = restaurantRows.filter(r => r.activo).map(r => ({
    id:String(r.id), name:r.nombre, subcategory:r.tipo, description:'', local:r.local, floor:r.piso,
    image:visualRestaurants.find(s => normalize(s.name) === normalize(r.nombre))?.image ?? placeholder,
    hours:r.horario, phone:'', priceRange:r.rango_precio, tags:[], featured:false }));
  const newServices: ServiceItem[] = serviceRows.filter(r => r.activo).map(r => ({
    id:String(r.id), name:r.nombre, subcategory:r.tipo, description:'', local:r.local, floor:r.piso,
    image:visualServices.find(s => normalize(s.name) === normalize(r.nombre))?.image ?? placeholder,
    hours:r.horario, phone:r.telefono ?? '', tags:[] }));
  stores = newStores; promotions = newPromotions; localSpaces = newSpaces;
  restaurants = newRestaurants; services = newServices;
}
