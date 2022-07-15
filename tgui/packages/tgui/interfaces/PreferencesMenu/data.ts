import { BooleanLike } from "common/react";
import { sendAct } from "../../backend";
import { Gender } from "./preferences/gender";

export enum Food {
  Alcohol = "ALCOHOL",
  Breakfast = "BREAKFAST",
  Cloth = "CLOTH",
  Dairy = "DAIRY",
  Fried = "FRIED",
  Fruit = "FRUIT",
  Grain = "GRAIN",
  Gross = "GROSS",
  Junkfood = "JUNKFOOD",
  Meat = "MEAT",
  Nuts = "NUTS",
  Pineapple = "PINEAPPLE",
  Raw = "RAW",
  Seafood = "SEAFOOD",
  Sugar = "SUGAR",
  Toxic = "TOXIC",
  Vegetables = "VEGETABLES",
  Sewage = "SEWAGE",
}

export enum JobPriority {
  Low = 1,
  Medium = 2,
  High = 3,
}

export type Name = {
  can_randomize: BooleanLike;
  explanation: string;
  group: string;
};

export type ServerSpeciesData = {
  name: string;
  icon: string;

  use_skintones: BooleanLike;
  sexes: BooleanLike;

  enabled_features: string[];

  liked_food: Food[];
  disliked_food: Food[];
  toxic_food: Food[];
};

export type Quirk = {
  description: string;
  icon: string;
  name: string;
  value: number;
};

export type QuirkInfo = {
  max_positive_quirks: number;
  quirk_info: Record<string, Quirk>;
  quirk_blacklist: string[][];
};

export type Language = {
  name: string;
  description: string;
  understand_type: number;
  icon: string;
  value_understand: number;
  value_speak: number;
  cant_learn_understand: boolean;
  cant_learn_speak: boolean;
  cant_forget: string;
};

export type Marking = {
  name: string;
  color: string;
  marking_index: string;
};

export type MarkingZone = {
  body_zone: string;
  name: string;
  markings_choices: string[];
  markings: Marking[];
  can_add_markings: boolean;
};

export type AugmentItem = {
  category: string;
  slot: string;
  name: string;
  description: string;
  can_use_styles: boolean;
  value: number;
  cant_buy: string;
};

export type AugmentSlot = {
  name: string;
  items: AugmentItem[];
};

export type AugmentCategory = {
  name: string;
  slots: AugmentSlot[];
};

export type SelectedAugmentSlot = {
  name: string;
  item: AugmentItem;
};

export type SelectedAugmentStyle = {
  name: string;
  style: string;
};

export type Birthsign = {
  name: string;
  description: string;
  icon: string;
  patron_saint: string;
  favored_profession: string;
  value: number;
  cant_buy: string;
};

export enum RandomSetting {
  AntagOnly = 1,
  Disabled = 2,
  Enabled = 3,
}

export enum JoblessRole {
  BeOverflow = 1,
  BeRandomJob = 2,
  ReturnToLobby = 3,
}

export enum GamePreferencesSelectedPage {
  Settings,
  Keybindings,
}

export const createSetPreference = (
  act: typeof sendAct,
  preference: string
) => (value: unknown) => {
  act("set_preference", {
    preference,
    value,
  });
};

export enum Window {
  Character = 0,
  Game = 1,
  Keybindings = 2,
}

export type PreferencesMenuData = {
  character_preview_type: string,
  character_preview_view: string;
  character_profiles: (string | null)[];

  character_preferences: {
    clothing: Record<string, string>;
    features: Record<string, string>;
    game_preferences: Record<string, unknown>;
    non_contextual: {
      random_body: RandomSetting,
      [otherKey: string]: unknown;
    };
    secondary_features: Record<string, unknown>;
    supplemental_features: Record<string, unknown>;

    names: Record<string, string>;

    misc: {
      gender: Gender;
      joblessrole: JoblessRole;
      species: string;
    };

    randomization: Record<string, RandomSetting>;
  };

  content_unlocked: BooleanLike,
  donator_rank: String,

  job_bans?: string[];
  job_days_left?: Record<string, number>;
  job_required_experience?: Record<string, {
    experience_type: string,
    required_playtime: number,
  }>;
  job_preferences: Record<string, JobPriority>;

  keybindings: Record<string, string[]>;
  overflow_role: string;

  selected_quirks: string[];
  selected_languages: Language[];
  unselected_languages: Language[];
  maximum_customization_points: number;
  language_balance: number;
  marking_parts: MarkingZone[];
  maximum_markings_per_limb: number;
  body_marking_sets: string[];
  selected_augments: SelectedAugmentSlot[];
  selected_augments_styles: SelectedAugmentStyle[];
  unselected_augments: AugmentCategory[];
  unselected_augments_styles: string[];
  augment_balance: number;
  selected_birthsign: Birthsign;
  unselected_birthsigns: Birthsign[];
  birthsign_balance: number;

  antag_bans?: string[];
  antag_days_left?: Record<string, number>;
  selected_antags: string[];

  active_slot: number;
  name_to_use: string;

  window: Window;
};

export type ServerData = {
  names: {
    types: Record<string, Name>;
  };
  quirks: QuirkInfo,
  random: {
    randomizable: string[];
  };
  species: Record<string, ServerSpeciesData>;
  [otheyKey: string]: unknown;
};
